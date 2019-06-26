package member;

public class loginInfo {

	private String id;
	private String name;
	private String photo;
	private String nicnmae;
	private int grade;
	private String pNum;

	public loginInfo(String id) {

		this.id = id;
		this.name = "손흥민";
		this.photo = "noimg";
		this.nicnmae = "흥민흥민!";
		this.grade = 1;
		this.pNum = "000-0000-0000";

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getNicnmae() {
		return nicnmae;
	}

	public void setNicnmae(String nicnmae) {
		this.nicnmae = nicnmae;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getpNum() {
		return pNum;
	}

	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
}
