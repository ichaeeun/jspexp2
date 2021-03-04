<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"%>
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
<%
   String ename = request.getParameter("ename"); if(ename==null) ename=""; log("#ename:"+ename);   
   String job = request.getParameter("job"); if(job==null) job=""; log("#job:"+job);
   String mgr = request.getParameter("mgr"); if(mgr==null||mgr.trim().equals("")) mgr="0"; log("#mgr:"+mgr);
   String hiredate_s = request.getParameter("hiredate_s"); if(hiredate_s==null) hiredate_s=""; log("#hiredate_s:"+hiredate_s);
   String sal = request.getParameter("sal"); if(sal==null||sal.trim().equals("")) sal="0"; log("#sal:"+sal);
   String comm = request.getParameter("comm"); if(comm==null||comm.trim().equals("")) comm="0"; log("#comm:"+comm);
   String deptno = request.getParameter("deptno"); if(deptno==null||deptno.trim().equals("")) deptno="0"; log("#deptno:"+deptno);
   // 입력할 객체 완성
   // 초기화면과 구분하기 위해서..
   //int empno, String ename, String job, int mgr, String hiredate_s, double sal, double comm, int deptno
   if(!ename.equals("")){
      Emp ins = new Emp(0, ename,job,new Integer(mgr),hiredate_s,new Double(sal),
            new Double(comm),new Integer(deptno));
      log("입력 내용 확인:"+ins.getEname());
      A01_Dao dao = new A01_Dao();
      dao.insertEmp(ins);
   }
   
   // ex) a04_searchDeptList.jsp 화면에서 등록 처리하는 화면 구현과 dao 처리를 하세요.
%> 
   <script>
      var ename = "<%=ename%>";
      if(ename!=""){
         alert('등록 성공');
         if(confirm("등록성공\n조회페이지로 이동하시겠습니끼?")){
            location.href="a03_searchEmpList.jsp";
         }
      }
   </script>
   <h3>사원등록페이지</h3>
   <form method="post">
   <table>
      <tr><th>사원명</th><td><input name="ename"/></td></tr>
      <tr><th>직책</th><td><input name="job"/></td></tr>
      <tr><th>관리자</th><td><input name="mgr"/></td></tr>
      <tr><th>입사일</th><td><input name="hiredate_s"/></td></tr>
      <tr><th>급여</th><td><input name="sal"/></td></tr>
      <tr><th>보너스</th><td><input name="comm"/></td></tr>
      <tr><th>부서번호</th><td><input name="deptno"/></td></tr>
      <tr><td colspan="2"><input type="submit" value="등록"></td></tr>
   </table>
   </form>
</body>
</html>