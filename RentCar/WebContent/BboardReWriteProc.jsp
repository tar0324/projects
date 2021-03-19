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
	request.setCharacterEncoding("UTF-8");
%>
<!--  데이터를 한번에 받아오는 빈클래스를 사용하도록 -->
<jsp:useBean id="Bboardbean" class="db.BboardBean">
	<jsp:setProperty name="Bboardbean" property="*"/>
</jsp:useBean>

<%
	String id = request.getParameter("id");
	
	RentcarDAO bdao = new RentcarDAO();
	bdao.reWriteBboard(Bboardbean,id); 
	
	//답변데이터를 모두 저장후 전체 게시글 보기를 설정
	response.sendRedirect("RentcarMain.jsp?center=CarQNA.jsp");
%>


</body>
</html>