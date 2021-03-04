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
	// body 하단에 있는 효과..
	var cnt=1;
	window.onload=function(){
		makeTab(cnt);
		
	};
	function add(){
		cnt++;
		makeTab(cnt);
	}
	function del(){
		cnt--;
		makeTab(cnt);
	}	
	function makeTab(cnt){
		var tabObj = document.querySelector("table");
		var show="<table><tr><th>no</th><th>물건명</th><th>가격</th><th>갯수</th></tr>";
		for(var no=1;no<=cnt;no++){
			show+="<tr><td>"+no+"</td>";
			show+="<td><input name='name' /></td>";
			show+="<td><input name='price' size='3'/></td>";
			show+="<td><input name='cnt' size='2'/></td></tr>";
		}
		show+="<tr><th colspan='2'>구매방법</th><td colspan='2'>";
		show+="<label><input type='checkbox' name='pay' value='카드'/>카드</label>";
		show+="<label><input type='checkbox' name='pay' value='현금'/>현금</label>";
		show+="<label><input type='checkbox' name='pay' value='포인트'/>포인트</label></tr>";
//		show+="<tr><td colspan='4'><input type='submit'  value='구매처리'/></td></tr>";
		show+="<tr><td colspan='4'><input type='button' onclick='valid()' value='구매처리'/></td></tr>";
		show+="</table>";
		tabObj.innerHTML = show;		
		
	}
	function valid(){
		var nameObj = document.querySelectorAll("[name=name]");
		var priceObj = document.querySelectorAll("[name=price]");
		var cntObj = document.querySelectorAll("[name=cnt]");
		var isNotValid=false;
		console.log(nameObj.length+":"+nameObj[0].value);
		// 문자형 입력 항목
		for(var idx=0;idx<nameObj.length;idx++){
			console.log("idx번호:"+idx);
			if(nameObj[idx].value==''){
				alert('물건명를 입력해주세요');
				nameObj[idx].focus();
				isNotValid=true;
				break;
			}
		}
		if(isNotValid){
			return;
		}
		
		// 숫자형 입력 항목
		for(var idx=0;idx<priceObj.length;idx++){
			if(priceObj[idx].value==''){
				alert('가격을 입력해주세요');
				priceObj[idx].focus();
				isNotValid=true;
				break;
			}else{
				if(isNaN( priceObj[idx].value ) ){
					alert('가격은 숫자를 입력해주세요');
					priceObj[idx].value="";
					priceObj[idx].focus();
					isNotValid=true;
					break;
				}
			}
		}	
		if(isNotValid){
			return;
		}		
		for(var idx=0;idx<cntObj.length;idx++){
			if(cntObj[idx].value==''){
				alert('갯수를 입력해주세요');
				cntObj[idx].focus();
				isNotValid=true;
				break;
			}else{
				if(isNaN( cntObj[idx].value ) ){
					alert('갯수는 숫자를 입력해주세요');
					cntObj[idx].value="";
					cntObj[idx].focus();
					isNotValid=true;
					break;
				}
			}
		}	
		if(!isNotValid){
			document.querySelector("form").submit();
		}
		
	}
</script>
</head>
<body>
<%--
        2) form 처리 방식 입력 후, 출력.
            구매물건
            물건명  가격  갯수
            [   ] @@@ [  ]
            [   ] @@@ [  ]
            [   ] @@@ [  ]
            구매방법 []신용카드[]현금[]포인트
 --%>
	<h3>구매물건</h3>
	<input type="button" onclick="add()" value="구매추가"/>
	<input type="button" onclick="del()" value="구매삭제"/>
	<br>
	<form action="a04_0126.jsp" method="post">
		<table></table>
	</form>
</body>
</html>