package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.a00_exp.z01_vo.Member5;
import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Member;
// jspexp.a03_database.A04_MemberDao
public class A04_MemberDao {

	// DAO : database access object
	// 1. 데이터베이스 연결 처리
	private Connection con;
	// 2. 대화
	private Statement stmt;
	private PreparedStatement pstmt;
	// 3. 결과값 받는 객체..
	private ResultSet rs;

	// # 연결 처리 기능메서드.(공통 메서드-연결)
	public void setCon() throws SQLException {
		// 1. driver 메모리 로딩.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2. 특정 서버. 
		//    - 접속 정보 : 드라이버명:@ip:port:sid
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		// 드라이버 메니저 객체를 통해서 Connection 객체
		// 를 생성
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 성공 !!! ^^ ㅎㅎ");
	}

	/*
	 1. sql 작성
	 2. VO 객체 생성
	 3. 기능 메서드 선언.
	  	1) 요청에 의한 입력 : 매개변수로 활용.
	  	2) 데이터의 결과에 따라 리턴값 지정.
	  		- insert, update, delete : void
	  			ex) public void insertEmp(Emp ins)
	  		- 단위 변수나 한개의 데이터
	  			ex)
	  			회원이 등록된 여부 : select * from member where ..
	  			public boolean void isMember(String id, String pass)
	  			상품의 갯수 : select count(*) from member where ...
	  			public int memCount(Member sch)
	  			회원 상세정보 : select * from member where id=@@@
	  			public Member getMember(String id)
	  		- 여러개의 데이터
	  			ex)
	  			공지사항
	  			public ArrayList<Board> boardList(Board sch)
	  			회원정보리스트
	  			public ArrayList<Member> mlist(Member sch)
	  			
	  			
	 */
	
	
	
	/*
	 1. sql 작성
	 2. VO 객체 생성
	 3. 기능 메서드 선언.
	  	1) 요청에 의한 입력 : 매개변수로 활용.
	  	2) 데이터의 결과에 따라 리턴값 지정.
	  		- insert, update, delete : void
	  			ex) public void insertEmp(Emp ins)
	  		- 단위 변수나 한개의 데이터
	  			ex)
	  			회원이 등록된 여부 : select * from member where ..
	  			public boolean void isMember(String id, String pass)
	  			상품의 갯수 : select count(*) from member where ...
	  			public int memCount(Member sch)
	  			회원 상세정보 : select * from member where id=@@@
	  			public Member getMember(String id)
	  		- 여러개의 데이터
	  			ex)
	  			공지사항
	  			public ArrayList<Board> boardList(Board sch)
	  			회원정보리스트
	  			public ArrayList<Member> mlist(Member sch)
	  				  			
	 */
	public ArrayList<Member5> memberList(String id, String name){
		ArrayList<Member5> list=new ArrayList<Member5>();
		try {
			setCon();
			String sql = " SELECT * \r\n"
					+ "FROM member5\r\n"
					+ "WHERE id LIKE '%'||'"+id+"'||'%'\r\n"
					+ "AND name LIKE '%'||'"+name+"'||'%' "; 
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Member5 m = new Member5(rs.getString(1),
						rs.getString(2), rs.getString(3), 
						rs.getInt(4), rs.getString(5), 
						rs.getDate(6), rs.getString(7) );
				list.add(m);
			}
			System.out.println("데이터 건수:"+list.size());
			System.out.println("두번째행:"+list.get(1).getName());
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("##DB 관련 에러##");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("##기타 에러##");
			System.out.println(e.getMessage());
		}
		return list;
	}

	/*
		 1. sql 작성
		 2. VO 객체 생성
		 3. 기능 메서드 선언.
		  	1) 요청에 의한 입력 : 매개변수로 활용.
		  	2) 데이터의 결과에 따라 리턴값 지정.
		  		- insert, update, delete : void
		  			ex) public void insertEmp(Emp ins)
		  		- 단위 변수나 한개의 데이터
		  			ex)
		  			회원이 등록된 여부 : select * from member where ..
		  			public boolean void isMember(String id, String pass)
		  			상품의 갯수 : select count(*) from member where ...
		  			public int memCount(Member sch)
		  			회원 상세정보 : select * from member where id=@@@
		  			public Member getMember(String id)
		  		- 여러개의 데이터
		  			ex)
		  			공지사항
		  			public ArrayList<Board> boardList(Board sch)
		  			회원정보리스트
		  			public ArrayList<Member> mlist(Member sch)
		  			
		  			
		 */
		
		
		
		/*
		 1. sql 작성
		 2. VO 객체 생성
		 3. 기능 메서드 선언.
		  	1) 요청에 의한 입력 : 매개변수로 활용.
		  	2) 데이터의 결과에 따라 리턴값 지정.
		  		- insert, update, delete : void
		  			ex) public void insertEmp(Emp ins)
		  		- 단위 변수나 한개의 데이터
		  			ex)
		  			회원이 등록된 여부 : select * from member where ..
		  			public boolean void isMember(String id, String pass)
		  			상품의 갯수 : select count(*) from member where ...
		  			public int memCount(Member sch)
		  			회원 상세정보 : select * from member where id=@@@
		  			public Member getMember(String id)
		  		- 여러개의 데이터
		  			ex)
		  			공지사항
		  			public ArrayList<Board> boardList(Board sch)
		  			회원정보리스트
		  			public ArrayList<Member> mlist(Member sch)
		  				  			
		 */
		// 한개 데이터 처리
		public Emp getEmp(int empno){
			Emp emp=null;
			try {
				setCon();
				String sql = "SELECT * FROM emp2 where empno= "+empno;
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					emp = new Emp(rs.getInt("empno"), 
							rs.getString(2),rs.getString(3),
							rs.getInt(4), rs.getDate("hiredate"),
							rs.getDouble(6), rs.getDouble(7),
							rs.getInt(8) );
				}
				rs.close();
				stmt.close();
				con.close();
	//			5. 예외 처리..								
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("##DB 관련 에러##");
				System.out.println(e.getMessage());
			} catch(Exception e) {
				System.out.println("##기타 에러##");
				System.out.println(e.getMessage());
			}
		
			return emp;
		}
		// 데이터가 있을 때, 데이터가 할당된 Member 객체를 return
		// 데이터가 없을 때, null을 return
		public Member login(Member login) {
			Member m=null;
			try {
				setCon();
				String sql = "SELECT * \r\n"
						+ "FROM member5 \r\n"
						+ "WHERE id=?\r\n"
						+ "AND pass=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, login.getId());
				pstmt.setString(2, login.getPass());
				rs = pstmt.executeQuery();
				if(rs.next()) {   // ~15:48
					System.out.println("##데이터 있음 ");
					m = new Member(rs.getString("id"),
								   rs.getString("pass"),
								   rs.getInt("point"),
								   rs.getString("name"),
							       rs.getString("auth"));
				}else {
					System.out.println("##데이터 없음 ");
				}
				System.out.println("데이터가 있음 !이름:"+m.getName());
				
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러"+e.getMessage());
			}catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("일반에러"+e.getMessage());
			}
			return m;
		}
		// 데이터가 있는지 여부를 boolean을 확인..
		public boolean hasMember(String id) {
			boolean hasMem=false;
			try {
				setCon();
				String sql = "SELECT * FROM MEMBER5 m WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				hasMem = rs.next(); 
				System.out.println("## 데이터가 있을까??"+hasMem);
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("DB에러"+e.getMessage());
			}catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("일반에러"+e.getMessage());
			}
			return hasMem;
		}

		// SELECT * FROM MEMBER5 m WHERE id=?
		public static void main(String[] args) {
			// TODO Auto-generated method stub
		
		}

}
