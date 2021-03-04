<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
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
		/*
		[js]
		[하] 1. 객체의 등록과 삭제의 기본 형식을 기술하세요.
				var 객체명 ={속성:속성값}; // 초기 속성 등록
				객체명.추가속성 = 속성값;  // 추가 속성 등록
				delete(객체명.삭제할속성);
		[하] 2. 객체형 배열의 추가, 삭제를 myPet이라는 애완동물 3마리를 기준으로 처리하고, 출력 메서드도 처리하세요.
		*/
		var myPets = [{kind:'강아지',name:"강돌이"}];
		myPets[1] = {kind:'고양이',name:"미미"};
		myPets.push({kind:'이구아나',name:"구아니"});
		console.log("# 나의 귀염둥이들 #");
		console.log(myPets);
		console.log("# 삭제할 겸둥이 #");
		console.log(myPets.pop());
		console.log(myPets);
		/*
				
		[하] 3. 일반 변수와 객체의 할당에서 복사 시 차이가 나는 궁극적인 이유를 기술하세요.
				객체의 메모리 할당시 사용되는 stack heap영역이 있는데,
				일반 변수는 stack영역에 바로 할당되어, 새로 변수를 만들면 다시 새로운
				stack영역에 데이터가 할당되기에 각각의 변수마다 다른 데이터를 할당할 수 있다.
				var num01 =25;
				var num02 = num01;
				num02 = 30; ==> num01:25, num02:30
				객체는 stack영역에 heap영역의 주소값이 할당되기에 얕은 복사를 하게 되면
				두 객체은 같은 객체를 바로 보게 되어 데이터를 공유하게 된다.
				var obj1 = {num01:25, num02:25};
				var obj2 = obj1; // obj1과 obj2는 같은 주소의 객체를 참조하고 있다.
				obj2.num01= 30; 할당하게 되면 주소를 공유하기에 obj1의 num01도 30으로
				변경이 된다.		
		[하] 4. 깊은 복사 함수 copy01()를 선언하여, 복사하더라도 새로운 객체 메모리가 생성되어 리턴되게 하고, 확인 객체로
		        member(회원멤버-ID,PASS,NAME,POINT)로 비교하세요
		*/
		function cloneObj(obj){
			var cobj={};
			for(var prop in obj){
				cobj[prop] = obj[prop];
			}
			return cobj;
		}
		var member = {id:'himan',pass:'7777',name:'홍길동',point:10000};
		var member2 = member; // 얕은 복사.
		var member3 = cloneObj(member); // 깊은 복사 처리.
		member.id="higirl";
		console.log("# 초기의 객체 변경 시 #");
		console.log(member);
		console.log(member2);
		console.log(member3);
		
		
	};
</script>
</head>
<%--
[JSP]
[하] 1. session scope 4개의 범위를 기술하세요.
	(오늘 scope처리 master하지 못하신 분은 페이지 4개 만들어 다시 확인해보세요)
		1) 공통메서드 : setAttribute("key",객체), getAttribute("key")
		2) 범위 및 실제 객체
			page (pageContext) : 페이지 범위에서 사용
			request : 요청처리까지 사용
			session : session범위 즉 설정한 브라우저다 닫힐 때까지
			application : 웹어프리케이션서버(WAS)가 다시 재기동할 때까지		
[중] 2. 장바구니(session범위)에 담은 Product객체가 a01_shop1.jsp(초기설정) 후,  
		a02_shop2.jsp를 호출할 때마다 구매갯수가 계속 1씩 증가하게 처리하세요.
         Product(물건명,가격,갯수)-a01_shop1.jsp에서 초기 설정
10:10에 진행하겠습니다.
 --%>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>