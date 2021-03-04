<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A02_DeptDao"
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
1. 화면구성
2. 요청값확인
3. sql작성
	SELECT *
	FROM dept
	WHERE dname LIKE '%'||'E'||'%'
	AND loc LIKE '%'||'A'||'%'
4. vo
5. Dao : 필드, 공통메서드, 기능메서드
6. 기능메서드 상세내용 처리, main()통해서 확인
7. jsp화면
	1) import
	2) 객체 생성.
	3) 요청값 null에 대한 default설정 ""
	4) DB처리 메서드 호출.
	5) for문을 통한 화면처리.
===
등록처리
1. 리스트 화면
	등록 버튼으로 등록화면이동 처리
2. 등록화면
	등록내용 form,데이터
	요청값 받기.
	VO객체로 할당.
3. A02_DeptDao.java 
	0) sql, vo
	1) 공통
	2) 기능 메서드 public void insertDept(Dept ins){}
		- 연결
		- autoCommit(false)
		- 대화
		- commit
		- 자원해제
		- exception
4. 등록화면 dao 호출.
	1) 요청값에 의해 할당된 vo, dao 기능메서드에 매개값으로 할당.
	2) script 등록완료, 조회페이지이동
			
	
	
	
	
--%>
<%
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	if(dname==null) dname = "";
	if(loc==null) loc = "";
	log("#### dname:"+dname);
	log("#### loc:"+loc);
%>

<body>
	<h3>부서정보검색</h3>
	<form method="post">
	<table>
		<tr><th>부서명</th>
			<td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
		<tr><th>지역</th>
			<td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" value="등록" 
				onclick="location.href='a20_deptInsForm.jsp'"/>
			</td></tr>
	</table>
	</form>
<%	
	A02_DeptDao dao = new A02_DeptDao();
	ArrayList<Dept> dlist = dao.deptList(new Dept(dname, loc));
%>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept d:dlist){%>
		<tr onclick="detail(<%=d.getDeptno()%>)"><td ><%=d.getDeptno()%></td><td><%=d.getDname()%></td>
				<td><%=d.getLoc()%></td></tr>
		<%}%>
	</table>	
</body>
<script>
	function detail(deptno){
		location.href="a21_deptDetail.jsp?deptno="+deptno;
	}

</script>
</html>