<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/Checkpw.js"></script>
</head>

<body>
<%
	String id = (String)session.getAttribute("id"); 
	

	if (id == null){
%>
	<script>
		alert("로그인 후 이용가능합니다🙋‍♀️");
		location.href='MemberLogin.jsp';


	</script>
<%} %>
<div class="container">
<div class="row mt-3">
	<h2>궁금한게 있으신가요❓</h2>
</div>
<form name="Write" action="BboardWriteProc.jsp" method="post">
<div class="row mt-5">
	<div class="col text-center"><h3>👀</h3></div>
	<div class="col-8">
		<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요">
	</div>
	<div class="col-2">
		<input type="text" class="form-control" id="pw" name="pw"  placeholder="비밀번호">
	</div>
	<div class="col form-control">
		<%=id %>
	</div>
</div>
<div class="row mt-3">
	<textarea class="form-control min-height" rows="14" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
</div>
<div align="right" class="mt-3 mb-5">
	
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='RentcarMain.jsp?center=CarQNA.jsp'">돌아가기</button>
	<button type="button" class="btn btn-outline-dark" onclick="checkPw()">저장</button>
	
</div>


</form>
</div>
</body>
</html>