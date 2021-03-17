<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentCAR: Login</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

</head>
<body>
<div class="container mb-3 mt-5">
	<div class="row mb-5 mt-5">
		<div class="col">
			<h1 class="text-center ">
				<a href="RentcarMain.jsp">
					<img src="img/mainlogo(2).png" style="width: 300px;"  class="d-inline-block align-top" alt="">
				</a>
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-4"></div>
		<div class="col">
			<form id="join" action="MemberLoginPorc.jsp" method="post">
				<div class="mb-2">
				<!-- 아이디 -->
					<div class="row"> 
						<div class="col">
							<h6 class="fw-bold">아이디</h6>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input id="id" name="id" type="text" onblur="ckId()" class="form-control">		
						</div>
					</div>
					<div id="alert_id" class="text-danger"></div>
				</div>
				<!-- 비밀번호 -->
				<div class="mb-2">
					<div class="row">
						<div  class="col">
							<h6 class="fw-bold">비밀번호</h6>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input id="pw" name="pw" type="password" onblur="ckPw()" class="form-control">
						</div>
					</div>
					<div id="alert_pw" class="text-danger"></div>
				</div>

		
				
				
				
			</form>
			<div class="row mb-5 mt-5 text-center">
				<div class="col-2"></div>
				<div class="col">
					<button type="submit" class="btn btn-outline-dark text-center" >Login</button>
				</div>
				<div class="col">
					<button type="button" class="btn btn-outline-dark text-center" onclick="location.href='MemberSignup.jsp'">Sign up</button>
					
				</div>
				<div class="col-3"></div>
			</div>
		</div>
		<div class="col-4"></div>
	
	</div>
<!-- 	<div class="row">
		<div class="col">
			<p class="m-0 text-center text-black">
				<a href="RentcarMain.jsp" style="text-decoration: none;">RentCAR</a>
				 Copyright © SING A SONG 2021
			</p>
			<p class="m-0 text-center text-black"> 송민경 </p>
		</div>
	</div> -->

</div>


</body>
</html>