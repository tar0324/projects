
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
	<div class="row">
		<div class="col-1"></div>
		<div class="col">
			<div class="row mt-4">
				<a href="BoardListCon.do">
					<button type="button" class="btn btn-dark">목록</button>
				</a>
			</div>
			<div class="row mt-3">
				<h1> ${bean.subject } </h1>
			</div>
			<div class="row mt-3">
				<div class="col mt-3">
					${bean.writer } ・ ${bean.reg_date}
				</div>
				<div class="col mt-3" align="right">
					조회수 ${bean.readcount }
				</div>
			</div>
			<div class="row">
				<div class="col">
					<hr color="gray">
				</div>
			</div>
			<div class="row mb-5">
				<div class="col">
					<div style="min-height: 300px">
						${bean.content }
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<hr color="gray">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='BoardUpdateCon.do?num=${bean.num }'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick=" location.href='BoardDeleteCon.do?num=${bean.num }'">삭제</button>
				</div>
			
				<div class="col" align="right">
						<button type="button" class="btn btn-dark" onclick="location.href='BoardReWriteCon.do?num=${bean.num }&ref=${bean.ref }&re_step=${bean.re_step }&re_level=${bean.re_level }'">답변</button>


				</div>
				
			</div>
		</div>
		<div class="col-1"></div>
	</div>




</div>
</body>
</html>