package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import member.UserInfo;
import membermanager.dao.MemeberDao;

public class GetListService {
	
	MemeberDao dao= MemeberDao.getInstance();
	
	List<UserInfo> list=null;
	public List<UserInfo> gListService(){
		
		Connection conn;
		try {
			conn = ConnectionProvider.getConnection();
			list=dao.showList(conn);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return list;
	}
	
}
