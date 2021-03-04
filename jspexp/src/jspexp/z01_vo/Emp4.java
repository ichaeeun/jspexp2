package jspexp.z01_vo;

import java.util.Date;

public class Emp4 {
	private String ename;
	private Date hiredate;
	private int workdate;
	public Emp4() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp4(String ename, Date hiredate, int workdate) {
		super();
		this.ename = ename;
		this.hiredate = hiredate;
		this.workdate = workdate;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int getWorkdate() {
		return workdate;
	}
	public void setWorkdate(int workdate) {
		this.workdate = workdate;
	}
	
}
