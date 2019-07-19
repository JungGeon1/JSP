package company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import company.Company;
import jdbc.ConnectionProvider;;

public class CompanyDAO {

	private Connection conn ;

	private ResultSet rs;
	private PreparedStatement pstmt;

	public CompanyDAO() {
		try {

			/*
			 * String dbURL =
			 * "jdbc:mysql://localhost:3306/BBL?useUnicode = true & useJDBCCompliantTimezoneShift=true & useLegacyDatetimeCode = false & serverTimezone=UTC"
			 * ;
			 * 
			 * String dbID = "root"; String dbPassword = "admin";
			 * 
			 * Class.forName("com.mysql.cj.jdbc.Driver");
			 */
			conn = ConnectionProvider.getConnection();

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
			
			//  -1: ���̵� ���� / 1: �α��� ���� / 0: �α��� ���� / -2: �����ͺ��̽� ����  
			
			
			
			if(rs.next()) {

				if(rs.getString(1).equals(company_Pw)) {
					return 1; // 1�� ��ȯ�ϹǷν� �α��� ������ �˸���.
				} else {
					
					return 0; // ��й�ȣ ����ġ
				}
				
			} 
			return -1; // ���̵� ����.
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // �����ͺ��̽� ������ ���Ѵ�.
	}

	public int join(Company com) {
		
		// sql�� �������� ����!
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
		return -2; // ����
	}
	
	
}
