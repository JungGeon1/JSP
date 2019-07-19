package company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import company.Company;;

public class CompanyDAO {

	private Connection conn ;

	private ResultSet rs;
	private PreparedStatement pstmt;

	public CompanyDAO() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/BBL?useUnicode = true & useJDBCCompliantTimezoneShift=true & useLegacyDatetimeCode = false & serverTimezone=UTC";
					
			String dbID = "root";
			String dbPassword = "admin";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public int login(String company_ID,String company_Pw) {
		
		String SQL = "SELECT company_Pw FROM COMPANY WHERE company_ID = ? "; 
		
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, company_ID);
			rs = pstmt.executeQuery(); 
			
			//  -1: 아이디 없음 / 1: 로그인 성공 / 0: 로그인 실패 / -2: 데이터베이스 오류  
			
			
			
			if(rs.next()) {

				if(rs.getString(1).equals(company_Pw)) {
					return 1; // 1을 반환하므로써 로그인 성공을 알린다.
				} else {
					
					return 0; // 비밀번호 불일치
				}
				
			} 
			return -1; // 아이디 없음.
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // 데이터베이스 오류를 뜻한다.
	}

	public int join(Company com) {
		
		// sql문 참조변수 생성!
		String SQL = "INSERT INTO COMPANY VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, com.getCompany_ID());
			pstmt.setString(2, com.getCompany_Pw());
			pstmt.setString(3, com.getCompany_Name());
			pstmt.setString(4, com.getCompany_Email());
			pstmt.setString(5, com.getCompany_Num());

			return pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; // 오류
	}
	
	
}
