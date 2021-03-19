<%@page import="db.BboardBean"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	RentcarDAO bdao = new RentcarDAO();
	BboardBean bean = bdao.getUpdateBoard(num);  
%>
<div class="container">
<div class="row mt-3">
	<h2>정말 삭제하시겠어요❓</h2>
</div>
<form action="BboardDeleteProc.jsp" method="post">
<div class="row mt-5">
	<div class="col text-center"><h3>💬</h3></div>
	<div class="col-7 form-control">
		 <%=bean.getSubject()%>
	</div>
	<div class="col-2">
		<input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호">
	</div>
	<div class="col-2 form-control">
		<%=bean.getId() %>
	</div>
</div>

<div align="right" class="mt-3 mb-5">
	<input type="hidden" name="num" value="<%= bean.getNum() %>">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='RentcarMain.jsp?center=CarQNA.jsp'">돌아가기</button>
	<button type="submit" class="btn btn-danger">삭제</button>
	
</div>
</form>
</div>



</body>
</html>