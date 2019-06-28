package member;

import java.util.Date;

public class LoginInfo {
	private String uId;
	private String uName;
	private String uPhoto;
	private Date regDate;

	public LoginInfo(String uId, String uName, String uPhoto, Date regDate) {
		this.uId = uId;
		this.uName = uName;
		this.uPhoto = uPhoto;
		this.regDate = regDate;
	}



	@Override
	public String toString() {
		return "LoginInfo [uId=" + uId + ", uName=" + uName + ", uPhoto=" + uPhoto + ", regDate=" + regDate + "]";
	}



	public String getuId() {
		return uId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getuName() {
		return uName;
	}

	public String getuPhoto() {
		return uPhoto;
	}
}
