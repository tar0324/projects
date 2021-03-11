<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align ="center">
<h2>회원 정보 보기</h2>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- request로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜주는 useBean -->
<!-- 객체생성이라고 볼 수 있음.  -->
<jsp:useBean id="mbean" class="bean.MemberBean">
<!-- jsp내용을 자바빈 클래스(MemberBean)에 데이터를 맵핑(넣어줌)  -->
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
<h2>당신의 패스는 <jsp:getProperty property="pass1" name="mbean"/></h2>
<h2>당신의 전화는 <%=mbean.getTel() %></h2>


</div>

</body>
</html>