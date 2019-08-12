package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.UserInfo;
import membermanager.dao.MemeberDao;

public class LoginProcessService {

	
	public UserInfo lpService(String uId) {
		MemeberDao dao= MemeberDao.getInstance();
		Connection conn;
		UserInfo info= null;
		try {
			conn = ConnectionProvider.getConnection();

			info= dao.Select(conn, uId);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return info;
		
	}
	
}
