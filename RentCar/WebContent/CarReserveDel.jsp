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
	String id = request.getParameter("id");
	String rday = request.getParameter("rday");
	
	RentcarDAO rdao = new RentcarDAO();
	

		//예약삭제 메소드 호출
	rdao.carRemoveReserve(id, rday);
	
	response.sendRedirect("RentcarMain.jsp");
%>

</body>
</html>