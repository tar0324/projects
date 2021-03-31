<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HoleInTheWall - 전국 맛집 찾기</title>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="path/jquery-3.3.1.min.js"></script>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>


<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	 body {
	 	font-family: 'Jua', sans-serif;
	 }
	 
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="position: relative;">
		<img alt="" src="img/main.png" width="100%">
		<div style="left: 30vw; bottom: 150px; font-size: 4em; position: absolute;">
			<p>00님</p>
			<p>먹부림하러 떠나볼까요❓</p>
		</div>
	</div>

	<div class="container">
		<form action="#" method="post">
			
			<div class="row mt-5 mb-5 text-center">
				<div class="col"></div>
				<div class="col-2">
					<select class="form-control">
						<option value="지역">지역
						<option value="가게명">가게명
					</select>
				</div>
				<div class="col-5">
					<input type="text" id="search" class="form-control" placeholder="지역 또는 가게명을 검색하세요">
				</div>
				<div class="col-1">
					<button type="submit" class="btn btn-dark">검색</button>
				</div>
				<div class="col"></div>
			</div>
		</form>

		<div class="row">
			<div class="col text-center">
				<img alt="" src="img/main2.png" width="1000px">
			</div>
		</div>



	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>