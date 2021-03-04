<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% request.setCharacterEncoding("UTF-8");%>    
	<h3>${param.name }의 구매비용
		${param.price*param.cnt}원</h3>
</body>
</html>