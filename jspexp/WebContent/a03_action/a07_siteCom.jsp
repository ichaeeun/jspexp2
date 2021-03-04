	<%
	int age = Integer.parseInt(
				request.getParameter("age"));
	double dis = 0.0;
	if(age<3||age>=65){
		dis=1.0;
	}else if(age<=7){
		dis=0.5;
	}else if(age<=13){
		dis=0.4;
	}else if(age<=20){
		dis=0.3;
	}
	%>