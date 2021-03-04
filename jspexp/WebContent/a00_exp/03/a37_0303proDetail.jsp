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
 
 
--%>
//
   var proc = "${param.proc}";
   if(proc=="upt"){
	   if(confirm("수정완료\n조회페이지로 이동하시겠습니까?")){
		   location.href="${path}/product.do";
	   }
   }
   
   if(proc=="del"){
	   alert("삭제완료");
	   location.href="${path}/product.do";
   }
   
   if(proc=="ins"){
	   if(confirm("등록완료\n조회화면으로 이동하시겠습니까?")){
		   location.href="${path}/product.do";
	   }
   }
   
   $(document).ready(function(){
      $("#uptBtn").on("click",function(){
    	 if(confirm("수정하시겠습니까?")){
    		 $("[name=proc]").val("upt");
    		 $("form").submit();
    	 }
      });
      
	  $("#delBtn").on("click",function(){
    	  if(confirm("삭제하시겠습니까?")){
    		 $("[name=proc]").val("del");
     		 $("form").submit();
    	  }
      });
	  
	  $("#insBtn").on("click",function(){
		  if(confirm("등록하시겠습니까?")){
			  $("[name=proc]").val("ins");
	     	  $("form").submit();
		  }
	  })
   });
</script>
</head>
<body>
 <h3>
 <c:choose>
 	<c:when test="${param.proc=='insFrm'}">물품등록</c:when>
 	<c:otherwise>물건상세정보[${prod.pno }]</c:otherwise>
 </c:choose>
 </h3>
	<form method="post">
		<input type="hidden" name="proc" value=""/>
	<table>
	<%--	<c:choose>
			<c:when test="${not empty prod.pno}">--%>
				<c:if test="${param.proc!='insFrm' }">
				<tr><th>물건번호</th><td><input type="text" name="pno" 
				value="${prod.pno}"/></td></tr>
				</c:if>
				<tr><th>물건명</th><td><input type="text" name="name" value="${prod.name}"/></td></tr>
				<tr><th>가격</th><td><input type="text" name="price" value="${prod.price}"/></td></tr>
				<tr><th>재고</th><td><input type="text" name="cnt" value="${prod.cnt}"/></td></tr>
				<c:if test="${param.proc!='insFrm' }">
				<tr><th>등록일</th><td>
				<input type="text" name="credteS" 
						value="<fmt:formatDate type='date' 
							pattern='yyyy-MM-dd' value='${prod.credte}'/>" 
						placeholder="yyyy-MM-dd"/></td></tr>
				</c:if>
				<tr><th>제조사</th><td><input type="text" name="company" value="${prod.company}"/></td></tr>
				<c:if test="${param.proc!='insFrm' }">
				<tr><th>최근입고일</th><td><input type="text" name="incomedteS" 
						value="<fmt:formatDate type='date' 
							pattern='yyyy-MM-dd' value='${prod.incomedte}'/>" 
						placeholder="yyyy-MM-dd"/></td></tr>
				</c:if>
				<tr><th>입고책임자</th><td><input type="text" name="inmanager" value="${prod.inmanager}"/></td></tr>
			<%-- </c:when>	--%>
			<%-- <c:otherwise>
				<tr><td colspan="2">데이터가 없습니다!</td></tr>
			</c:otherwise> 
		</c:choose>--%>
		<tr><td colspan="2">
		<c:choose>
			<c:when test="${param.proc=='insFrm' }">
				<input type="button" value="등록" id="insBtn"/>
			</c:when>
			<c:otherwise>
				<input type="button" value="수정" id="uptBtn"/>
				<input type="button" value="삭제" id="delBtn"/>
			</c:otherwise>
		</c:choose>
				<input type="button" value="메인페이지이동" onclick="location.href='${path}/product.do'"/>
		</td></tr>
		
	</table>
	</form>
</body>
</html>