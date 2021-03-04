<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A03_ShopDao"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){
		
	};
</script>
</head>
<%--
[하] 1. 데이터의 등록과 상세처리 프로세스의 순서에 대하여 기술하세요.
	# 데이터 등록
	1. 사용자 화면 interface 결정 - 요구사항에 의해 화면 설계
	2. 등록기능 버튼 클릭과 함께 등록화면 호출 및 구현
		1) 입력값에 대한 validation js로 처리
		2) 전송 후, 요청값에 대한 확인
		3) 요청값 내용 담는 DTO(data transaction object)객체 작성 
			및 DTO객체에 담기.
	3. DAO 작성
		1) 공통 : 필드, 연결메서드
		2) insert기능메서드 구현
			- 연결
			- setAutocommit(false)
			- sql 작성 및 매개값 문자열로 concat
				숫자형  " +dto.getXXX()+"
				문자열형 '"+dto.getXXX()+"'
			- stmt.executeQuery(sql)  
			- con.commit()
			- 예외처리
				con.rollback();
	4. js
		정상 입력 처리 alert("등록성공")	
	# 상세처리 프로세스
	1. 화면에서 상세처를 위한 사용자 인터페이스 결정
	2. js로 함수 정의 매개값으로 key 전달 onclick="go(<%=key%>)"
		전달할 데이터가 문자열인 경우와 숫자인 경우 반드시 구분하여 처리
		할 것.
	3. location.href="이동할페이지?key="+전달key값;
	4. 이동한 페이지에서 key으로 요청값 받아서 정상여부 확인.
	5. DAO 작성.
		1) return이 단일객체인 메서드와 key매개변수로 처리되는 메서드 구현
			public Vo객체 detail(키){
				Vo객체 참조변수 = null;
				return 참조변수	
			}
		2) 연결
		3) sql처리
		4) 대화객체
		5) resultset 
		6) if(rs.next)
		7) 	참조변수 = new vO객체생성자(rs.getXXX()....);
		8) 자원해제
		9) 예외처리.
	6. jsp에서 dao호출 입력값 전달 처리
		1) VO객체 getXXX()메서드 value=""로 할당처리.

[하] 2. 부서 상세 정보를 처리하세요.


[중] 3. 쇼핑몰에서 관리자 현재 등록된 물건을 확인하고, 물건을 등록하고, 
		물건을 상세정보를 출력하는 웹화면을 구현하세요.
        물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일, 
        		제조사, 최근입고일, 입고책임자
        조회화면 출력 : 제품번호, 물건명, 물건가격, 물건재고량, 
        		최근입고일 조회조건(물건명, 물건가격 from,to)
 	1) 조회화면 및 요청값 확인
 	2) DB설계, 테이블생성, 기본 데이터 입력 등록 sql, 조회 sql 작성
 	3) VO, DTO 작성
 		ShopProd
 	4) DAO 작성
 		- 공통
 		- 조회 메서드 public ArrayList<ShopProd> shopList( ShopProd sch)
 		- 등록 메서드 public insertProduct( ShopProd ins)
 		- 단일데이터 메서드 public ShopProd getProd(int prono)
 	5) a17_0210_list.jsp 조회화면 구성
 		- DAO 호출 조회 메서드 호출.
 		- for(ShopProd sp: dao.shopList(sch))
 		- 등록 인터페이스 작성 location.href="a18_0210_insert.jsp"
 		- 상세화면 이동 인터페이스 작성 
 			onclick="location.href=a19_0210_detail.jsp?prodno=@@
 	6) 등록화면 구현(a18_0210_insert.jsp)
 		- form화면 구현
 		- 요청값확인
 		- 등록 DAO 처리
 		- js
 	7) 상세화면 구현(a19_0210_detail.jsp)
 		- form화면 구현
 		- 요청값 처리
 		- 상세 메서드 호출
 			ShopProd pro = dao.getProd(prono);
 		- 데이터 화면 출력
 			if( pro!=null)
 				value="<%=pro.getPname()%>"	 
 				
 	
         물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일, 
        		제조사, 최근입고일, 입고책임자
        조회화면 출력 : 제품번호, 물건명, 물건가격, 물건재고량, 
        		최근입고일 조회조건(물건명, 물건가격 from,to)	       		
--%>
<%
	String name = request.getParameter("name");
	if(name==null) name="";
	String frPriceS = request.getParameter("frPrice");
	int frPrice = 0;
	log("물건가격(from):"+frPriceS);
	if(frPriceS!=null && !frPriceS.equals("")) 
		frPrice= Integer.parseInt(frPriceS);
	String toPriceS = request.getParameter("toPrice");
	int toPrice = 9999999;
	if(toPriceS!=null && !toPriceS.equals("")) 
		toPrice= Integer.parseInt(toPriceS);	
	log("물건명:"+name);log("가격(시작):"+frPrice);log("가격(마지막):"+toPrice);
	A03_ShopDao	dao = new A03_ShopDao();
	ArrayList<Product2> plist = 
			dao.shopList(new Product2(name, frPrice, toPrice));
%> 
<body>
	<h3>물건리스트</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name"  value="<%=name%>"/></td></tr>
		<tr><th>가격</th><td><input name="frPrice" value="<%=frPrice%>"/>
							~ <input  name="toPrice"  value="<%=toPrice%>"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			
			<input type="button" value="등록" onclick="regProduct()"/>
			</td></tr>
	</table>
	</form>
	<table>
		<tr><th>제품번호</th><th>물건명</th><th>가격</th><th>재고량</th>
			<th>최근입고일</th></tr>
		<%for(Product2 pro:plist){ %>	
		<tr onclick="detail(<%=pro.getPno()%>)"><td><%=pro.getPno()%></td><td><%=pro.getName()%></td>
			<td><%=pro.getPrice()%></td><td><%=pro.getCnt()%></td>
			<td><%=pro.getCredte()%></td></tr>
		<%} %>
	</table>	
</body>
<script type="text/javascript">
	function regProduct(){
		location.href="a18_0210_insert.jsp";
	}
	function detail(pno){
		location.href="a19_0210_detail.jsp?pno="+pno;
	}

</script>
</html>