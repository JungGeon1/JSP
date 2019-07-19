package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ConnectionProvider;

// �����ͺ��̽� ���� ��ü -- ���������� �����ͺ��̽����� ȸ�������� �ҷ����ų� �����ͺ��̽��� ������ �ְ��� �Ҷ� ���
public class UserDAO {

	// Connection�̶� ? �����ͺ��̽��� �����ϰ� ���ֱ� ���� �ϳ��� ��ü�� �ǹ��Ѵ�. 
	// conn�̶� ���������� ����������ν� �����ͺ��̽��� ������ �� �ֵ��� ���ش�.
	private Connection conn ;

	private ResultSet rs;
	private PreparedStatement pstmt;
	

	public UserDAO() {
		try {
			

			
			// url�Է� -->  "jdbc:���α׷�(mysql)://localhost:��Ʈ��ȣ/���̺��̸�";
			/*
			 * String dbURL =
			 * "jdbc:mysql://localhost:3306/BBL?useUnicode = true & useJDBCCompliantTimezoneShift=true & useLegacyDatetimeCode = false & serverTimezone=UTC"
			 * ;
			 * 
			 * String dbID = "root"; String dbPassword = "admin";
			 * 
			 * // driver ���� --> "com.mysql.jdbc.Driver
			 * Class.forName("com.mysql.cj.jdbc.Driver"); conn =
			 * DriverManager.getConnection(dbURL, dbID, dbPassword);
			 */		
			conn = ConnectionProvider.getConnection();

			
		} catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	// �α����� �õ��ϴ� �޼��� (�Լ�)  ---> �Ű�����(����)���� ���̵�� ��й�ȣ�� �޾� �α����� �õ��Ѵ�.
	public int login(String user_ID,String user_Pw) {
		
		// �ش����̺��� �н����带 ã�´�. userID = ? �ϰ�� �н����� �˻� ! 
		String SQL = "SELECT user_Pw FROM USER WHERE user_ID = ? "; 
		
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_ID);
			rs = pstmt.executeQuery(); 
			
			//  -1: ���̵� ���� / 1: �α��� ���� / 0: �α��� ���� / -2: �����ͺ��̽� ����  
						
			if(rs.next()) {
				
				// ��й�ȣ�� üũ���ش�.
				// 1 = �α��� ���� ,  0 = �α��� ���� !!!!!

				if(rs.getString(1).equals(user_Pw)) {
					return 1; // 1�� ��ȯ�ϹǷν� �α��� ������ �˸���.
				} else {

					return 0; // ��й�ȣ ����ġ
				}
				
			} 
			return -1; // ���̵� ����.
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // ����
	}
	
	
	// ȸ������ �޼���
	public int join(User user) {
		

		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUser_ID());
			pstmt.setString(2, user.getUser_Pw());
			pstmt.setString(3, user.getUser_Name());
			pstmt.setString(4, user.getUser_Gen());
			pstmt.setString(5, user.getUser_Email());

			return pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; // ����
	}
	
	
}
