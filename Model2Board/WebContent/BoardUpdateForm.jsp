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
<div class="container">
<div class="row mt-3">
	<h2>수정❗</h2>
</div>
<form action="BoardUpdateProcCon.do" method="post">
<div class="row mt-5">
	<div class="col text-center"><h3>💬</h3></div>
	<div class="col-8">
		<input type="text" class="form-control" id="subject" name="subject" value="${bean.subject}">
	</div>
	<div class="col-2">
		<input type="text" class="form-control" id="password" name="password" placeholder="비밀번호">
	</div>
	<div class="col form-control">
		${bean.writer}
	</div>
</div>
<div class="row mt-3">
	<textarea class="form-control min-height" rows="14" id="content" name="content">${bean.content}</textarea>
</div>
<div align="right" class="mt-3 mb-5">
	<input type="hidden" name="num" value="${bean.num }">
	<input type="hidden" name="pass" value="${bean.password }">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='BoardListCon.do'">돌아가기</button>
	<button type="submit" class="btn btn-outline-dark">수정</button>
	
</div>
</form>
</div>



</body>
</html>