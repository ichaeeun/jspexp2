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
ex) 화면에 임의의 숫자
	@@ X @@ = ?
	정답입력[   ]
	   [확인]    ==> 정답을 맞추면 a18_succ.jsp
	   			==> 틀리면 a19_fail.jsp로 이동 처리.
	  ~ 14:30 			
 --%>
<%
	int num01 = 5;
	int num02 = 7;
	int corNum = num01*num02;
	String innumS = request.getParameter("innum");
	if(innumS!=null){ //데이터를 입력했을 때.
		int innum = Integer.parseInt(innumS);
		if(num01*num02 == innum){ // 정답일때.
			response.sendRedirect("a18_succ.jsp");
		}else{
			response.sendRedirect("a19_fail.jsp?innum="
				+innum+"&corNum="+corNum);
		}
	}
%> 
<body>
	<h3>구구단 게임</h3>
	<form method="post">
	<table>
		<tr><th><%=num01 %> X <%=num02%> = ?</th></tr>
		<tr><td>정답입력 : <input type="text" name="innum"/></td></tr>
		<tr><td><input type="button" value="정답확인" onclick="valid()"/></td></tr>
	</table>
	</form>
</body>
<script type="text/javascript">
	function valid(){
		var inNumObj=document.querySelector("input[name=innum]");
		if(inNumObj.value==""){
			alert("데이터를 입력하세요.");
			inNumObj.focus();
			
		}else{
			if(isNaN( inNumObj.value ) ){
				alert("숫자를 입력하세요.");
				inNumObj.value="";
				inNumObj.focus();				
			}else{
				// 정상 데이터로 입력했을 때, 전송 처리..
				document.querySelector("form").submit();
			}
		}
	}
</script>
</html>