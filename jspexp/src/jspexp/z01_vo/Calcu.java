package jspexp.z01_vo;

public class Calcu {
	private int num01;
	private int num02;
	public Calcu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Calcu(int num01, int num02) {
		super();
		this.num01 = num01;
		this.num02 = num02;
	}
	public int getNum01() {
		return num01;
	}
	public void setNum01(int num01) {
		this.num01 = num01;
	}
	public int getNum02() {
		return num02;
	}
	public void setNum02(int num02) {
		this.num02 = num02;
	}
	public int getPlus() {
		return num01+num02;
	}
}
