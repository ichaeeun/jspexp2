<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
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
# jsp의 기본 객체 
1. jsp는 변수들을 저장할 때, 특정한 범위로 저장을 할 수 있다.. 
	(page 범위, 시간 - session time, 브라우저와 서버 관계, 서버)
	이때, 활용되는 객체가 session scope범위로 
	1) 한 페이지 단위에서 데이터를 저장하고 활용할 수 있는 pageContext, 
	2) 요청 page까지 데이터를 저장하고 활용할 수 있는 request,
		<jsp:forward page="요청페이지"/> request와 response를 요청페이지에
		전달..
		RequestDispatcher rd= request.getRequestDispatcher("페이지");
		rd.forward(request, response);	
		request.setAttribute("p01", new Person("홍길동",27,"서울신림동");
		요청된 페이지에서.
		Person p01 = (Person)request.getAttribute("p01");		 
	3) 브라우저가 닫힐 때까지 데이터를 저장하고 활용할 수 있는 session, 
		특정한 client(브라우저)와 server(웹 어플리케이션 서버-톰캣(WAS) )관계가 
		끝날 때까지
		response.sendRedirect("이동할페이지")
		location.href="이동할페이지");
		<a href="이동할페이지">안녕하세요</a>
		로 이동했을 때, 페이지를 이동했을지라도 특정 데이터나 객체를
		가지고 있을 수 있게 처리한다.
		ex) session.setAttribute("mem01", new Member("himan",7777,
		"홍길동",3000);
		Member mem01 = (Member)session.getAttribute("mem01");		
	4) 서버단위로 데이터를 저장하고 활용할 수 있는 application으로 기본 객체를
	지원하고 있다.
		다른 브라우저(client)가 다를지라도, 
		브라우저를 다 닫고, 다시 시작하더라도 데이터를 가지고 있을 수 
		있는 객체..ex) 주의 session은 url주소를 복사하여 같은 브라우저에서는
		창을 닫기까지 session값을 유지하나, 다른 브라우저(client가 다름)에서
		유지 되지 않으나, application 범위로를 접근이 가능하다.
		ex) application.setAttribute("data01", new Emp(7778,
		"홍길동","사원");
		Emp emp = (Emp)application.getAttribute("data01");
2. scope가 지원하는 기본 객체의 메서드..

	1) .setAttribute("key", 할당할 객체);
		ex) 
		변수하나
		session.setAttribute("var01",25); ==new Integer(25);
		session.setAttribute("var02","안녕"); ==new String("안녕");
		session.setAttribute("var03",new Person("홍길동",25)); 
	2) .getAttribute("key") : 특정한 key로 저장된 객체를 가져올 수 있음.
		session.getAttribute("var01")는 Object 타입이기에
		사용할 때는 아래와 같이 Type casting이 필요하다.
		Integer var01 = (Integer)session.getAttribute("var01");	
		String var02 = (String)session.getAttribute("var02");
		Person var03 = (Person)session.getAttribute("var03");	

 --%>
<%
// 1. page Scope 데이터 처리:현재페이지에서만 사용할 수 있는 범위로 객체 선언..
	pageContext.setAttribute("pageVar","홍길동(page)");
// 2. request Scope 데이터 처리 :현재페이지뿐아니라 forward, requestDispatcher를
/// 통해서 호출된 페이지까지 데이터를 가지고 있음..
	request.setAttribute("reqVar", "김길동(request)");
	// request 처리.
// 3. session sope 데이터 처리 : 
//    현재/request페이지/a href,location,response.sendRedirect 유지가 되는 
//    범위 설정. 열림 브라우저가 다 닫히고, 새로운 브라우저열 열때까지 살아 있다. 
	session.setAttribute("sessVar","마길동(session)");
// 4. application scope 데이터 처리.
//    서버가 재기동할 때까지 살아있는 범위
	application.setAttribute("appVar","오길동(application)");	
//  a02_request.jsp에 request에 있는 모든 내용과 response객체의 모든 내용을 전달합니다
	request.getRequestDispatcher("a02_request.jsp").forward(request,
			response);
%>
<body>
	<h3>page scope</h3>
	<table>
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("pageVar")%></td></tr>
		<tr><th>요청범위</th><td><%=request.getAttribute("reqVar")%></td></tr>
		<tr><th>세션범위</th><td><%=session.getAttribute("sessVar")%></td></tr>
		<tr><th>어플리케이션범위</th><td>
		<%=application.getAttribute("appVar")%></td></tr>

	</table>
</body>
</html>
<%--
ex) 
page변수 : show "안녕하세요"
request변수 : prodName "사과"
session변수 : id(himan), point(5000)
application변수 : DBServer "192.243.32.12"

a05_pageScope.jsp
a06_requestScope.jsp
a07_sessionScope.jsp
a08_applicationScope.jsp
각 페이지별 해당 범위에 따른 내용 출력 ~16:25

 --%>




