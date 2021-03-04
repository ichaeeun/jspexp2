<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
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
[jsp]
[하] 1. 파일관리하는 서버 정보를 fileServer/124.243.3.5 , 특정 이미지의 경로 정보를 설정하여, 화면에 출력하게 하세요.
		web.xml
		  <context-param>
			<description>파일서버</description>
			<param-name>fileServer</param-name>
			<param-value>124.243.3.5</param-value>
		  </context-param>  
		  <context-param>
			<description>이미지경로</description>
			<param-name>imgPath</param-name>
			<param-value>a01_img</param-value>
		  </context-param>  
		호출페이지.jsp	  
			application.getInitParameter("fileServer")
			application.getInitParameter("imgPath")
[하] 2. 서버 안에 log에 대한 여러가지 출력 형식을 기술하세요.
		log("jsp 접두어 로그");
		application.log("서버단위log");
		System.out.println("콘솔 로그");
[중] 3. jsp:include 액션 태그를 이용해서 상단/하단이 나뉘어지고, 상단에 메뉴 하단에 페이지가 만들어 지면, 상단의 로그인/상품/관리자 메뉴에 클릭에 따라
       하단의 페이지가 변경되게 처리하세요.
       <div>
       		<jsp:include page="top.jsp">
       			<jsp:param name="key" value="전송할값"/></div>
       <div>			
       		<jsp:include page="buttom.jsp"></div>
       		
       		
[js]
[하] 1. 생성자 함수의 기본형식을 선언하고, weekendSch(주말 계획-날짜/시간/일과내용/shMySche())를 예제로 출력해보세요.
   function WeekendSch(date, time, content){
      this.date = date;
      this.time = time;
      this.content= content;
      this.shMySche = function(){
         return "날짜 : " + this.date + " 시간 : " +
          this.time + " 내용 : " + this.content;
      };
   }
   var mysch = new WeekendSch("2021-01-01", "15:00", "친구만남");
   console.log(mysch.shMySche());
[하] 2. class 형태로 Car객체를 선언하고, 종류, 배기량, 최고 속도, 현재 속도, speedUp(), speedDown() 속성을 선언하고, 각 기능에 따라
    출력되게 하세요.
     class Car{
       Constructor(kind, cc, maxspeed, curspeed){
         this.kind = kind;
         this.cc = cc;
         this.maxspeed = maxspeed;
         this.curspeed = curspeed;
      }
      speedUp(){
        this.curspeed+=10;
        if(this.curspeed>this.maxspeed){
            this.curspeed=this.maxspeed;
        }
        console.log("속도를 높입니다.");
      };
      speedDown(){
        this.curspeed-=10;
        if(this.curspeed<0){
            this.curspeed=0;
        }
        console.log("속도를 낮춥니다..");
      };
   }
   var c01 = new Car("람브로기니","1000","320", "0");
    c01.speedUp();
    c01.speedUp();
    c01.speedUp();
    c01.speedDown();
    c01.speedDown();
    c01.speedDown();   
 --%>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>