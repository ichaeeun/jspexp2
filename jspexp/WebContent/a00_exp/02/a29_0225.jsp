<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
# 발표 준비가 끝나시거나, 개인과제 진행하시는 분들 진행하시면 될 것같습니다.
[ajax]
[하] 1. ajax의 post방식 선언 속성을 기술하세요.
		xhr.open("post","url",true);
		xhr.sendRequestHeader("Content-Type, application/x-www-from-urlencoded");
		xhr.send("요청키=요청값&요청키=요청값...");

[중] 2. 물건 번호:[   ] 입력 후, enter키를 입력시, 물건 정보가 있으면
        상세내용을 출력 하세요.
        1) 화면 ui 구현
        2) key이벤트로 해당 요소객체 선택하여 ajax함수 호출
        3) ajax처리를 통한 데이터 호출 .jsp 처리
        	- dao객체 및 메서드 작성
        	- dao호출 메서드 호출 후, json형식의 속성 및 속성값 형식 처리
        3) ajax함수 결과값 받기 처리
         	- json 문자열 데이터 객체화변화
         	- 화면에 특정한 요소객체에 json 데이터 입력하기.
         	
        
[하] 3. deptlist를 json형식으로 로딩하여 ajax로 가져와서 출력하세요. 
 
 


 
 
--%>
//
	var xhr = new XMLHttpRequest();
	$(document).ready(function(){	
		$("#data").hide();
		$("[name=pno]").keyup(function(){
			if(event.keyCode==13){
				$("#data").hide();
				if( !isNaN(this.value) ){ // 숫자형일때만 입력
					ajaxFun(this.value);
				}else{
					alert("물건번호는 숫자형으로 입력해주세요");
					$(this).val("");
					$(this).focus();
				}
			}			
		});
	});
	function ajaxFun(pno){		
		var qstr = "pno="+pno;
		xhr.open("get","a30_data.jsp?"+qstr,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				//alert(xhr.responseText);				
				var prod = JSON.parse(xhr.responseText);				
				if(prod.name!=""){
					$("#data td").eq(0).text(prod.name);
					$("#data td").eq(1).text(prod.price);
					$("#data td").eq(2).text(prod.cnt);
					$("#data td").eq(3).text(prod.credte);
					$("#data td").eq(4).text(prod.company);
					$("#data td").eq(5).text(prod.incomedte);
					$("#data td").eq(6).text(prod.inmanager);
					$("#data").show();
				}else{
					alert("데이터가 없습니다.");
				}
				
			}
		};
		xhr.send();		
	}
</script>
</head>
<body>
	<h3>물건정보 확인</h3>
	<table>
		<col width="30%">
		<tr><th>물건번호</th><td>
		<input type="text" name="pno"/></td></tr>
	</table>
	<table id="data">
		<col width="30%">
		<tr><th>물건명</th><td></td></tr>
		<tr><th>가격</th><td></td></tr>
		<tr><th>갯수</th><td></td></tr>
		<tr><th>초기입고일</th><td></td></tr>
		<tr><th>생산지(회사)</th><td></td></tr>
		<tr><th>최근입고일</th><td></td></tr>
		<tr><th>입고담당자</th><td></td></tr>
	</table>
</body>
</html>