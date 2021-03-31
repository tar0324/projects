<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoleInTheWall - 전국 맛집 찾기</title>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="path/jquery-3.3.1.min.js"></script>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>



</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="text-center mt-3">
		<p>
			<img alt="" src="img/search.png" width="70" height="70"> &nbsp;
			<font size="5em">검색한 지역명 or 가게명</font>
		</p>
		<hr color="gray">
		
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
		<div class="row">	<!-- 카드 -->
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
							
									 ⭐  5.00
											
								</p>
								<p class="card-text text-right">
									
									<input type="button" class="btn btn-dark" value="상세보기" onclick="location.href='Info.jsp'"  >		
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