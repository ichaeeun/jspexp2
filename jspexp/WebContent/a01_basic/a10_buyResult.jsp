<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
<%--
ex3) form 활용  전송페이지 a10_buyResult.jsp
		물건명 : [   ]
		가격 : [   ]
		갯수 :[   ]
		구매방법 : [현금/카드/포인트]select(단일선택)
		배송지 :()서울방배동()서울신림동()경기수원 radio(단일선택)
		기타관심 물건 :[]바나나[]딸기[]수박[]오렌지[]키위(다중선택)
		[구매]
 --%>
	<h3>구매선택!</h3>
	<form action="a09_requestExp.jsp" method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt"/></td></tr>
		<tr><th>구매방법</th>
			<td><select name="pay">
					<option>현금</option>
					<option>카드</option>
					<option>포인트</option>
				</select></td></tr>
		<tr><th>배송지</th>
			<td>
				<label><input type="radio" name="address" value="서울방배동"/>서울방배동</label>
				<label><input type="radio" name="address" value="서울신림동"/>서울신림동</label>
				<label><input type="radio" name="address" value="경기수원"/>경기수원</label>
				
			</td></tr>
		<tr><th>기타관심 물건</th><td>
				<label><input type="checkbox" name="ps" value="바나나"/>바나나</label>
				<label><input type="checkbox" name="ps" value="딸기"/>딸기</label>
				<label><input type="checkbox" name="ps" value="오렌지"/>오렌지</label>
				<label><input type="checkbox" name="ps" value="수박"/>수박</label>
				<label><input type="checkbox" name="ps" value="키위"/>키위</label>
				</td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>
	</form>
</body>
</html>