<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container mb-3 mt-5">	
		
			<div class="row text-center ">
				<div class="col">
				<div class="row mt-3 mb-3 ">
				<div class="col">
				<h3>로그인</h3>
				</div>
				</div>
					<form action="#" method="post">
						<div class="mb-3 mt-3 ">
						<!-- 아이디 -->
							<div class="row"> 
								<div class="col-4"></div>
								<div class="col-1">
									<h6 >아이디</h6>
								</div>
								<div class="col-7"></div>
							</div>
							<div class="row">
								<div class="col-4"></div>
								<div class="col-4 ">
									<input id="id" name="id" type="text" class="form-control">		
								</div>
								<div class="col-4"></div>
							</div>
							
						</div>
						<!-- 비밀번호 -->
						<div class="mb-3">
							<div class="row">
								<div class="col-4"></div>
								<div  class="col-1">
									<h6>비밀번호</h6>
								</div>
								<div class="col-7"></div>
							</div>
							<div class="row">
								<div class="col-4"></div>
								<div class="col-4">
									<input id="pw" name="pw" type="password"  class="form-control">
								</div>
								<div class="col-4"></div>
							</div>
						</div>
						<div class="col-4"></div>
						<div class="row mb-5 mt-5 text-center">
							<div class="col">
								<input type="button" class="btn btn-sm btn-link " value="Forgot ID?" style="color:#A4A4A4; text-decoration:none">
								<input type="button" class="btn btn-sm btn-link " value="Forgot PW?" style="color:#A4A4A4; text-decoration:none">
							</div>
						</div>	
						<div class="row mb-5 mt-5 text-center">
							<div class="col">
								<button type="submit" class="btn btn-outline-dark text-center">Login</button>
								<button type="button" class="btn btn-outline-dark text-center" onclick="location.href='Join.jsp'">Sing up</button>
							</div>
						</div>	
					</form>	
					
			</div>
		</div>
		 </div>	


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>