package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteMessageService {

	private DeleteMessageService() {
	}

	private static DeleteMessageService service = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return service;
	}

	public int deleetMessage(int messageId, String password)
			throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		int resultCnt = 0;

		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();
			// 트랜잭션 처리
			// 오토커밋이 자동으로 작동되지 못하게 하려면 setAutoCommit(false); 로 지정해야 한다.->jsp는 자동으로 오토커밋이 됌
			conn.setAutoCommit(false);
			// 1. 전달받은 게시물 아이디로 게시물 확인
			// Message Dao 필요
			MessageDao dao = MessageDao.getInstance();
			Message message = dao.select(conn, messageId);
			if (message == null) {
				throw new MessageNotFoundException("메세지가 존재하지 않습니다 :" + messageId);
			}
			// 2. 게시물이 존재하지 않으면 예외 처리
			if (!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀먼호가 일치하지 않습니다.");
			}
			// 3. 비밀번호 비교
			if (!message.matchPassword(password)) {
				throw new InvalidMessagePasswordException("비밀먼호가 일치하지 않습니다.");
			}

			// 5. 비밀번호가 일치하면 정상 처리(삭제)-> commit

			resultCnt= dao.deleteMessage(conn, messageId);
			// 정상처리
			conn.commit();

		} catch (SQLException e) {
			// 트랜잭션의 롤백처리
			JdbcUtil.roolback(conn);
			e.printStackTrace();
			throw e;
		} catch (MessageNotFoundException e) {
			JdbcUtil.roolback(conn);
			e.printStackTrace();
			throw e;
		} catch (InvalidMessagePasswordException e) {
			JdbcUtil.roolback(conn);
			e.printStackTrace();
			throw e;
		}

		return resultCnt;
	}

}
