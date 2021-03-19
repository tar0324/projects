<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentCAR</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

</head>
<body>
<%
	//center값이 바껴야함
	String center = request.getParameter("center");

	if(center == null){
		center = "Center.jsp"; //디폴트 center값
	}
%>
<jsp:include page="Top.jsp" />
<div class="container">
	
	<div class="row">	
		<div class="col">
			<jsp:include page="<%=center %>"/>
		</div>
		
	</div>
	




</div>

<jsp:include page="Bottom.jsp"/>
</body>
</html>