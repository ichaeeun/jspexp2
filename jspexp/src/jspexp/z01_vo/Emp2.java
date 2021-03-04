package jspexp.z01_vo;

public class Emp2 {
	private int no;
	private String name;
	private String job;
	private int salary;
	private int deptno;
	public Emp2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp2(String job) {
		super();
		this.job = job;
	}
	public Emp2(int no, String name, String job, int salary, int deptno) {
		super();
		this.no = no;
		this.name = name;
		this.job = job;
		this.salary = salary;
		this.deptno = deptno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
	
}
