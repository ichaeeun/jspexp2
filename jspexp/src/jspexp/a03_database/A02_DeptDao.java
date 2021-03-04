package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;
// jspexp.a03_database.A02_DeptDao
// A02_DeptDao deptList2(Dept sch)
public class A02_DeptDao {



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
	public ArrayList<Dept> deptList(Dept sch){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화 sql
			String sql = "	SELECT *\r\n"
					+ "	FROM DEPT10\r\n"
					+ "	WHERE dname LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
					+ "	AND loc LIKE '%'||'"+sch.getLoc()+"'||'%'"
					+ "	ORDER BY deptno DESC";
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

	public ArrayList<Dept> deptList2(Dept sch){
		
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		System.out.println("부서정보조회");
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화 sql
			String sql = "	SELECT *\r\n"
					+ "	FROM DEPT10\r\n"
					+ "	WHERE dname LIKE '%'||upper( ? )||'%'\r\n"
					+ "	AND loc LIKE '%'||upper( ? )||'%'"
					+ "	ORDER BY deptno DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getDname());
			pstmt.setString(2, sch.getLoc());
			// 3. 결과
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dlist.add(new Dept(rs.getInt(1),
								   rs.getString(2),
								   rs.getString(3)));	
			}
			System.out.println("데이터 크기:"+dlist.size());
			// 4. 자원해제
			rs.close();
			pstmt.close();
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
	public void insertDept(Dept ins){
		// 연결
		try {
			setCon();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			// 대화
			String sql= "INSERT INTO dept10 values("+ins.getDeptno()
				+",'"+ins.getDname()+"','"+ins.getLoc()+"')";
			stmt.executeUpdate(sql);
			System.out.println(sql);
			// commit
			con.commit();
			// 자원해제
			stmt.close();
			con.close();
			// 예외처리.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public Dept getDept(int deptno){
		Dept d=null;
		// 1. 연결
		try {
			setCon();
			// 2. 대화 sql
			String sql = "	SELECT *\r\n"
					+ "	FROM DEPT10 WHERE DEPTNO="+deptno+"\r\n";
			stmt = con.createStatement();
			System.out.println("sql 확인");
			System.out.println(sql);
			// 3. 결과
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				System.out.println("데이터가 있을까요??");
				d=new Dept(rs.getInt(1),
								   rs.getString(2),
								   rs.getString(3));	
			}
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
	
	
		
		return d;
	}
	public void updateDept(Dept upt){
		// 연결
		try {
			setCon();
			con.setAutoCommit(false);
			// 대화
			String sql= "UPDATE dept10\r\n"
					+ "   SET dname = ?,\r\n"
					+ "   	   loc = ?\r\n"
					+ " WHERE deptno = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getDname());
			pstmt.setString(2, upt.getLoc());
			pstmt.setInt(3, upt.getDeptno()); // ~10:38
			pstmt.executeUpdate();
			System.out.println(sql);
			// commit
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			// 예외처리.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public void delDept(int deptno){
		// 연결
		try {
			setCon();
			con.setAutoCommit(false);
			// 대화
			String sql= "DELETE FROM dept10 WHERE deptno=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno); 
			pstmt.executeUpdate();
			System.out.println(sql);
			// commit
			con.commit();
			// 자원해제
			pstmt.close();
			con.close();
			// 예외처리.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	/*

	 * */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_DeptDao dao = new A02_DeptDao();
		dao.insertDept(new Dept(70,"it part","경기수원"));

	}	

}
