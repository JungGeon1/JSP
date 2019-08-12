package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.UserInfo;
import membermanager.dao.MemeberDao;

public class InsertService {

		public int insert(UserInfo userInfo) {
		MemeberDao dao=MemeberDao.getInstance();
		int cnt=0;
		Connection conn;
		try {
			conn = ConnectionProvider.getConnection();
			cnt=dao.insertMember(userInfo,conn);
		} catch (SQLException e) {

			e.printStackTrace();
		}
	
		
		return cnt;
		
		
	}
}
