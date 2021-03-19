<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
	String pw = request.getParameter("pw");
 	int num = Integer.parseInt(request.getParameter("num"));
 	
 	RentcarDAO dao = new RentcarDAO();
 	String password = dao.getpass(num);
 	
 	if(pw.equals(password)){
 		dao.deleteBboard(num); 
 		response.sendRedirect("RentcarMain.jsp?center=CarQNA.jsp");
 	} else {
%>
	<script>
		alert("패스워드가 틀립니다. 다시 확인해주세요‼");
		history.go(-1);
	</script>

<%
 	}
%>
</body>
</html>