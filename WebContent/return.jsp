<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반납 도서 정보 입력</title>
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
	String bookname=request.getParameter("bookname");
	String name=null;
	String outdate=null;
	String ox=null;
	if(bookname!=null){
		try{
			sql="select b.name,a.outdate,a.ox from bookinfo a join booklogin b on a.id=b.id where a.name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bookname);
			rs=pstmt.executeQuery();
			if(rs.next()){
				ox=rs.getString(3);
				if(ox.equals("x")){
					name=rs.getString(1);
					outdate=rs.getString(2);
				}else{
%>
<script>
alert("반납 불가능한 도서입니다.");
</script>
<%
				}
			}else{
%>
<script>
alert("유효하지 않은 도서명입니다.");
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
반납 도서 정보 입력
</h1>
<br><br>
<table style="width:60%; margin:0 auto;">
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">도서명</th>
	<td><input type=text name=bookname style="width:100%; height: 40px; font-size:1.5em;" value="<%=bookname==null ? "" : bookname %>"></td>
	<td><input type=button value="조회" onclick=search() style="font-size:1.5em; font-weight:bold;height:50px;width:100px;"></td>
</tr>
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">저자</th>
	<td colspan=2><input type=text name=name readonly style="width:100%; height: 40px; font-size:1.5em;" value="<%=name==null ? "" : name %>"></td>
</tr>
<tr>
	<th style="width:30%; height: 40px;margin:0 2.5%;font-size:1.5em;">대출일자</th>
	<td colspan=2><input type=text name=outdate readonly style="width:100%; height: 40px; font-size:1.5em;" value="<%=outdate==null ? "" : outdate %>"></td>
</tr>
<tr>
	<td colspan=3 style="width:100%;text-align:right;">
		<input type=button value="반납 저장" onclick=update() style="width:20%; height: 50px;margin:0 2.5%;font-size:1.2em;">
	</td>
</tr>
</table>
</form>
</body>
<script>
function search(){
	var doc=document.form;
	doc.action="return.jsp";
	doc.submit();
}
function update(){
	var doc=document.form;
	if(doc.bookname.value==""){
		alert("[도서명]\n도서명을 입력하세요.");
		doc.name.focus();
	}else if(doc.name.value==""){
		alert("[도서명]\n도서명을 조회해주세요.");
		doc.name.focus();
	}else{
		doc.action="returnProcess.jsp";
		doc.submit();
	}
}
</script>
</html>