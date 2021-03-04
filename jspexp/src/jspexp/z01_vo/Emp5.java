package jspexp.z01_vo;

public class Emp5 {
	// 1. Emp 다 나열..
	// 2. 선언된 Emp 객체 활용.
	private Emp e;
	private int part;
	public Emp5() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp5(Emp e, int part) {
		super();
		this.e = e;
		this.part = part;
	}
	public Emp getE() {
		return e;
	}
	public void setE(Emp e) {
		this.e = e;
	}
	public int getPart() {
		return part;
	}
	public void setPart(int part) {
		this.part = part;
	}
	
	
}
