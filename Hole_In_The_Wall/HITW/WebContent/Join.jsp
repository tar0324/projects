<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript" src="js/Signupscript.js"></script>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.refFrm;
		if (id == "") {
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return;
		}

		window.open("idCheck.jsp?id=" + id, "IDCheck",
						"width=500, height=300, align=center, resizable = no, scrollbars = no");
	}
</script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container mb-3">
		<div class="row">
			<div class="col-4"></div>
			<div class="col">
				<form id="regFrm" name="regFrm" action="#" method="post">
					<div class="mb-2">
						<div class="row mt-5 mb-5 text-center">
							<div class="col">
							<h3>회원가입</h3>
							</div>
						</div>
						<!-- 아이디 -->
						<div class="row">
							<div class="col">
								<h6>아이디</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input id="id" name="id" type="text" class="form-control"
									placeholder="아이디를 입력하세요">
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-primary"
									onclick="idCheck(this.form.id.value)">중복확인</button>

							</div>
						</div>
					</div>
					<!-- 비밀번호 -->
					<div class="mb-2">
						<div class="row">
							<div class="col">
								<h6>비밀번호</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input id="pw" name="pw" type="password" class="form-control">
							</div>
						</div>
						<div class="text-danger"></div>
					</div>
					<!-- 비밀번호 재확인 -->
					<div class="mb-4">
						<div class="row">
							<div class="col">
								<h6>비밀번호 재확인</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input id="pw_confirm" name="pw_confirm" type="password"
									class="form-control">
							</div>
						</div>
					</div>
					<!-- 이름 -->
					<div class="mb-2">
						<div class="row">
							<div class="col">
								<h6>이름</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input id="name" name="name" type="text" class="form-control">
							</div>
						</div>
					</div>
					<!-- 닉네임 -->
					<div class="mb-2">
						<div class="row">
							<div class="col">
								<h6>닉네임</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input id="nickname" name="nickname" type="text" class="form-control">
							</div>
						</div>
					</div>
					<!-- 연락처 -->
					<div class="mb-2">
						<div class="row">
							<div class="col">
								<h6>연락처</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input id="tel" name="tel" type="text" class="form-control"
									placeholder="'-'없이 입력">
							</div>
						</div>
					</div>





					<div class="row mb-5 mt-5 text-center">
						<div class="col">

							<button type="button" class="btn btn-outline-dark text-center"
								onclick="inputCheck()">회원가입</button>

						</div>
					</div>
				</form>
			</div>
			<div class="col-4"></div>

		</div>
		</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>