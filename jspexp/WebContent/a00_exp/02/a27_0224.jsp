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
[ajax]
[하] 1. ajax데이터의 속성과 속성값 처리 형식을 기술하세요.
		1) ajax에서 사용하는 기능 메서드의 속성/속성값
			open("get/post","url", 비동기여부 true/false)
			onreadystatechange=function(){}
			readyState
			status
		2) json형식
			{"속성":"문자열속성값","속성":숫자형/boolean형속성값}	
[하] 2. 부서 정보를 ajax로 keyup을 통해서, 검색 출력하세요.

[중] 3. 오늘 ajax로 리스트 emp 데이터를 행단위로 클릭시 empno데이터를 요청값으로 넘겨주어
    list된 화면에 중앙 위치에 div 창이 show(), hide()를 통해서 상세내용을 ajax를 통해서
    출력하세요. dao의 Emp getEmp(int empno)메서드 활용
--%>
//
	var xhr = new XMLHttpRequest();
	$(document).ready(function(){
		$("#eDetail").hide();
		$("[name=dname],[name=loc]").keyup(function(){
			if(event.keyCode==13){
				ajaxFunDept();	
			}
		});
		$("[name=ename], [name=job]").keyup(function(){ 
			if(event.keyCode==13){ // enter키를 입력했을 때.
				ajaxFunEmp()
			}
		});		
		
	});
	function ajaxFunEmp(){
		var enameV = $("[name=ename]").val();
		var jobV = $("[name=job]").val();
		var qstr = "ename="+enameV+"&job="+jobV;
		
		xhr.open("get","z02_empList.jsp?"+qstr,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				$("div#emp").html(xhr.responseText);				
			}
		};
		xhr.send();		
	}		

	
	function ajaxFunDept(){
		var dnameV = $("[name=dname]").val();
		var locV = $("[name=loc]").val();		

		var qstr = "dname="+dnameV+"&loc="+locV;
		//alert(qstr)
		xhr.open("get","a28_deptList.jsp?"+qstr,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				//alert(xhr.responseText);
				console.log(xhr.responseText);
				$("div#dept").html(xhr.responseText);	
				//alert($("div#dept").html());
			}
		};
		xhr.send();		
	}	
	function ajaxFunDetail(empno){
		console.log("empno:"+empno);
		//alert("ajax 처리");
		var qstr = "empno="+empno;
		
		xhr.open("get","z03_empDetail.jsp?"+qstr,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				console.log(xhr.responseText);
				//alert(xhr.responseText);
				$("div#eDetail").html(xhr.responseText);				
			}
		};
		xhr.send();		
		
	}		
	
	
/*
# 상세화면 popup 처리
1. 로딩되는 div 설정
	1) css로 절대 위치 지정, 크기
	2) 초기 화면은 해당 div를 .hide()(jquery에서 보이지 않게 처리)
2. 리스트 화면에서 클릭시
	1) empno값 전달
	2) 로딩 div 보이게 처리 .show()
	3) ajax로 empno의 값으로 처리된 상세화면 jsp 구현
	4) ajax로 해당 화면 호출..
	5) 기타 창닫기 처리 .close();
 */	
 	function detailEmp(empno){
		//alert("조회 empno:"+empno);
		ajaxFunDetail(empno)
		$("#eDetail").show();
	}
	function closeEmp(){
		$("#eDetail").hide();
	}
</script>
</head>
<body>
	<h2>사원정보 ajax</h2>
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job"/></td></tr>
	</table>
	<div id="emp"></div>
	<div id="eDetail" 
		style="position:absolute;left:25%;top:20%;width:40%;height:35%;
			background-color:yellow;padding:3%;">
	
	</div>

	<h2>부서정보(ajax)</h2>
	<table>
		<tr><th>부서명</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc"/></td></tr>
	</table>
	<div id="dept"></div>

<%--        
[JSP]
[하] 1. forTokens의 기본 속성값을 기술하세요.
		1) var : 구분자에 의해 추출된 데이터를 변수에 할당.
		2) items : 구분자가 있는 문자열 데이터
		3) delims : 구분자를 선언
		4) varStatus : 나타난 데이터를 index, count, first, last
			변수로 효과적으로 처리
[하] 2. 좋아하는 스포츠 스타 9명을 #으로 리스트하여 forTokens를 이용해서 3X3 테이블에 출력하세요.
--%>
	
	<h3>3 X 3 테이블</h3>
	<c:set var="stars" value="손흥민#류현진#김연아#박지성#추신수#이대호#박찬호#차범근#기성용"/>
	<table>
		<c:forTokens var="star" items="${stars}" delims="#" varStatus="sts">
		
		<c:if test="${sts.count%3==1}">
		<tr>
		</c:if>
			<td>${star}</td>
		<c:if test="${sts.count%3==0}">
		</tr>
		</c:if>
		
		</c:forTokens>
	</table>
</body>
</html>