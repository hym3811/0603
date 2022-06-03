<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script>
function cancle(){
	location.href="index.jsp";
}
function login(){
	document.form.action="loginProcess.jsp";
	document.form.submit();
}
function find(){
	location.href="find.jsp";
}
function join(){
	location.href="join.jsp";
}
</script>
</head>
<body>
<form name=form>
<table style="margin-left:90%;">
<tr>
<td><input type=button value="취소" onclick=cancle() style="height:50px;width:100px;"></td>
</tr>
</table>
<br><br><br><br>
<h1 style="font-size:3.5em; text-align:center;">
로 그 인
</h1>
<br><br>
<table style="width:60%; margin:0 auto;">
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">아이디</th>
	<td><input type=text name=id style="width:100%; height: 40px; font-size:1.5em;"></td>
	<td rowspan=2><input type=button value="로그인" onclick=login() style="font-size:1.5em; font-weight:bold;width:100px; height:100px;"></td>
</tr>
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">비밀번호</th>
	<td><input type=password name=password style="width:100%; height: 40px; font-size:1.5em;"></td>
</tr>
<tr>
	<td colspan=3 style="width:100%;text-align:center;">
		<input type=button value="회원가입" onclick=join() style="width:20%; height: 30px;margin:0 2.5%;font-size:1.2em;">
		<input type=button value="아이디/비밀번호 찾기" onclick=find() style="width:40%; height: 30px;margin:0 2.5%;font-size:1.2em;">
	</td>
</tr>
</table>
</form>
</body>
</html>