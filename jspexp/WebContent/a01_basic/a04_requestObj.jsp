<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
// 한글은 2byte로 전송되기에 encoding이 필요하다.
// get은 서버에서 지원하는 경우가 많아서,  post방식은 설정을 통해서 처리 된다.
String path = request.getContextPath();
// 프로젝트명 하위에 WebContent폴드를 기준 folder로 지정되기때문에
// 사용하는 자원(페이지 링크, 이미지, 외부 css, 외부 js 파일)을
// 효과적으로 로딩하여 처리할 수 있다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--path기준으로 모든 자원(css,img,js)를 접근하여 사용할 수 있다. --%>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
</head>
<style>

</style>
<%--
# request 기본 객체
1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
2. 주요 기능
	1) 클라이언트(브라우저)와 관련된 정보 읽기
	2) 서버와 관련된 정보 읽기 기능.
	3) 클라이언트에 전송한 요청 파라미터 읽기 기능..
		request.getParamter("")
	4) 클라이언트가 전송한 요청 헤더 읽기 기능
	5) 클라이언트가 전송한 쿠키 읽기 기능
	6) 속성 처리 기능..
3. 주요메서드
	http://243.211.18.42:7080/context명/폴드/파일.jsp?key=value&key=value
	1) request.getParamter("key")	
		-client가 주소창이나 form객체를 통해서 전송하는 매개값을 
		처리하는 객체를 말한다.
		페이지명?key=value&key=value (GET)
		form method="post"
			name="key"  value="value" (POST)
	2) request.getRemoteAddr()
		웹서버에 연결된 클라이언트의 ip주소를 구한다.
		ex) 웹서에 접속된 여러 클라이언트 정보를 저장할 때, 사용된다.
	3) request.getMethod()
		요청값을 전달할 때, 전송하는 방식을 가져온다. (get/post)
	4) request.getContextPath():(*)
		위 주소에 해당 하는 context명을 말한다. 웹서버에 등록하여 할당하는 
		프로젝트명이기도 한다.
		WebContent 폴드를 기본경로로 하여 다른 자원의 호출할 때, 사용된다.
	5) request.getRequestURI():
		웹 브라우저가 요청한 url경로 :
		위 주소에서 context명/폴드/파일.jsp에 해당한다.
	6) request.getServerPort()
		위 주소기준이면 7080에 해당한다.
	7) request.getServerName() 연결할 때, 사용한 서버이름. ~ 12:33	 				
 --%>
</head>
<body>
	클라이언트IP = <%= request.getRemoteAddr() %> <br>
	요청정보길이 = <%= request.getContentLength() %> <br>
	요청정보 인코딩 = <%= request.getCharacterEncoding() %> <br>
	요청정보 컨텐츠타입 = <%= request.getContentType() %> <br>
	요청정보 프로토콜 = <%= request.getProtocol() %> <br>
	요청정보 전송방식 = <%= request.getMethod() %> <br>
	요청 URI = <%= request.getRequestURI() %> <br>
	컨텍스트 경로 = <%= request.getContextPath() %> <br>
	서버이름 = <%= request.getServerName() %> <br>
	서버포트 = <%= request.getServerPort() %> <br>
</body>
</html>