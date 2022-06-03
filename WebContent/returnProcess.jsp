<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String id=null;
	String name=request.getParameter("name");
	String ox="o";
	Date today=null;
	try{
		sql="update bookinfo set id=?,ox=?,outdate=? where name=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, ox);
		pstmt.setDate(3, today);
		pstmt.setString(4, name);
		pstmt.executeUpdate();
%>
<script>
alert("도서 반납 저장 성공\n[도서명]<%=name%>\n처음으로 돌아갑니다.");
location.href="index.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>