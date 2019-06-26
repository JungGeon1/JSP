package member;

import java.util.Date;

public class UserInfo {
	private String uId;
	private String uPw;
	private String uName;
	private String uPhoto;
	private Date regdate;

	public UserInfo() {
		this.regdate=new Date();
	}

	public UserInfo(String uId, String uPw, String uName, String uPhoto, Date regdate) {
		super();
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.uPhoto = uPhoto;
		this.regdate = regdate;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPhoto() {
		return uPhoto;
	}

	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}

	@Override
	public String toString() {
		return "UserInfo [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uPhoto=" + uPhoto + "]";
	}
//memberinfo객체->loginInfo 개겣반환
	
	// 화면 결과 출력을 위한 HTML 코드 반환
	public String makeHtmlDiv() {
		String str = "";
		
		str += "<div class=\"mInfor\"> \n";
		str += "	<h3> \n";
		str += "		" + uId + "("+ uName +")\n";
		str += "	</h3> \n";
		str += "	<p> \n";
		str += "		"+ uPw;
		str += "	</p> \n";
		str += "</div> \n";
		
		
		
		return str;
	}
	
	public LoginInfo toLoginInfo() {

		return new LoginInfo(uId, uName, uPhoto);
	}
	
}
