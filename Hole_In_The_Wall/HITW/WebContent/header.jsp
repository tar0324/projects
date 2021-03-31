<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="path/jquery-3.3.1.min.js"></script>

<script src="./js/bootstrap.bundle.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
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
	 
	 navbar {
	 	position: fixed-top;
	 }
	 .main {
	 	text-decoration : none;
        color: black;
	 }
	 .main:hover {
	 	text-decoration: none;
        color: black;
	 }
	 .main_2 {
	 	text-decoration : none;
        color: black;
	 }
	 .main_2:hover {
	 	text-decoration: none;
        color: gray;
	 }
	 
</style>
</head>
<body>

<nav class="navbar sticky-top bg-light">
	<a class="main" href="Main.jsp"><img src="img/logo.png" width="60" height="60" class="d-inline-block align-top" alt=""><font size="10"> HoleInTheWall</font></a>
	<p align ="right" >
		<a class="main_2 mr-3" href="Login.jsp">로그인</a>
		<a class="main_2 mr-3" href="Join.jsp">회원가입</a>
		<a class="main_2 mr-3" href="#">로그아웃</a>
		<a class="main mr-3" href="#" data-bs-toggle="tooltip" data-bs-placement="bottom" title="찜 목록"><img src="img/heart.png" width="20" height="20" class="d-inline-block align-top" alt="찜목록"></a>
	</p>
</nav>


</body>
</html>