package membermanager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.UserInfo;

public class MemeberDao {

	private  MemeberDao() {}
	
	private static MemeberDao dao= new MemeberDao();
	
	public static MemeberDao getInstance() {
		return dao;
		}
	
	public UserInfo Select(Connection conn, String uId) {
		UserInfo user =new UserInfo();
		PreparedStatement pstmt=null;
		
		ResultSet rs=null;
		String sql="select*from userinfo where mid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, uId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserInfo();
				user.setIdx(rs.getString(1));
				user.setuId(rs.getString(2));
				user.setuPw(rs.getString(3));
				user.setuName(rs.getString(4));
				user.setuPhoto(rs.getString(5));
				user.setRegdate(rs.getDate(6));
				}
			} catch (SQLException e) {
				e.printStackTrace();
		}
		
		
		
		return user;
	}

}
