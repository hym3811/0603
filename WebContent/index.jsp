<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 대출 반납 시스템</title>
<script>
function add(){
	location.href="login.jsp";
}
function update(){
	location.href="return.jsp";
}
function join(){
	location.href="join.jsp";
}
</script>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	try{
		sql="select table_name from user_tables where table_name='BOOKLOGIN'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()==false){
			sql="create table booklogin(id varchar2(50) primary key, password varchar2(50) not null, name varchar2(50) not null, birth number(8) not null, phone number(13) not null)";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="insert into booklogin values('a1234','1234','황영민','19910509','01012341234')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="create table bookinfo(name varchar2(50) primary key, author varchar2(50) not null, outdate date, id varchar2(50), ox char(1) not null)";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="insert into bookinfo values('홍길동전','김개똥','20220603','a1234','X')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="insert into bookinfo values('춘향전','박소똥',"+null+","+null+",'O')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<br><br><br><br>
<h1 style="font-size:3.5em; text-align:center;">
도서 대출 반납 시스템
</h1>
<br><br>
<table style="width:50%; margin:0 auto;">
<tr>
	<td style="width:100%;text-align:center;">
		<input type=button value="대출" onclick=add() style="width:40%; height: 200px;margin:0 2.5%;font-size:2.5em;">
		<input type=button value="반납" onclick=update() style="width:40%; height: 200px;margin:0 2.5%;font-size:2.5em;">
	</td>
</tr>
<tr>
<td sytle="font-size:1.2em;"><pre> </pre></td>
</tr>
<tr>
	<td style="width:100%;text-align:center;">
		<input type=button value="회원가입" onclick=join() style="width:40%; height: 60px;margin:0 2.5%;font-size:2.5em;">
	</td>
</tr>
</table>
</body>
</html>