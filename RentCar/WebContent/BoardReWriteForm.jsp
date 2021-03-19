<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentCAR: ANSWER</title>



<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</head>
<body>
<%	
	String id = request.getParameter("id");
	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
%>
<div class="container">
<div class="row mt-3">
	<h2>답변 해드릴게요❗</h2>
</div>
<form action="BboardReWriteProc.jsp" method="post">
<div class="row mt-5">
	<div class="col text-center"><h3>💬</h3></div>
	<div class="col-8 form-control">
		💬[답변] <%=id %>님 답변입니다!
	</div>
	<div class="col form-control">
		Manager🚗
	</div>
</div>
<div class="row mt-3">
	<textarea class="form-control min-height" rows="14" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
</div>
<div align="right" class="mt-3 mb-5">
	<input type="hidden" name="id" value="<%=id %>">
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="re_step" value="<%=re_step %>">
	<input type="hidden" name="re_level" value="<%=re_level %>">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='RentcarMain.jsp?center=CarQNA.jsp'">돌아가기</button>
	<button type="submit" class="btn btn-outline-dark">저장</button>
	
</div>


</form>
</div>

</body>
</html>