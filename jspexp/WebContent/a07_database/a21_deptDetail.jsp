<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A02_DeptDao"
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
		document.querySelector("#frm").onsubmit=function(){
			console.log("### 폼 객체 처리 ###");
			// 처리할 process 구분 설정..
			//document.querySelector("[name=proc]").value="upt";
			// 		
			var deptnoVal = document.querySelector("[name=deptno]").value;
			if(deptnoVal==""||isNaN(deptnoVal)){
				alert("부서번호를 숫자로 입력해주세요");
				return false;
			}
			// ~10:28
			// 기타 유효성 check;
		};
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick=function(){
			//alert("수정");
			document.querySelector("[name=proc]").value="upt";
			// form의 submit 버튼과 동일 js 처리..
			document.querySelector("#frm").submit();
		};
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick=function(){
			if(confirm("삭제하시겠습니까?")){
				document.querySelector("[name=proc]").value="del";
				// form의 submit 버튼과 동일 js 처리..
				document.querySelector("#frm").submit();
			}
		};		
		
	};
</script>
</head>
<%--
# 부서정보 수정 처리
1. 이벤트로 수정 처리 클릭시, 요청값 전송
2. 전달한 요청값 확인, VO객체로 할당.
3. 수정 sql 작성/확인
4. DAO에서 수정 기능메서드 선언
5. jsp dao 수정 기능메서드 호출/vo객체 할당.
6. js로 수정처리완료 confirm 계속수정/조회화면 이동할지 선택
	location.href="초기 리스트 페이지"
--%>
<%
int deptno = 0;
String deptnoS= request.getParameter("deptno");
if(deptnoS!=null&&!deptnoS.equals("")) deptno = Integer.parseInt(deptnoS);
String proc = request.getParameter("proc");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");
log("## proc ##:"+proc);
A02_DeptDao dao = new A02_DeptDao();
if(proc!=null){
	if(proc.equals("upt")){
		Dept upt = new Dept(deptno, dname, loc);
		log("# 수정 준비 #");
		log("# 번호:"+upt.getDeptno());
		log("# 부서명:"+upt.getDname());
		log("# 위치:"+upt.getLoc());
		dao.updateDept(upt);
	}	
	if(proc.equals("del")){
		log("# 삭제 준비 : "+deptno);
		dao.delDept(deptno);
	}
}
Dept d = dao.getDept(deptno);
%>
<body>
<script type="text/javascript">
	var proc = "<%=proc%>";
	if(proc=="upt"){
		if(confirm("수정성공\n조회페이지로 이동하시겠습니까?")){
			location.href='a04_searchDeptList.jsp';
		}
	}
	if(proc=="del"){
		alert("삭제성공!!")
		location.href='a04_searchDeptList.jsp';
		
	}	
</script>
	<h3>부서정보[<%=request.getParameter("deptno")%>]</h3>
	<form id="frm" method="post">
		<input type="hidden" name="proc"/>
	<table>
		<%if(d!=null){%>
		<tr><th>부서번호</th>
			<td><input type="text" name="deptno" value="<%=d.getDeptno()%>"/></td></tr>
		<tr><th>부서명</th>
			<td><input type="text" name="dname" value="<%=d.getDname()%>"/></td></tr>
		<tr><th>부서위치</th>
			<td><input type="text" name="loc" value="<%=d.getLoc()%>"/></td></tr>
		<%}else{%>
		<tr><td colspan="2">해당 부서정보는 없습니다!</td></tr>
		<%}%>
		<tr><td colspan="2">
		<input type="button" value="메인화면으로"
			onclick="location.href='a04_searchDeptList.jsp'"/>
		<input type="button" id="uptBtn" value="수정"/>
		<input type="button" id="delBtn" value="삭제"/>
		</td></tr>
	</table>
	</form>
</body>
</html>