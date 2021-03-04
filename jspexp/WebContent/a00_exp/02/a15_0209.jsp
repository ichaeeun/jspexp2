<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.a00_exp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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
[하] 1. 특정 요청사항에 따른 웹화면 구성 순서별로 선언하세요.
	*1) 요구사항에 의해 DB 설계/화면설계 테이블 구성 sql작성
	*2) 화면구성(jsp) - form객체의 요청처리 - null값에 대한 처리.
	3) sql 기준으로 출력할 VO 설정.
		*VO 생성자 - 전체 필드 입력, default 생성자
			기능메서드의 매개변수로 받을 속성을 생성자로 설정.
	4) DAO
		1) 공통 - 필드(연결, 대화, 결과), 
				 DB접근메서드(jdbc,DB서버 접근 속성) setCon()
		2) 기능메서드
			*리턴값
				단일(VO, int, boolean....)
				다중(ArrayList<VO>		 
			*매개변수
				없는경우()
					ex) empList()
				일반변수(검색어, 2이하의 변수)
					ex) schEmpList(String ename, String job)
				객체
					ex) schEmpList(Emp sch), 
					    insertEmp(Emp ins)
			내용
				1) 연결 Connection
				2) 대화객체 Statement
				3) 결과객체 ResultSet
					rs.next() 행단위 변경, 
					*rs.getXXX(컬럼)
					while문을 사용하면 어떤 컬럼가져오는가?
						return할 ArrayList<VO>에 추가.
					
				4) 자원해제 
				5) 예외처리	
	5) jsp 화면 데이터 처리.
		dao import
		dao 객체 생성
		요청값 기능메서드를 통한 할당.
		for문 scriptlet, expression 출력	




[중] 2. 회원아이디, 회원패스워드, 이름, 포인트, 주소, 등록일, 
		권한이 있고, 회원아이디와 이름으로 검색하는 웹화면을 
		구성할려고 한다. 위 내용을 새로운 테이블을 만들고 처리해보세요.
--%>
<body>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	if(id==null) id="";	log("## 입력한 id:"+id);
	if(name==null) name="";	log("## 입력한 name:"+name);
	A01_Dao dao = new A01_Dao();
	ArrayList<Member5> mlist = dao.memberList(id, name);%>
	<h3>회원 정보 리스트</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th>
			<td><input type="text" name="id" value="<%=id%>"/></td></tr>
		<tr><th>이름</th>
			<td><input type="text" name="name"  value="<%=name%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th><th>포인트</th>
			<th>주소</th><th>등록일</th><th>권한</th></tr>
		<%for(Member5 m:mlist){ %>	
		<tr><td><%=m.getId() %></td><td><%=m.getPass() %></td>
			<td><%=m.getName() %></td><td><%=m.getPoint() %></td>
			<td><%=m.getAddress() %></td><td><%=m.getRegdte() %></td>
			<td><%=m.getAuth() %></td></tr>			
		<%}%>	
	</table>
</body>
</html>