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

</head>
<%--        
[JSP]
[하] 1. PreparedStatement를 사용하는 이유를 기술하세요.
		1) sql injection를 막기위해서 사용된다.
			- sql injection : 해킹방법의 하나이다. 
				동적인 sql(문자열과 문자열을 조합시켜 sql 처리)
				이 화면에서 입력 form요소객체로 만들어서 서버에서
				원하지 않는 데이터를 처리하는 것을 말한다.
[하] 2. 부서정보조회를 위 PreparedStatement를 활용하여 처리하세요.
			String sql = "	SELECT *\r\n"
					+ "	FROM DEPT10\r\n"
					+ "	WHERE dname LIKE '%'||?||'%'\r\n"
					+ "	AND loc LIKE '%'||?||'%'"
					+ "	ORDER BY deptno DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getDname());
			pstmt.setString(2, sch.getLoc());
			// 3. 결과
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dlist.add(new Dept(rs.getInt(1),
								   rs.getString(2),
								   rs.getString(3)));	
			}
			System.out.println("데이터 크기:"+dlist.size());
			// 4. 자원해제
			rs.close();
			pstmt.close();
			con.close();	
--%>

<%--  
[js]
[하] 1. 이벤트, 이벤트대상객체, 이벤트 핸들러 함수를 구분하여 예제를 통하여 개념을 정리하세요.
		
[중] 2. 물건명 :[    ] 가격:[    ] 갯수 [0](버튼)
         @@@를 @@@원에 @@개 구매하여 @@@원입니다.
        버튼을 클릭할 때 마다, 카운트가 업되고, 하단의 출력내용을 변경하게 처리하세요
        단) 대상객체.이벤트 = 핸들러함수 형식으로 처리하세요.
--%>
<script>
	window.onload=function(){
		
		var h3Obj = document.getElementsByTagName("h3")[0];
		// h3Obj : 이벤트를 처리할 대상객체
		// click : 이벤트
		// 대상객체.onclick : 이벤트를 대상객체의 속성으로 지정
		// function(){} : 이벤트가 수행될 때, 처리할 handler 함수
		h3Obj.onclick=function(){
			// this : 함수 안에서 이벤트를 처리하는 대상객체를 지칭할 때, 활용된다.
			this.style.backgroundColor="yellow";
			this.innerText="이벤트 완료!!";
		}
		var pname = document.querySelector("[name=pname]");
		var price = document.querySelector("[name=price]");
		var btn01 = document.querySelector("#btn01");
		var show = document.querySelector("#show");
		btn01.onclick=function(){
			this.value = Number(this.value) + 1;
			var prn = pname.value+"를 "+price.value+"원에 "+
				this.value+"개 구매하여 "+(price.value*this.value)+"원입니다.";
			show.innerText = prn;		
		}
	};
</script>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>갯수</th><td><input type="button" value="0" 
								id="btn01" style="width:80%"/></td></tr>
		<tr><td colspan="2" id="show">내용</td></tr>
	</table>
</body>
</html>