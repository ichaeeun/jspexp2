<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
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
<script>
	window.onload=function(){
		
	};
</script>
</head>
<%--
<%--        
[JSP]
[하] 1. 웹화면에서 데이터를 삭제할 때, 진행되는 순서를 간단하게 기술하세요.
		1) 삭제 화면과 사용자 인터페이스 구현
			버튼 이벤트를 통해서 삭제 클릭시, hidden값으로 설정되 proc에 del값으로
			저장, 키값을 요청값으로 전송
		2) 삭제에 필요한 요청값 확인 (요청 key, proc의 del값)
		3) 삭제 sql 작성
		4) dao단에서 삭제 처리 기능 메서드 구현 
			public void deleteXXXX(키의 값을 받는 매개변수)
		5) jsp 화면에서 proc에 의해 del일때,
			요청 key를 dao의 기능메서드에 전달.
			ex) dao.deleteXXX(키);
		6) js로 삭제 완료, 전체 리스트 화면 호출. 	
[하] 2. 물건객체에서 삭제처리하는 프로세스에 의해 삭제 처리하세요
[하] 3. useBean에서 property와 필드를 구분하여 기술하세요.
		필드는 useBean의 대상이 되는 클래스의 class변수/상수를 의미하고,
		일반적으로 접근제어자가 private이기에 직접적인 접근을 할 수 없다.
		property는 useBean의 대상이 되는 객체의 setXXX()메서드와
		getXXX()메서드로 jsp에서 호출할 때는 set과 get은 빼고, 나머지
		메서드명을 소문자로 만들어 지칭한다. 접근제어자는 일반적으로 public
		으로 접근하여 사용할 수 있다.

[하] 4. 아이디, 패스워드, 이름, 포인트, 권한이 있는 Member Vo객체를 만들고,
        회원등록페이지와 useBean을 이용해서, 등록버튼 클릭시 등록 회원을
        확인할 수 있게 처리하세요.
--%>
<%--  
[js]
[하] 1. 윈도우창 로딩시, 매개변수에 따른 기본 옵션을 기술하세요.
		window.open("url주소","윈도우명","창의옵션-크기,넓이,스크롤바여부 등");
[하] 2. 윈도창이 왼쪽 상단에 로딩되어, 오른쪽으로 하단으로 다시 왼쪽으로
        위로 이동하여 멈추게 처리하세요.(자동으로 이동)
--%>
<script>
	function openWin(){
		var win = window.open("","","width=300,height=300");
		win.document.write("<h2>움직이는 창!</h2>");
		var xpos=0;
		var ypos=0;
		var cnt = 0;
		var setInt=setInterval(function(){
			cnt++;
			if(cnt<=20){ // 1~20 x축을 오른쪽으로 이동
				xpos+=10;	
			}else if(cnt<=40){//21~40 y축을 아래로 이동
				ypos+=10;
			}else if(cnt<=60){//41~60 x축을 왼쪽으로 이동
				xpos-=10;	
			}else if(cnt<=80){//60~80 y축을 위로 이동
				ypos-=10;
			}else{			// 80초과 할 때, 반복처리 중단 
				clearInterval(setInt);
			}
			win.moveTo(xpos,ypos);
		},100);
	}
</script>
<body>
	<h2 onclick="openWin()">윈도우 창열기</h2>
	<h3>회원가입</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pass"/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point"/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="page"/>
	<jsp:setProperty property="*" name="m"/>	
	<jsp:useBean id="list" class="java.util.ArrayList" scope="session"/>
	<%if(m.getId()!=null){
		list.add(m);
	  }
	%>
	<h3>가입된 회원(<%=list.size()%>)</h3> <!-- ~11:30 -->
	<table>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th><th>포인트</th><th>권한</th></tr>
		<%for(int idx=0;idx<list.size();idx++){ 
			Member mem = (Member)list.get(idx);
		%>
		<tr><td><%=mem.getId()%></td><td><%=mem.getPass()%></td>
		<td><%=mem.getName()%></td><td><%=mem.getPoint()%></td>
		<td><%=mem.getAuth()%></td></tr>
		<%} %>
	</table>
</body>
</html>