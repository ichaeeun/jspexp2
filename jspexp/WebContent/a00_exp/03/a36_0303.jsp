<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--        
[JSP]
[하] 1. MVC 패턴에서 list에서 상세화면 처리 시, 요청값 처리방식에 대하여 기술하세요
		1) 상세처리 controller에 해당 데이터 클릭 시 요청값 전달 
			# 화면 
			<tr class="data"><td>key데이터</td>...
			var key데이터 = $(".data").on("dblclick",function(){
				$(this).children().eq(0).text(); // tr 하위 td의 key데이터 
				location.href ="${path}/요청컨트롤러uri?요청key="+key데이터; 
			});
			# 컨트롤러 
			String key받을변수 = request.getParameter("요청key"); 
			
			  
[하] 2. MVC 패턴에서 상세화면에서 수정과 삭제 처리 시, 요청값의 내용과 조건에 따른 처리를 기술하세요.
		1) hidden 으로 프로세스를 요청값으로 넘기고, 해당 프로세스의 요청값에 따라서 
			dao의 수정메서드와 삭제메서드를 처리한다. 
			<input type="hidden" name="proc"/> 
			요청값을 넘기는 것은 name속성으로 선언하여야지 controller 전달하기 때문에 
			받드시 name="proc"형태로 처리하여야 한다. 
			<input type="button" id="uptBtn"/>
			<input type="button" id="delBtn"/>
			
			$("#uptBtn").on("click",function(){
				if(confirm("수정하시겠습니까?")){
					// 유효성 check
					$("[name=proc]").val("upt");
					$("form").submit();
				}
			});
			$("#delBtn").on("click",function(){
				if(confirm("삭제하시겠습니까?")){
					// 유효성 check
					$("[name=proc]").val("del");
					$("form").submit();
				}
			});		
			
수정,삭제 시 각각 Proc 값을 upt,del로 controller에 넘겨준다. 
String proc = request.getParameter("proc"); 
if(proc!=null) {
	if(proc.equals("upt")) { 
		// 수정에 필요한 요청값 받기,매개객체에 생성자로 할당 
		// 수정에 필요한 dao.기능메서드(매개객체) 
		
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgr = request.getParameter("mgr");
		String hiredate_s = request.getParameter("hiredate_s");
		String sal = request.getParameter("sal");
		String comm = request.getParameter("comm");
		String deptno = request.getParameter("deptno");						
		Emp upt = new Emp(empno, ename, job, 
				Integer.parseInt(mgr), hiredate_s, 
				Double.parseDouble(sal), Double.parseDouble(comm),
				Integer.parseInt(deptno) );
		dao.updateEmp(upt);				
	}
	if(proc.equals("del")) {
		// 삭제에 필요한 dao.기능메서드(key변수) 
		System.out.println("삭제 준비 완료:"+empno);
		dao.deleteEmp(empno);				
	}
}
detail controller에서 proc 값을 받아서, 
upt,del일 경우 각각 dao메서드를 실행한다. 
[중] 3. MVC 패턴으로 물품 상세화면/수정 처리를 해보세요.
---controller------
request.setCharacterEncoding("utf-8");
String pnoS = request.getParameter("pno");
String proc = request.getParameter("proc");
if(pnoS==null) pnoS="0";
int pno = Integer.parseInt(pnoS);
A03_ShopDao dao = new A03_ShopDao();
if(proc!=null) {
	if(proc.equals("upt")) {
		String name = request.getParameter("name");
		String priceS = request.getParameter("price");
		if(priceS==null) priceS="0";
		int price = Integer.parseInt(priceS);
		String cntS = request.getParameter("cnt");
		if(cntS==null) cntS="0";
		int cnt = Integer.parseInt(cntS);
		String credteS = request.getParameter("credteS");
		String company = request.getParameter("company");
		String incomedteS = request.getParameter("incomedteS");
		String inmanager = request.getParameter("inmanager");
		dao.updateProduct(new Product2(pno,  name,  price,  cnt, 
				 credteS,  company,  incomedteS,
				 inmanager));
	}
	
	if(proc.equals("del")) {
		System.out.println("삭제 준비 완료:"+pno);
		dao.deleteProduct(pno);
	}
}

request.setAttribute("prod", dao.getProd(pno));


String page = "/a00_exp/03/a37_0303proDetail.jsp";
RequestDispatcher rd = request.getRequestDispatcher(page);
rd.forward(request, response);

--%>
<%--  
[js]
[하] 1. 좋아요/싫어요 버튼을 클릭시, 하단에 하트가 하나씩 늘어나든지/줄어들던지 하세요(단 한번만)

[중] 2. 임의의 구구단 문제를 나오게 하고, 정답확인을 클릭시 정답여부를 나오게 한다.
        5초가 지나도 정답여부를 출력하게 처리하세요.
 
--%>
//
	$(document).ready(function(){
		// 실제 구현 db에서 session으로 한 게시물 당 한번만 좋아요/싫어요 처리하고, 
		// db에 평가처리했다는 것을 저장 처리. ajax 필요 
		var curFavCnt=2;
		$("#result").hide();
		
		$("#favor").one("click","button",function(){
			$("#heart").text("");
		//	alert($(this).text());
			if($(this).text()=="좋아요"){
				curFavCnt++;
			}else{
				curFavCnt--;
			}
			for(var cnt=1;cnt<=curFavCnt;cnt++){
				$("#heart").append("❤︎");
			}
		});
		
		/* $("#like").one("click",function(){
			$("#heart").append("❤︎");
		});
		
		$("#unlike").one("click",function(){
			 $("#heart").text($(this).val().slice(0,-1));
		}); */
		
		/* $("#check").one("click",function(){
			$("#result").show();
		});
		
		setTimeout(function(){
			$("#check").trigger("click");
		},5000); */
		
		var num01 = Math.floor(Math.random()*8+2);
		var num02 = Math.floor(Math.random()*8+2);
		$("#shExam").text(num01+"X"+num02);
		$("#check").one("click",function(){
			var ans = $("[name=ans]").val();
			if(num01*num02==ans){
				alert("정답");
				$("#result").val(num01*num02).show();
			}else{
				alert("오답");
				$("#result").val(num01*num02).show();
			}
		});
		
		var cnt = 5; 
		var intSet = setInterval(function(){
			$("span").text(--cnt);
			if(cnt<=0){
				clearInterval(intSet);
			}
		},1000);
		setTimeout(function(){
			$("#check").trigger("click");
		},6000);
		
	});
</script>
</head>
<body>
	<div id="favor">
	<button id="like">좋아요</button>
	<button id="unlike">싫어요</button>
	</div>
	<div id="heart">❤❤</div>
	
	<h3>구구단 남은시간: <span></span></h3>
<%-- 	<% 
		int num01 = (int)(Math.random()*9+1); 
		int num02 = (int)(Math.random()*9+1); 
		int result = num01*num02;
	%> --%>
	
	<table>
		<tr><th id="shExam"></th><td><input name="ans"/></td><td><button id="check">정답확인</button></td></tr>
		<tr><td colspan="3">정답:<input id="result" value=""></td></tr>
	</table>
	
	<%-- <h3><%=num01 %>X<%=num02 %>=<input name="ans"/></h3>
	<button id="check">정답확인</button>
	<h3 id="result">정답: <%=result %></h3>
	 --%>
	
</body>
</html>