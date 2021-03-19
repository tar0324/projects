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
<jsp:useBean id="Bboardbean" class="db.BboardBean">
	<jsp:setProperty name="Bboardbean" property="*"/>
</jsp:useBean>
<%
 	
 	RentcarDAO dao = new RentcarDAO();
 	String pw = dao.getpass(Bboardbean.getNum());
 	
 	if(pw.equals(Bboardbean.getPw())){
 		dao.updateBboard(Bboardbean); 
 		response.sendRedirect("RentcarMain.jsp?center=CarQNA.jsp");
 	} else {
%>
	<script type="text/javascript">
		alert("패스워드가 틀립니다. 다시 확인해주세요‼");
		history.go(-1);
	</script>

<%
 	}
%>
</body>
</html>