<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoleInTheWall - 전국 맛집 찾기(가게이름..)</title>

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
	 
	 .Infoimg {
	 
	 width:1100px;
	 height: 600px;
	 object-fit: cover;
	 }
	 
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<div class="row">
	<button type="button" class="btn btn-dark mt-3" onclick="history.back()">목록</button>
	</div>
	<div class="row mt-3 text-center">
		<img class="Infoimg"alt="" src="img/no.jpg">
	</div>
	<div class="row mt-3">
	<span class="badge badge-success pl-2 pr-2">서울</span>
	<span class="badge badge-warning ml-1 pl-2 pr-2">음식점</span>
	</div>
	<div class="row mt-3">
		<a href="#" class="text-right"><img alt="" src="img/beheart.png" width="20" height="20"></a>
	</div>
	<div class="row mt-1">
		<h2>이름</h2>
	</div>
	<div class="row mt-2">
		별점 ⭐⭐⭐⭐⭐   5.0  
		<input type="button" class="btn btn-sm btn-link ml-4" value="별점 남기기" data-toggle="modal" 
 										data-target="#reviewModal" style="color:#FFBF00; text-decoration:none">
	</div>
	<div>
	<hr color="gray">
		지도
	</div>
	
	
	</div>
	<!-- 리뷰모달 -->
		<form action="#" method="post">
		<div class="modal" id="reviewModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">이 곳은 어떠셨나요❓ 별점을 남겨주세요</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
					</div>
					<div class="modal-body text-center">
						<p>⭐⭐⭐⭐⭐</p>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-warning">남기기</button>
					</div>
				</div>
			</div>
		</div>
		</form>

	
</body>
</html>