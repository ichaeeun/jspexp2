<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>    
<h2>로그인아이디:${param.id}</h2>
<h2>로그인패스워드:${param.pass}</h2>
<h2>성공여부:${param.id=='himan'&&param.pass=='7777'?'로그인성공':'로그인실패'}</h2>
