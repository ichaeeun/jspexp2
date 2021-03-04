package jspexp.a03_database;
// jspexp.a03_database.A03_ShopDao
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Product2;

public class A03_ShopDao {
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
	// - 조회 메서드 
	public ArrayList<Product2> shopList(Product2 sch){
		// null에 대한 default 처리..
		if(sch.getName()==null) sch.setName("");
		if(sch.getTo_price()==0) sch.setTo_price(99999999);
		
		ArrayList<Product2> list = new ArrayList<Product2>();
		try {
			// 
			setCon();
			String sql = "SELECT * FROM product2 WHERE name LIKE '%'||'"
					+sch.getName()+"'||'%'\r\n"
					+ "	AND price BETWEEN "+sch.getFr_price()+
					" AND "+sch.getTo_price()+" ORDER BY pno DESC";
			System.out.println("조회리스트");
			System.out.println(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(new Product2(rs.getInt(1),rs.getString(2),
							rs.getInt(3), rs.getInt(4),
							rs.getDate(5), rs.getString(6),
							rs.getDate(7), rs.getString(8)
						));
			}
			System.out.println("총건수:"+list.size());
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 에러:"+e.getMessage());
		} catch(Exception e){
			System.out.println("일반 에러:"+e.getMessage());
		}
		
		return list;
	}
/*
-- 등록 sql
INSERT INTO product2 values(prod2_seq.nextval, '사과',
	2000,100,sysdate,'좋은농원',sysdate, '홍길동');
-- 조회 sql
SELECT * FROM product2 WHERE name LIKE '%'||''||'%'
	AND price BETWEEN 0 AND 99999 ORDER BY pno DESC;
-- 상세 sql	
SELECT * FROM product2 WHERE pno = 10000; 
 */	
	//	- 등록 메서드 
	public void insertProduct( Product2 ins) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO product2 values(prod2_seq.nextval, '"
			+ins.getName()+"',\r\n"
					+ "	"+ins.getPrice()+","+ins.getCnt()+",sysdate,"
							+ "'"+ins.getCompany()+"',sysdate, '"
							+ins.getInmanager()+"')";
			System.out.println("등록처리");
			System.out.println(sql);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.commit();			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("입력 에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}	
	}

	public Product2 getProd(int prono) {
		Product2 pro=null;
		try {
			setCon();
			String sql = "SELECT * FROM product2 WHERE pno = "+prono;
			System.out.println("상세조회");
			System.out.println(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				pro = new Product2(rs.getInt(1),rs.getString(2),
						rs.getInt(3), rs.getInt(4),
						rs.getDate(5), rs.getString(6),
						rs.getDate(7), rs.getString(8)
					);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("상세 조회 에러:"+e.getMessage());
		} catch( Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}		
		return pro;
	}		
	/*
	-- 등록 sql
	INSERT INTO product2 values(prod2_seq.nextval, '사과',
		2000,100,sysdate,'좋은농원',sysdate, '홍길동');
	-- 조회 sql
	SELECT * FROM product2 WHERE name LIKE '%'||''||'%'
		AND price BETWEEN 0 AND 99999 ORDER BY pno DESC;
	-- 상세 sql	
	SELECT * FROM product2 WHERE pno = 10000; 
	 */	
		//	- 등록 메서드 
		public void updateProduct( Product2 upt) {
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = " UPDATE PRODUCT2 \r\n"
						+ "	SET name = ?,\r\n"
						+ "		price=?,\r\n"
						+ "		cnt=?,\r\n"
						+ "		CREDTE = to_date(?,'YYYY-MM-DD'),\r\n"
						+ "		company = ?,\r\n"
						+ "		incomedte = to_date(?,'YYYY-MM-DD'),\r\n"
						+ "		inmanager = ?\r\n"
						+ "WHERE pno = ? ";
				System.out.println("##물품수정처리###");
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,upt.getName());
				pstmt.setInt(2,upt.getPrice());
				pstmt.setInt(3,upt.getCnt());
				pstmt.setString(4,upt.getCredteS());
				pstmt.setString(5,upt.getCompany());
				pstmt.setString(6,upt.getIncomedteS());
				pstmt.setString(7,upt.getInmanager());
				pstmt.setInt(8,upt.getPno());
				pstmt.executeUpdate();
				con.commit();			
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("입력 에러:"+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch(Exception e) {
				System.out.println("일반 에러:"+e.getMessage());
			}	
		}
	/*
		-- 등록 sql
		INSERT INTO product2 values(prod2_seq.nextval, '사과',
			2000,100,sysdate,'좋은농원',sysdate, '홍길동');
		-- 조회 sql
		SELECT * FROM product2 WHERE name LIKE '%'||''||'%'
			AND price BETWEEN 0 AND 99999 ORDER BY pno DESC;
		-- 상세 sql	
		SELECT * FROM product2 WHERE pno = 10000; 
		 */	
			//	- 등록 메서드 
			public void deleteProduct( int pno) {
				try {
					setCon();
					con.setAutoCommit(false);
					String sql = " DELETE FROM PRODUCT2 WHERE pno=? ";
					System.out.println("##물품삭제처리###");
					System.out.println(sql);
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,pno);
					pstmt.executeUpdate();
					con.commit();			
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("입력 에러:"+e.getMessage());
					try {
						con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				} catch(Exception e) {
					System.out.println("일반 에러:"+e.getMessage());
				}	
			}
	// DELETE FROM PRODUCT2 WHERE pno=?
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A03_ShopDao dao = new A03_ShopDao();
		dao.shopList(new Product2(""
				+ "",1000,9999999));	
		/*
	Product2(int pno, String name, int price, int cnt, Date credte,
	 String company, Date incomedte,
			String inmanager)
		 * */
/*		
		dao.insertProduct(new Product2(0,"딸기",12000,50,null,
				"딸기마을",null,"딸기맨"));
		dao.getProd(10000);
*/		
		
	}

}
