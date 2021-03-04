package jspexp.a03_database;
// jspexp.a03_database.A01_Dao
//getEmp(int empno
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jspexp.a00_exp.z01_vo.Member5;
import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Emp3;
import jspexp.z01_vo.Emp4;
import jspexp.z01_vo.Emp5;
import jspexp.z01_vo.JobSalary;
// A01_Dao.empList2
public class A01_Dao { // DAO : database access object
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
	 2. VO 객체 생성 : sql의 결과값에 따른 컬럼명과 type을 확인하여 작성.
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
	
	
	
	// 조회 처리 메서드..(매개변수 없는 처리)
	// jspexp.a03_database.A01_Dao  empList()
	public ArrayList<Emp> empList(){
		ArrayList<Emp> list=new ArrayList<Emp>();
//		1. 공통연결메서드호출
		try {
			setCon();
//			2. Statement 객체 생성.(연결객체-Connection)
			String sql = "SELECT * FROM emp2"; 
			// ; 빼주세요. ^^(주의)
			stmt = con.createStatement();
//			3. ResultSet 객체 생성.(대화객체-Statement)
			rs = stmt.executeQuery(sql);
			/*
			System.out.println(rs.next()); 
			// 1행에 데이터가 있는지 여부를 확인
			// 1행의 데이터를 사용할 준비
			String s1 = ""+25;
			String s2 = ""+true;
			System.out.println("1행 1열:"+rs.getInt(1));
			System.out.println("1행 2열:"+rs.getString(2));
			// rs.get데이터유형(컬럼의 순서)
			System.out.println(rs.next()); 
			// 2행에 데이터가 있는지 여부를 확인
			// 2행의 데이터를 사용할 준비
				
			System.out.println("2행 JOB열:"+rs.getString("JOB"));
			// rs.get데이터유형(컬럼명)
			System.out.println("2행 SAL열:"+rs.getDouble("SAL"));
			*/
			int cnt =1;
			while(rs.next()) {			
				System.out.print(cnt+++":"+rs.getInt(1)+"\t");
				System.out.print(rs.getString("ename")+"\t");
				System.out.print(rs.getString("job")+"\t");
				System.out.print(rs.getInt("mgr")+"\t");
				System.out.print(rs.getDate("hiredate")+"\t");
				System.out.print(rs.getDouble("sal")+"\t");
				System.out.print(rs.getDouble("comm")+"\t");
				System.out.print(rs.getInt("deptno")+"\n");
				
				// 1. 객체 생성과 할당.
				//    int empno, String ename, String job, int mgr,
				//    Date hiredate, double sal, double comm, 
				//    int deptno
				Emp e = new Emp(rs.getInt("empno"), 
						rs.getString(2),rs.getString(3),
						rs.getInt(4), rs.getDate("hiredate"),
						rs.getDouble(6), rs.getDouble(7),
						rs.getInt(8) );
				//  2. ArrayList에 할당.
				list.add(e);
			}
			System.out.println("객체의 갯수:"+list.size());
			System.out.println("두번째 행의 ename:"+list.get(1).getEname());
			// ex1) deptList() 기능메서드를 통해 ArrayList<Dept>데이터를 담아서
			//      데이터건수와 두번째 부서이름을 출력하세요.. ~11:45
//				- next() : 행단위 변경
//				- getXXX("컬럼명") :열단위 호출.
//				==> 1개의 데이터인 경우 : VO(단일)
//				==> 다중의 행단위 여러 데이터인 경우 : ArrayList<VO>
//				마지막에 객체의 참조변수를 return;
//			4. 자원의 해제
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
	
		return list;
	}
	/*
		 1. sql 작성
		 2. VO 객체 생성 : sql의 결과값에 따른 컬럼명과 type을 확인하여 작성.
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
		
		
		
		// 조회 처리 메서드..(매개변수 없는 처리)
		// jspexp.a03_database.A01_Dao  deptAvgSal()
		public ArrayList<Emp> deptAvgSal(){
			ArrayList<Emp> list=new ArrayList<Emp>();
			try {
				setCon();
				String sql = "SELECT deptno, max(hiredate) hiredate,"
						+ " avg(sal) sal\r\n"
						+ "FROM emp2\r\n"
						+ "GROUP BY deptno\r\n"
						+ "ORDER BY deptno"; 
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {			
					Emp e = new Emp(rs.getInt(1), 
							rs.getDate(2), 
							rs.getDouble(3));
					list.add(e);
				}
				rs.close();
				stmt.close();
				con.close();			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
	SELECT deptno, max(hiredate) hiredate, avg(sal) sal
	FROM emp
	GROUP BY deptno
	ORDER BY deptno
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
		// 조회 처리 메서드..(매개변수 없는 처리)
		public ArrayList<Emp> empList(String ename, String job){
			ArrayList<Emp> list=new ArrayList<Emp>();
	//		1. 공통연결메서드호출
			try {
				setCon();
	//			2. Statement 객체 생성.(연결객체-Connection)
				String sql = "SELECT *\r\n"
						+ "	FROM emp2 e \r\n"
						+ "	WHERE ename LIKE '%'||upper('"+ename+"')||'%'\r\n"
						+ "	AND job  LIKE '%'||upper('"+job+"')||'%'"
						+ "	ORDER BY empno desc "; 
				// ; 빼주세요. ^^(주의)
				System.out.println(sql);
				stmt = con.createStatement();
	//			3. ResultSet 객체 생성.(대화객체-Statement)
				rs = stmt.executeQuery(sql);
				/*
				System.out.println(rs.next()); 
				// 1행에 데이터가 있는지 여부를 확인
				// 1행의 데이터를 사용할 준비
				String s1 = ""+25;
				String s2 = ""+true;
				System.out.println("1행 1열:"+rs.getInt(1));
				System.out.println("1행 2열:"+rs.getString(2));
				// rs.get데이터유형(컬럼의 순서)
				System.out.println(rs.next()); 
				// 2행에 데이터가 있는지 여부를 확인
				// 2행의 데이터를 사용할 준비
					
				System.out.println("2행 JOB열:"+rs.getString("JOB"));
				// rs.get데이터유형(컬럼명)
				System.out.println("2행 SAL열:"+rs.getDouble("SAL"));
				*/
				int cnt =1;
				while(rs.next()) {
					
					System.out.print(cnt+++":"+rs.getInt(1)+"\t");
					System.out.print(rs.getString("ename")+"\t");
					System.out.print(rs.getString("job")+"\t");
					System.out.print(rs.getInt("mgr")+"\t");
					System.out.print(rs.getDate("hiredate")+"\t");
					System.out.print(rs.getDouble("sal")+"\t");
					System.out.print(rs.getDouble("comm")+"\t");
					System.out.print(rs.getInt("deptno")+"\n");
					
					// 1. 객체 생성과 할당.
					//    int empno, String ename, String job, int mgr,
					//    Date hiredate, double sal, double comm, 
					//    int deptno
					Emp e = new Emp(rs.getInt("empno"), 
							rs.getString(2),rs.getString(3),
							rs.getInt(4), rs.getDate("hiredate"),
							rs.getDouble(6), rs.getDouble(7),
							rs.getInt(8) );
					//  2. ArrayList에 할당.
					list.add(e);
				}
				System.out.println("객체의 갯수:"+list.size());
				System.out.println("두번째 행의 ename:"+list.get(1).getEname());
				// ex1) deptList() 기능메서드를 통해 ArrayList<Dept>데이터를 담아서
				//      데이터건수와 두번째 부서이름을 출력하세요.. ~11:45
	//				- next() : 행단위 변경
	//				- getXXX("컬럼명") :열단위 호출.
	//				==> 1개의 데이터인 경우 : VO(단일)
	//				==> 다중의 행단위 여러 데이터인 경우 : ArrayList<VO>
	//				마지막에 객체의 참조변수를 return;
	//			4. 자원의 해제
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
			// 조회 처리 메서드..(매개변수 없는 처리)
/*
# PreparedStatement 객체 활용하기.
1. SQL의 틀을 미리 정해 놓고, 나중에 값을 지정하는 방식.
 	select *
 	from emp
 	where ename like '%'||?||'%'
 	and job like '%'|| ? ||'%'
  	pstmt.setString(1, "홍"); ?의 순서 1부터 붙여서 사용한다.
  	pstmt.setString(2, "A");
2. 왜 사용하는가?
  	1) sql injection을 막기위해 사용된다.
  	2) db 서버의 sql 해석 속도를 향상시켜 빠른 처리를 한다.
  	
 * */		
			public ArrayList<Emp> empList2(String ename, String job){
				ArrayList<Emp> list=new ArrayList<Emp>();
		//		1. 공통연결메서드호출
				try {
					setCon();
		//			2. Statement 객체 생성.(연결객체-Connection)
					String sql = "SELECT *\r\n"
							+ "	FROM emp2 e \r\n"
							+ "	WHERE ename LIKE '%'||upper( ? )||'%'\r\n"
							+ "	AND job  LIKE '%'||upper( ? )||'%'\r\n"
							+ "	ORDER BY empno desc "; 
					// ; 빼주세요. ^^(주의)
					System.out.println(sql);
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, ename);	
					pstmt.setString(2, job);	
		//			3. ResultSet 객체 생성.(대화객체-Statement)
					rs = pstmt.executeQuery();
					int cnt =1;
					while(rs.next()) {
						
						System.out.print(cnt+++":"+rs.getInt(1)+"\t");
						System.out.print(rs.getString("ename")+"\t");
						System.out.print(rs.getString("job")+"\t");
						System.out.print(rs.getInt("mgr")+"\t");
						System.out.print(rs.getDate("hiredate")+"\t");
						System.out.print(rs.getDouble("sal")+"\t");
						System.out.print(rs.getDouble("comm")+"\t");
						System.out.print(rs.getInt("deptno")+"\n");
						
						// 1. 객체 생성과 할당.
						//    int empno, String ename, String job, int mgr,
						//    Date hiredate, double sal, double comm, 
						//    int deptno
						Emp e = new Emp(rs.getInt("empno"), 
								rs.getString(2),rs.getString(3),
								rs.getInt(4), rs.getDate("hiredate"),
								rs.getDouble(6), rs.getDouble(7),
								rs.getInt(8) );
						//  2. ArrayList에 할당.
						list.add(e);
					}
					System.out.println("객체의 갯수:"+list.size());
					System.out.println("두번째 행의 ename:"+list.get(1).getEname());
		//			4. 자원의 해제
					rs.close();
					pstmt.close();
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
			// 조회 처리 메서드..(매개변수 없는 처리)
			public ArrayList<Emp> empList(String job){
				ArrayList<Emp> list=new ArrayList<Emp>();
		//		1. 공통연결메서드호출
				try {
					setCon();
		//			2. Statement 객체 생성.(연결객체-Connection)
					String sql = "SELECT *\r\n"
							+ "	FROM emp2 e \r\n"
							+ "	WHERE ename LIKE '%'||upper('')||'%'\r\n"
							+ "	AND job  LIKE '%'||upper('"+job+"')||'%'"; 
					// ; 빼주세요. ^^(주의)
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					int cnt =1;
					while(rs.next()) {

						Emp e = new Emp(rs.getInt("empno"), 
								rs.getString(2),rs.getString(3),
								rs.getInt(4), rs.getDate("hiredate"),
								rs.getDouble(6), rs.getDouble(7),
								rs.getInt(8) );
							list.add(e);
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
			
				return list;
			}



	// ex1) select * from dept; 처리
	public ArrayList<Dept> deptList(){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화
			String sql = "select * from dept";
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			while(rs.next()) { // 행단위 변경 (행이 있을 때까지)
				System.out.print(rs.getInt(1)+"\t");
				System.out.print(rs.getString(2)+"\t");
				System.out.println(rs.getString("loc"));
				dlist.add(new Dept(rs.getInt(1),
						rs.getString(2),rs.getString(3)));
			}
			System.out.println("데이터의 건수:"+dlist.size());
			System.out.println("두번째 행의 부서명:"
					+dlist.get(1).getDname());
			
			// 4. 자원해제 :마지막부터 없애준다.
			rs.close();
			stmt.close();
			con.close();
			// 5. 예외처리.			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return dlist;
	}
	public ArrayList<Dept> deptList(Dept sch){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화 sql
			String sql = "	SELECT *\r\n"
					+ "	FROM dept\r\n"
					+ "	WHERE dname LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
					+ "	AND loc LIKE '%'||'"+sch.getLoc()+"'||'%'";
			stmt = con.createStatement();
			
			// 3. 결과
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dlist.add(new Dept(rs.getInt(1),
								   rs.getString(2),
								   rs.getString(3)));	
			}
			System.out.println("데이터 크기:"+dlist.size());
			// 4. 자원해제
			rs.close();
			stmt.close();
			con.close();
			// 5. 예외 처리.			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("## db처리 예외 ##");
			System.out.println(e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("## 일반 예외 ##");
			System.out.println(e.getMessage());		
		}


		
		return dlist;
	}
	public ArrayList<JobSalary> jobSalList(int salary){
		ArrayList<JobSalary> list = new ArrayList<JobSalary>();
		try {
			//1. 연결
			setCon();
			//2. 대화
			String sql = "SELECT job, count(*) cnt, \r\n"
					+ "		round( avg(sal) ) avgsal\r\n"
					+ "FROM emp2 e \r\n"
					+ "GROUP BY job\r\n"
					+ "having round( avg(sal) ) >= "+salary+"\r\n"
					+ "ORDER BY job";
			stmt = con.createStatement();
			//3. 결과
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(new JobSalary(rs.getString(1),
										rs.getInt(2),
										rs.getInt(3)));				
			}
			//4. 해제
			rs.close();
			stmt.close();
			con.close();
			//5. 예외 처리
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		
		return list;
	}
	
	
	// ex2) select * FROM emp2 where empno=7780 (empno는 유일키)
	//      을 처리하는 메서드 선언     ~15:15

//	-- ex1) 현재 구문을 통해서 만들어질 vo와 DAO단에 들어갈 메서드를 선언하세요.
//	--   VO 포함  출력  int deptno, double msal, double asal
//	--           하나의 데이터일 경우 메서드 매개변수로 double msal
//	SELECT deptno, max(sal) msal, avg(sal) asal
//	FROM emp2
//	GROUP BY deptno
//	HAVING max(sal) >= 3000;
	public ArrayList<Emp3> elist(int msal){
		ArrayList<Emp3> elist=null;
		return elist;
	} 
//	-- ex2) String ename, Date hiredate, int workdate
//	--      메서드 매개변수로 int fromDte, int toDate
//	SELECT ename, hiredate, floor(months_between(sysdate, hiredate)) 
//	workdate
//	FROM emp2
//	WHERE floor(months_between(sysdate, hiredate)) 
//	BETWEEN 470 AND 480;
	public ArrayList<Emp4> elist(int fromDte, int toDate){
		ArrayList<Emp4> emplist=null;
		
		
		
		return emplist;
	}
//	-- ex3) empno, ....    int part
//	--    매서드 매개변수 int part
//	 SELECT e.*, MOD(empno,2) part
//	 FROM EMP e
//	 WHERE MOD(empno,2)=0;  -- ~15:40	
	public ArrayList<Emp5> elist2(int part){
		ArrayList<Emp5> emplist=null;
		
		return emplist;
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



	// 등록
	// 수정
	// 삭제
/*
INSERT INTO emp2 values(
	emp21_seq.nextval, '홍길동','사원',7780,
	to_date('2021/05/01','YYYY/MM/DD'),
	3500,100,10)
 * */		
	public void insertEmp(Emp ins) {
		// 1. 접속 autocommit(false)
		try {
			setCon();
			con.setAutoCommit(false);
			// 2. 대화
			stmt = con.createStatement();
			String sql = "INSERT INTO emp2 values(\r\n"
					+ "	emp21_seq.nextval, '"+ins.getEname()+"','"+ins.getJob()
					+"',"+ins.getMgr()+",\r\n"
					+ "	to_date('"+ins.getHiredate_s()+"','YYYY-MM-DD'),\r\n"
					+ "	"+ins.getSal()+","+ins.getComm()
					+","+ins.getDeptno()+")";
			System.out.println("###");
			System.out.println(sql);
			stmt.executeUpdate(sql);
			con.commit();
			stmt.close();
			con.close();
			// 3. commit
			// 4. 예외처리			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				con.rollback();
				System.out.println("에러 발생으로 원복 처리");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("rollback에 문제발생.");
			}
		}catch(Exception e) {
			System.out.println("일반에러");
		}
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
				System.out.println("sql:"+sql);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					System.out.println("데이터가 있는지?");
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



	// 등록
			// 수정
			// 삭제
		/*
		INSERT INTO emp2 values(
			emp21_seq.nextval, '홍길동','사원',7780,
			to_date('2021/05/01','YYYY/MM/DD'),
			3500,100,10)
			
			ex) 부서정보 상세화면에서 수정 처리..			
		 * */		
			public void updateEmp(Emp upt) {
				// 1. 접속 autocommit(false)
				try {
					setCon();
					con.setAutoCommit(false);
					// 2. 대화
					String sql = " UPDATE EMP2 	\r\n"
							+ "	SET ename = ?,\r\n"
							+ "		job = ?,\r\n"
							+ "		mgr = ?,\r\n"
							+ "		hiredate = to_date(?,'YYYY-MM-DD'),\r\n"
							+ "		sal = ?,\r\n"
							+ "		comm = ?,\r\n"
							+ "		deptno = ?\r\n"
							+ "WHERE empno = ? ";
					pstmt = con.prepareStatement(sql);					
					pstmt.setString(1, upt.getEname());
					pstmt.setString(2, upt.getJob());
					pstmt.setInt(3, upt.getMgr());
					pstmt.setString(4, upt.getHiredate_s());
					pstmt.setDouble(5, upt.getSal());
					pstmt.setDouble(6, upt.getComm());
					pstmt.setInt(7, upt.getDeptno());
					pstmt.setInt(8, upt.getEmpno());
					pstmt.executeUpdate();					
					con.commit();
					pstmt.close();
					con.close();
					// 3. commit
					// 4. 예외처리			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("db 처리 에러");
					try {
						con.rollback();
						System.out.println("에러 발생으로 원복 처리");
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						System.out.println("rollback에 문제발생.");
					}
				}catch(Exception e) {
					System.out.println("일반에러");
				}
			}



	// 등록
				// 수정
				// 삭제
			/*
			INSERT INTO emp2 values(
				emp21_seq.nextval, '홍길동','사원',7780,
				to_date('2021/05/01','YYYY/MM/DD'),
				3500,100,10)
				
				ex) 부서정보 상세화면에서 수정 처리..			
			 * */		
				public void deleteEmp(int empno) {
					// 1. 접속 autocommit(false)
					try {
						setCon();
						con.setAutoCommit(false);
						// 2. 대화
						String sql = "DELETE FROM emp2 WHERE empno=? ";
						pstmt = con.prepareStatement(sql);					
						pstmt.setInt(1, empno);
						pstmt.executeUpdate();					
						con.commit();
						pstmt.close();
						con.close();
						// 3. commit
						// 4. 예외처리			
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("db 처리 에러");
						try {
							con.rollback();
							System.out.println("에러 발생으로 원복 처리");
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
							System.out.println("rollback에 문제발생.");
						}
					}catch(Exception e) {
						System.out.println("일반에러");
					}
				}



	/*
					 1. sql 작성
					 2. VO 객체 생성 : sql의 결과값에 따른 컬럼명과 type을 확인하여 작성.
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
					
					
					
					// DELETE FROM PRODUCT2 p WHERE pno = ?
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A01_Dao dao = new A01_Dao();
		ArrayList<Emp> elist = dao.empList2("", "");
		System.out.println("크기:"+elist.size());
		System.out.println("첫번째:"+elist.get(0).getEname());
//		Emp ins = new Emp(0,"김길동4","대리",7800,"2010/12/12",
//					4000,100,20);
//		dao.insertEmp(ins);
//		try {
//			dao.setCon();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//dao.empList("A","A");
		
//		dao.deptList(); // dept list 출력되게 처리..
//		dao.deptList(new Dept("",""));
//		dao.jobSalList(0);
//		dao.memberList("", "");
	}

}
