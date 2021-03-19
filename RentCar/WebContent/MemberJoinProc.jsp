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
<!--useBean을 이용하여 안꺼번에 데이터를 받아옴  -->
<jsp:useBean id="mbean" class="db.MemberBean">
	<jsp:setProperty name="mbean" property="*"/> <!--천체 맵핑 -->
</jsp:useBean>


<%
	RentcarDAO mdao = new RentcarDAO();

	mdao.insertMember(mbean); 
%>
 <script>
 	alert("회원가입이 완료되었습니다!");
 	location.href='MemberLogin.jsp';
 </script>


</body>
</html>