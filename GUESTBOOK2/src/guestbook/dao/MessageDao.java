package guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import guestbook.model.Message;
import jdbc.JdbcUtil;

public class MessageDao {

	private static MessageDao dao = new MessageDao();

	public static MessageDao getInstance() {
		return dao;
	}

	private MessageDao() {
	}

//db에 저장해주는 메소드
	public int insert(Connection conn, Message message) {

		int rcnt = 0;
		PreparedStatement pstmt = null;

		String sql = "insert INTO guestbook_message" + "(message_id,guest_name, password,message)"
				+ "VALUES(gm_mid_seq.nextval,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());

			rcnt = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return rcnt;
	}

	// db에서 기본키값을 매개로 정보를 가져와 유즈빈에 저장해주는 메소드->delete용
	public Message select(Connection conn, int messageId) {
		Message message = new Message();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from guestbook_message where message_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				message = new Message();
				message.setId(rs.getInt(1));
				message.setGuestName(rs.getString(2));
				message.setPassword(rs.getString(3));
				message.setMessage(rs.getNString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return message;

	}

	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;

		int totalCnt = 0;
		// 데이터행의개수로 총 저장개수 반환
		String sql = "select count(*) from guestbook_message  ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalCnt;
	}

	// 한 페이지에 보여줄 리스트를 구함
	public List<Message> selectList(Connection conn, int firstRow, int endRow) {

		List<Message> list = new ArrayList<Message>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select message_id, guest_name, password, message from ( "
				+ " select rownum rnum, message_id, guest_name, password, message from ( "
				+ " select * from guestbook_message m order by m.message_id desc " + " ) where rownum <= ? "
				+ ") where rnum >= ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Message msg = new Message();
				msg.setId(rs.getInt(1));
				msg.setGuestName(rs.getString(2));
				msg.setPassword(rs.getString(3));
				msg.setMessage(rs.getString(4));
				list.add(msg);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int deleteMessage(Connection conn, int messageId) throws SQLException {
		int resultCnt=0;
		// PreparedStatement 객체생성
		PreparedStatement pstmt = null;

		String sql = "delete from guestbook_message where message_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			resultCnt=pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

}
