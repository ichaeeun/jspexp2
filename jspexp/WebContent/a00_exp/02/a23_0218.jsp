<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"       
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
<script type="text/javascript" 
  src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">

<%--
[JSP]
[하] 1. useBean을 이용하여, 회원등록여부를 DB처리를 통해서 등록여부를 확인하세요.
        회원id:[   ] [등록여부확인] => dao 기능메서드를 통해 확인해서 
        해당 id가 있으면 등록된 회원입니다.
        없으면 회원등록 가능합니다. 메시지 처리하기.
--%>

<%--  
[js]
[하] 1. jquery의 lib의 CDN방식과 local호출방식의 차이를 기술하세요.
		CDN :lib는 인터넷에 특정한 주소와 위치에 호출하여 처리하는 방식을 말한다.
			네트웍환경이 되어 있어야 한다.
		local호출 방식 : 위 cdn에 있는 특정한 jquery lib를 다운 받아
			웹어플리케이션 환경의 서버의 특정 위치에 저장하여 호출하여 처리하는 방식을
			말한다. 네트웍환경이 안되어 있어도 자체 테스트나 활용이 가능하다.
[하] 2. $(document).ready(function(){})의 의미를 기술하세요.
		$ : jquery를 활용
		document : 윈도우하위에 출력을 처리하는 document처리하는 객체
		.ready(함수) : document가 메모리에 로딩되어 인식을 할 수 있는 준비 상태가 되면
			처리할 정의된 함수나 익명함수를 수행 처리를 의미한다.
		$(function(){});	
[하] 3. 계층관계의 선택자의 차이(,>)를 기본예제를 통하여 기술하세요.
		$("상위 하위") : 상위계증을 가진 하위요소객체를 선택했을 때!!
		ex) $("table td").css("background-color","blue");
		$("부모>자식") : 바로위상위 요소객체를 가진 하위 요소객체
		ex) $("tr.cls01 > td").css("color","green");

[하] 4. 형제관계의 선택자의 차이(+,~)의 차이를  선택자 예제를 통하여 기술하세요.
		$("형제1+형제2") : 형제1을 바로 앞에 둔 형제2를 선택하여 처리할 경우를 말한다.
		ex) $("label+input").val("선택되었습니다.)
		$("형제1~형제2") : 같은 부모를 가진 같은 레벨에 형제관계에 있을 때,
			형제1이 앞에 있기만하는 모든 형제2를 선택하여 처리할 경우를 말한다.
		ex) $("p~.pre").css("color","yellow");
[하] 5. 속성값의 차이(*=,~=,^=,$=)의 차이를 기술하세요.
		$("[속성]") : 해당 속성이 있으면 선택된다.
		$("[속성=속성값]") : 속성에 속성값이 있을 때, 선택된다.
		$("요소이름[속성*=속성값] : 요소에 속성값이 있기만 하면 선택된다.
		$("[속성~=속성값] : 요소에 속성값이 단어로 있을 때, 선택된다.
		$("[속성^=속성값] : 요소에 속성값으로 시작될 때, 선택된다.
		$("[속성$=속성값] : 요소에 속성값으로 끝날 때, 선택된다.
[하] 6. html(), text(), val()의 기능적 차이를 기술하세요. 
		.html() : 태그의 랜더링이 필요한 코드를 처리할 때, 사용된다. 읽어오는 것도 가능하다.
		.text() : 랜더링 없이 그대로 코드를 저장하거나, 호출할 때, 사용된다.
		.val() : form하위 입력요소객체의 값(.value)를 가져올 때, 사용된다.
		cf) .attr("기본속성","속성값") : 요소객체의 기본 속성과 속성값을 설정할 때
				사용된다.
			.css("css속성","css속성값") : 요소의 css 속성과 속성값을 설정할 때, 사용된다. 
					

--%> 
//
	$(document).ready(function(){
		$("h3").text("회원 id 확인");
	});
</script>
</head>
<body>
<%--
1. 화면 구현
2. bean객체 선언
3. bean객체에 의한 요청값 확인
4. 사용하게 될 sql 확인
5. DAO 처리 기능 메서드 선언
6. dao기능메서드 호출 
7. 결과에 따른 js 처리

 --%>
	<h3></h3>
	<form method="post">
	<table> <!-- 회원id:[   ] [등록여부확인] -->
		<tr><th>회원id</th><td><input type="text" name="id"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록여부확인" /></td></tr>
	</table>
	</form>
	<jsp:useBean id="mem" class="jspexp.z01_vo.Member" ></jsp:useBean>
	<jsp:setProperty property="id" name="mem"/>
	<%
		boolean isInit=true;
		boolean hasMember = false;
		if(mem.getId()!=null){
			isInit=false;
			log("## 입력한 id:"+mem.getId());
			A04_MemberDao dao = new A04_MemberDao();
			hasMember = dao.hasMember(mem.getId());
		}
	%>
	<script type="text/javascript">
		var isInit=<%=isInit%>;
		if( !isInit ){ //요청값 즉, id를 확인했을 때..
			var hasMember = <%=hasMember%>;
			if(hasMember){
				alert("해당 id가 있습니다. id를 입력해주세요");
				$("[name=id]").focus();
			}else{
				alert("해당 id로 등록가능합니다.");
				$("[name=id]").val("<%=mem.getId()%>");
			}
		}
	</script>
</body>
</html>


