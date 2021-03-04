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
<%
	// 요청값.
	String []inArry = request.getParameterValues("innum");
	String []coArry = request.getParameterValues("cornum");
	int totPoint=0;
	// 입력한 데이터와 정답값을 비교하기 위해 반복문 설정..
	for(int idx=0;idx<inArry.length;idx++){
		int innum = Integer.parseInt(inArry[idx]);
		int cornum = Integer.parseInt(coArry[idx]);
		// 서버 내부에서 데이터 확인
		log(innum+":"+cornum);
		System.out.println(innum+":"+cornum);
		if(innum==cornum){
			totPoint+=10;
		}
	}

%>
<body>
	<h3>결과</h3>
	<h4><%=totPoint%>점</h4>
</body>
</html>