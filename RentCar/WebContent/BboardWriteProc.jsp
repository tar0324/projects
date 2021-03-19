<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<!-- 작성한 데이터를 한번에 읽어들임 -->


<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String pw = null;
	if(request.getParameter("pw") != null)
	{
		pw = request.getParameter("pw");
	}
	System.out.println("pw : " + pw);
	if (pw == null){
%>
	<script>
		alert("패스워드를 입력하세요");
	</script>
<%		
	}
%>
<jsp:useBean id="Bboardbean" class="db.BboardBean">
	<jsp:setProperty name="Bboardbean" property="*"/>
</jsp:useBean>
<%

		//데이터베이스 쪽으로 빈클래스를 넘겨줌
		RentcarDAO bdao = new RentcarDAO();
	
	
		//데이터 저장 메소드를 호출
		bdao.insertBoard(Bboardbean,id);
	
		//전체 게시글 보기
		response.sendRedirect("RentcarMain.jsp?center=CarQNA.jsp");
	
%>


</body>
</html>