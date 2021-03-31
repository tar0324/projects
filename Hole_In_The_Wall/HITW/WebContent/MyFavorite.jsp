<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoleInTheWall - 전국 맛집 찾기 : 찜목록</title>

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
<div class="container">
<div class="row mt-3">
<font size="30px">000님 찜목록🧸</font>
<hr size="2">
</div>
<div class="row mt-3">	<!-- 카드 -->
			<div class="col">
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="..." alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
							<span class="badge badge-success">서울</span>
							<span class="badge badge-warning">카페</span>
								<h5 class="card-title mt-1">이름</h5>
								<p class="card-text mt-5">
							
									 ⭐  5.0
											
								</p>
								<p class="card-text text-right">
									<input type="button" class="btn btn-dark" value="상세보기" onclick="location.href='Info.jsp'"  >
									<button type="button" class="btn btn-outline-danger">삭제</button>		
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>