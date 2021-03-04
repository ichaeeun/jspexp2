<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
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
[중] 2. 로그인 id : [    ] pass:[   ]로그인
        요청값 himan/7777 session 값 처리를 설정하고, 그 외에는 다시 로그인
        로그인 성공 후에는 session 값으로id 확인 @@@님 로그인 중, 
        로그아웃 클릭시, session값을 없애고 다시 로그인 페이지 이동 처리하는
        기능을 구현하세요.
# 처리순서
1. 화면구현
2. submit 후, 요청값에 대한 처리..
	String id = request.getParameter("id");
	Systme.out.println(id); // 프로세스 잘 진행 되고 있는가?
3. 요청값에 따른 분기처리.	
	if( id.equals("himan") && pass.equals("7777") ){
		1) 선택1
		session.setAttribute("id",id);
		session.setAttribute("pass",pass);
		Systme.out.println(id); 
		2) 선택2
		session.setAttribute("mem",new Member(id,pass));
		response.sendRedirect("a13_success.jsp");
		Systme.out.println(id); 
	}else{
		response.sendRedirect("a12_logFail.jsp");
		Systme.out.println(id); 
	}
	Systme.out.println(id); 
4. 로그인 실패 페이지 처리.
	화면 내용.
	js  alert('로그인 실패\n로그인 페이지 이동');
		location.href=""a11_0205.jsp; (로그인페이지 이동)
		
5. 성공 페이지
	Member m =(Member)session.getAttribute("mem");
	if(m!=null){
	
		<%=m.getId()%>님 로그인 성공입니다.
		<input type="button" value="로그아웃" onclick="logout()"/>
	}		
	<script>
		function logout(){
			if(confirm("로그아웃하시겠습니까?")){
				location.href=""a14_logout.jsp; (로그아웃페이지)
			}
		}
6. 로그아웃
	<%  session.invalidate()%>
	<script>
		alert("로그아웃되었습니다");
		location.href=""a11_0205.jsp; (로그인페이지 이동)
	
	        
--%>
<body>
	<h3>로그인</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th>
			<td><input type="text" name="id"/></td></tr>
		<tr><th>패스워드</th>
			<td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="로그인"/></td></tr>			
	</table>
	</form>
</body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	log("id:"+id);
	log("pass:"+pass);
	// 모든 웹페이지는 처음 화면과 데이터를 입력해서 다시 호출되는
	// 화면과 구분..
	// 구분자가 요청값에 대한 null로 구분할 수 있다.
	// 요청값이 null이고 메서드를 활용하면 NullPointerException이
	// 반기고 있다..
	// 결론 : id, pass null일 아닐때로 구분하여 처리한다. 
	//      null :요청값이 없는 초기 페이지
	//      null아닐 때는 요청값이 있는 페이지..
	if(id!=null && pass!=null){
		log("#요청값 있는 경우#");
		
		if( id.equals("himan") && pass.equals("7777") ){
			log("#id pass가 himan/7777일때#");
			session.setAttribute("mem",new Member(id,pass));
			response.sendRedirect("a13_success.jsp");
		}else{
			log("#맞지 않을 때#");
			response.sendRedirect("a12_loginFail.jsp");
		}
	}
%>

</html>