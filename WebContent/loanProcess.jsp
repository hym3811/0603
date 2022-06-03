<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String ox="x";
	Date today=null;
	try{
		sql="select sysdate from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			today=rs.getDate(1);
		}
		sql="update bookinfo set ox=?,outdate=? where name=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, ox);
		pstmt.setDate(2, today);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
%>
<script>
alert("도서 대출 저장 성공\n[도서명]<%=name%>\n처음으로 돌아갑니다.");
location.href="index.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>