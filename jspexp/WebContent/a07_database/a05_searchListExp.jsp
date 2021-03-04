<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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
ex) 
1. sql
SELECT job, count(*) cnt, 
		round( avg(sal) ) avgsal
FROM EMP e 
GROUP BY job
having round( avg(sal) ) >= 2000
ORDER BY job
;
2. 화면
	평균연봉 [     ] 이상
	[검색]
	직책   인원  평균연봉
--진행순서--------------------
0. 화면구현/요청값 처리  15:35
1. sql 확인	
2. VO작성	 jspexp.z01_vo.JobSalary	15:40
3. Dao 기능 메서드 구현 15:45
4. 화면처리.  16:00

--%>
<body>
<%--
// jspexp.z01_vo.JobSalary
public class JobSalary {
	private String job;
	private int cnt;
	private int avgsal;   ~ 16:10
 --%>
<%
	String avgsal = request.getParameter("avgsal");
	if(avgsal==null||avgsal.equals("")) avgsal="0";
	int avg = Integer.parseInt(avgsal);
	log("##요청값:"+avgsal);
	A01_Dao dao = new A01_Dao();
	ArrayList<JobSalary> jlist = dao.jobSalList(avg);
%>
	<h3>부서별 통계정보</h3>
	<form method="post">
	<table>
		<tr><th>평균연봉</th>
			<td><input type="text" 
				name= "avgsal" value="<%=avgsal%>"/>만원 이상</td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>직책</th><th>인원</th><th>평균연봉</th></tr>
		<%for(JobSalary js:jlist){ %>
		<tr><td><%=js.getJob()%></td>
			<td><%=js.getCnt() %></td>
			<td><%=js.getAvgsal()%></td></tr>
		<%}%>
	</table>	
</body>
</html>