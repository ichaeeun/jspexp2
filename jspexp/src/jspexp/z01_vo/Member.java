package jspexp.z01_vo;
// jspexp.z01_vo.Member
public class Member {
	private String id;
	private String pass;
	private int point;
	// 아이디, 패스워드, 이름, 포인트, 권한
	private String name;
	private String auth;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pass, int point, String name, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.point = point;
		this.name = name;
		this.auth = auth;
	}


	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}


	public Member(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
