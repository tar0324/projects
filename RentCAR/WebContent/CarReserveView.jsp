<%@page import="db.CarViewBean"%>

<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentCAR: RESERVE</title>

<!-- 부트스트랩 -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>




</head>

<body>

<%
	String id = (String)session.getAttribute("id");
	if(id == null){
%>
	<script>
		alert("로그인을 먼저 해주세요❗"");
		location.href="MemberLogin.jsp";
	</script>
<% 	
	}
	
	//로그인이 되어있는 아이디를 읽어 옴
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarViewBean> v = rdao.getAllReserve(id);
	
%>

<div class="container">	
	<div class="row mt-5">
	</div>
	
<div class="row mb-5">

<% for (int i =0; i < v.size(); i++){
		CarViewBean bean = v.get(i);
		
%>	
	


	   	<div class="col">
	      	<div class="card h-100" style="width: 18rem; " >
	      		<img class="card-img-top" src="img/<%=bean.getImg()%>" alt="Card image cap" style="height:11rem;">
	      		<div class="card-body">
	      			<h5 class="card-title"><%= bean.getName() %></h5>
	      			<p class="card-text" style="font-size: 13px;">예약일 : <%= bean.getRday() %></p>
	      			<p class="card-text" style="font-size: 13px;">차량 수 : <%= bean.getQty() %></p>
	      			<a href="RentcarMain.jsp?center=CarReserveViewInfo.jsp?no=<%=bean.getNo() %>" class="btn btn-primary">상세보기</a>
	      		</div>
	   		</div>
		</div>


      
      


<%
	}
%>


	</div>
	<div class="row mt-5">
	</div>

</div>

</body>
</html>