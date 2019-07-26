package membermanager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import member.UserInfo;

public class MemeberDao {

	private MemeberDao() {
	}

	private static MemeberDao dao = new MemeberDao();

	public static MemeberDao getInstance() {
		return dao;
	}

	public UserInfo Select(Connection conn, String uId) {
		UserInfo user = new UserInfo();
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		String sql = "select*from userinfo where mid=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	public int insertMember(UserInfo userInfo, Connection conn) {
		
		int resultCnt = 0;
		try {

			PreparedStatement pstmt = null;


			String sql = "insert into userinfo(idx,mid,mpw,mname,mphoto) values(userinfo_idx_seq.nextval,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userInfo.getuId());
			pstmt.setString(2, userInfo.getuPw());
			pstmt.setString(3, userInfo.getuName());
			pstmt.setString(4, userInfo.getuPhoto());
			resultCnt = pstmt.executeUpdate();
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	
	
	public List<UserInfo> showList( Connection conn){
		List<UserInfo> list=new ArrayList<UserInfo>();
		ResultSet rs=null;
		Statement stmt=null;
		String sql="select idx,mid,mpw,mname,mphoto,regdate\r\n" + 
				"from(select * from userinfo order by idx)";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				UserInfo info=new UserInfo();
				info.setIdx(rs.getString(1));
				info.setuId(rs.getString(2));
				info.setuPw(rs.getString(3));
				info.setuName(rs.getString(4));
				info.setuPhoto(rs.getString(5));
				info.setRegdate(rs.getDate(6));
				list.add(info);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	return list;
	}

}
