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

<div class="container">
<div class="row mt-3">
	<h2>답변❗</h2>
</div>
<form action="BoardReWriteProcCon.do" method="post">
<div class="row mt-5">
	<div class="col text-center"><h3>💬</h3></div>
	<div class="col-8">
		<input type="text" name ="subject" value="💬[답변]" class="form-control" > 
	</div>
	<div class="col">
		<input type="password" name="password" placeholder="비밀번호" class="form-control">
	</div>
	<div class="col">
		<input type="text" name="writer" placeholder="작성자" class="form-control">
	</div>
</div>
<div class="row mt-3">
	<textarea class="form-control min-height" rows="14" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
</div>
<div align="right" class="mt-3 mb-5">
	<input type="hidden" name="ref" value="${ref }">
	<input type="hidden" name="re_step" value="${re_step }">
	<input type="hidden" name="re_level" value="${re_level }">
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='BoardListCon.do'">돌아가기</button>
	<button type="submit" class="btn btn-outline-dark">저장</button>
	
</div>


</form>
</div>

</body>
</html>