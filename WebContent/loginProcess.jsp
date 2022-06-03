<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String passchk=null;
	try{
		sql="select password from booklogin where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			passchk=rs.getString(1);
			if(password.equals(passchk)){
		%>
		<script>
		alert("로그인 성공");
		location.href="loan.jsp?id=<%=id%>";
		</script>
		<%
			}else{
		%>
		<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="login.jsp";
		</script>
		<%
			}
		}else{
		%>
		<script>
		alert("아이디가 유효하지 않습니다.");
		location.href="login.jsp";
		</script>
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>