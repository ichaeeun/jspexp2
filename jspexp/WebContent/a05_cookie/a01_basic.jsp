<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="java.net.*" 
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
# 쿠키(Cookie)
1. 생각해봅시다.
    1) 브라우저를 통해, 서버에 접속 후 어떤 데이터가 다시 접속할 때 필요할까?
    2) 특정한 데이터는 서버에 남는 것이 더 좋을까? 클라이언트(브라우저)에 
    남는 것이 더 좋을까?
2. 학습목표
    1) 브라우저에 저장되는 데이터에 대한 이해를 한다.
    2) 쿠키 데이터의 저장 형식과 저장 주기를 안다.
    3) 쿠키 데이터를 서버에 전달하고, 활용하는 방법을 안다.
    4) 쿠키 데이터가 클라이언트 저장 기능을 알고 활용한다.
3. 주요 키워드
    Cookie, getName(), getValue(), request.getCookies()
    response.addCookie(), Cookie.setMaxAge()

# 쿠키(Cookie)
1. 쿠키는 웹브라우저가 보관하고 있는 데이터로서
웹 서버에 요청을 보낼 때 함께 전송한다.
	1) 쿠키의 생성는 웹서버에서 시작 되고, response객체에
		쿠키 생성한 것을 탑재하여 클라이언트에 보낸다.
		response.addCookie(new Cookie(key,value));
	2) 클라이언트는 사용하는 브라우저를 통해, 쿠키값을
		받아 특정한 쿠키저장소에 저장한다.
		브라우저에 배열형태로 누적되어 저장 Cookie[]
		
	3) 다시 웹서버에 접속해서 클라이언트가 가지고 있는 쿠키를
		request객체에 의해서 전달하고, 웹서버 프로그램은
		이것을 기준으로 클라이언트를 식별하고 데이터를 
		받을 수 있다.
		request.getCookies() : client에 저장된 쿠키를
		배열로 서버에 전달. 
		서버에서는 Cookie[] cks = request.getCookies(); 
		
		
2. 쿠키의 구성
	1) 쿠키는 이름, 값, 유효시간, 도메인, 경로로 구성한다.
	2) 쿠키 이름을 아스키 코드의 알파벳과 숫자만을 포함할
		수 있다.
	3) 콤마, 세미콜론, 공백 등의 문자는 포함할 수 없다.
	4) $로 시작할 수 없다.
	~16:25
3. 쿠키의 생성과 읽기
	1) Cookie c01 = new Cookie("쿠키의이름","쿠키의값");
	2) response.addCookie(co01); //서버가 클라이언트에 전달
	3) Cookie[] cookies= request.getCookies()
		클라이언트에서 전달된 쿠키를 서버가 request 객체를  
		통해서 확인한다
	4) 쿠키의 주요 메서드.(문자열로 가져온다)
		getName() : 쿠키의 이름을 구한다.
		getValue() : 쿠키의 값을 구한다.
4. 쿠키의 삭제 :
	서버에서 명령을 통해서 클라이언트로 전달하면 클라이언트에서는
	쿠키의 생성주기시간을 확인하고 삭제가 된다.
	1) 	Cookie의  속성 설정.
		setMaxAge(0) : 쿠키의 생성 시간 설정.
		response.addCookie(cookie) 쿠키 만료시간이 0인 것을
			client에 전송한다.
5. 쿠키의 식별 이름 설정.(domain)
	1) setDomain("쿠키의 도메인명 설정")
6. 쿠키의 이름과 값의 한글화 처리..
	문자열로 기본적으로 1byte만 저장되기에 2byte이상의 문자열은
	encoding하여 저장하고, 다시 서버에서 그 쿠키를 사용할려면
	decoding하여 호출하여 사용한다.
	1) 설정시 
		import="java.net.URLEncoder 
		URLEncoder.encode("쿠키설정key나 값","utf-8")
		를 통해서 encode를 처리후,
		ex) new Cookie( URLEncoder.encode("홍길동","utf-8"),
						URLEncoder.encode("서울신림동","utf-8"));

 --%>
<body>
<%--쿠키의 생성!! --%>
<%
// 1. 서버에서 쿠키를 만든다.
Cookie ck01 = new Cookie("name","himan");
// 2. 만든 쿠키를 클라이언트에 보낸다.
response.addCookie(ck01);
Cookie ck02 = new Cookie("age","25");
response.addCookie(ck02);
// 3. 한글의 쿠키값을 설정할려면 encoding으로 처리하여야 한다.
Cookie ck03 = new Cookie( URLEncoder.encode("홍길동","utf-8"),
						  URLEncoder.encode("서울신림동","utf-8"));
ck03.setDomain("address.com");
response.addCookie(ck03);
%>
<h2>생성된 쿠키(서버 --> 클라이언트)</h2>
<h3><%=ck01.getName() %>  - <%=ck01.getValue()%></h3>
<h3><%=ck02.getName() %>  - <%=ck02.getValue()%></h3>
<table>
	<tr onclick="goCookie(0);"><td>쿠키 확인하러가기!!(0)</td></tr>
	<tr onclick="goCookie(1);"><td>쿠키 확인하러가기!!(1)</td></tr>
</table>
<script type="text/javascript">
	function goCookie(num){
		location.href="a02_showCookies.jsp?num="+num;
	}

</script>
</body>
</html>