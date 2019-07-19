package user;

// 하나의 데이터를 관리하고 처리할 수 있는 기법을 JSP에서 구현하는 것 --> 자바빈즈
public class User {

	private String user_ID; // varchar(50)
	private String user_Pw; // varchar(30)
	private String user_Name; //varchar(50)
	private String user_Gen; // char(2)
	private String user_Email; // varchar(40)
	
	public User() {}

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}

	public String getUser_Pw() {
		return user_Pw;
	}

	public void setUser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getUser_Gen() {
		return user_Gen;
	}

	public void setUser_Gen(String user_Gen) {
		this.user_Gen = user_Gen;
	}

	public String getUser_Email() {
		return user_Email;
	}

	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}

	
	
	
}
