package jspexp.a00_exp.z01_vo;

import java.util.Date;

public class Member5 {
	private String id;
	private String pass;
	private String name;
	private int point;
	private String address;
	private Date regdte;
	private String auth;
	// id, pass, name, point, address, regdte, auth
	public Member5() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member5(String id, String pass, String name, int point, String address, Date regdte, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.point = point;
		this.address = address;
		this.regdte = regdte;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
