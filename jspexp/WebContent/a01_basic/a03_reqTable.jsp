<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
# 요청값을 테이블 자동 생성..
--%>
<body>
	<form>
		열의 갯수:<input type="text" name="col"/><br>
		행의 갯수:<input type="text" name="row"/><br>
		<input type="submit" value="테이블 생성!!"/>
	</form>
	<%
	// 물리적으로 파일을 하나이나, 
	// 논리적으로는 전달하는 파일, 입력값을 받는 파일..
	String colS= request.getParameter("col");
	String rowS= request.getParameter("row");
	int col=1, row=1; //
	// 논리적으로 전달받았을 때 페이지를 구분하여 처리하는 부분.
	// 1. 초기페이지는 요청값이 없기 때문에 colS=null이 할당되어 있다.
	// 2. submit를 클릭해서 논리적으로 다음에서 colS값이 있을 때,
	// 조건문에 의해 1/2의 process을 구분하기 위해..
	if(colS!=null) col=Integer.parseInt(colS);
	if(rowS!=null) row=Integer.parseInt(rowS);
	int cnt=1;
	%>
	<table width="400" height="400" border>
		<%for(int rCnt=1;rCnt<=row;rCnt++){ %>
		<tr>
			<%for(int cCnt=1;cCnt<=col;cCnt++){ %>
			<td> <%=cnt++%></td>
			<%}%>
		</tr>
		<%}%>
	</table>
	
	
	<%--
		<%for(int rCnt=1;rCnt<=row;rCnt++){%>
			<tr>
				<%for(int cCnt=1;cCnt<=col;cCnt++){%>
					<td><%=cnt++%></td>
				<%}%>
			</tr>
		<%}%>	
	
	
	 --%>
	
	
</body>
</html>