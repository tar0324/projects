<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복체크</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

</head>
<body bgcolor="#FFFFCC">
<div class="row">
	<div class="col">
	<b><%=id %></b>
	<%
		if(result == 1){
			out.println("는 이미 존재하는 ID입니다.");
	%>
			<a href="#" onclick="self.close()" >
				<button type="button" class="btn btn-dark">돌아가기</button>
			</a>
	<%
		} else {
			out.println("는 사용가능한 ID입니다.");
	%>	
			<a href="#" onclick="self.close()" >
				<button type="button" class="btn btn-dark">사용하기</button>
			</a>
	<%
		}
	%>

	</div>
</div>
</body>
</html>