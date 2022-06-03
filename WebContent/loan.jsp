<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대출 도서 정보 입력</title>
<script>
function cancle(){
	location.href="index.jsp";
}
</script>
</head>
<body>
<form name=form>
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String ox=null;
	String author=null;
	if(name!=null){
		try{
			sql="select ox,author from bookinfo where name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				ox=rs.getString(1);
				author=rs.getString(2);
%>
<script>
alert("도서 조회 성공");
</script>
<%
			}else{
%>
<script>
alert("유효하지 않은 도서명입니다.");
location.href="loan.jsp"
</script>
<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<table style="margin-left:90%;">
<tr>
<td><input type=button value="취소" onclick=cancle() style="height:50px;width:100px;"></td>
</tr>
</table>
<br><br><br><br>
<h1 style="font-size:3.5em; text-align:center;">
대출 도서 정보 입력
</h1>
<br><br>
<table style="width:60%; margin:0 auto;">
<tr>
<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">아이디</th>
<td colspan=2><input type=text name=id value="<%=id==null ? "" : id%>" style="width:100%; height: 40px; font-size:1.5em;" readonly></td>
</tr>
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">도서명</th>
	<td><input type=text name=name style="width:100%; height: 40px; font-size:1.5em;" value="<%=name==null ? "" : name %>"></td>
	<td><input type=button value="조회" onclick=search() style="font-size:1.5em; font-weight:bold;height:50px;width:100px;"></td>
</tr>
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">저자</th>
	<td colspan=2><input type=text name=author readonly style="width:100%; height: 40px; font-size:1.5em;" value="<%=author==null ? "" : author %>"></td>
</tr>
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">대출가능</th>
	<td colspan=2><input type=text name=ox readonly style="width:100%; height: 40px; font-size:1.5em;" value="<%=ox==null ? "" : ox %>"></td>
</tr>
<tr>
	<td colspan=3 style="width:100%;text-align:right;">
		<input type=button value="대출 저장" onclick=add() style="width:20%; height: 50px;margin:0 2.5%;font-size:1.2em;">
	</td>
</tr>
</table>
</form>
</body>
<script>
function search(){
	var doc=document.form;
	doc.action="loan.jsp?id=<%=id%>";
	doc.submit();
}
function add(){
	var doc=document.form;
	if(doc.name.value==""){
		alert("[도서명]\n도서명을 입력하세요.");
		doc.name.focus();
	}else if(doc.ox.value==""){
		alert("[도서명]\n도서명을 조회해주세요.");
		doc.name.focus();
	}else if(doc.ox.value=="x"){
		alert("[대출가능]\n대출 가능 도서가 아닙니다.");
		doc.name.focus();
	}else{
		doc.action="loanProcess.jsp";
		doc.submit();
	}
}
</script>
</html>