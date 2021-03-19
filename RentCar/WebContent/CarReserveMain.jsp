<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</head>

<body>


<%
	RentcarDAO rdao = new RentcarDAO();
	
	Vector<CarListBean> v = rdao.getAllCar(); 

%>


<div class="container">
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
	<div class="row mt-2" >
		
			<div class="col-2">
				
					<select class="form-control w-100" style="text-align-last: center" name="category">
			  			<option value="1">소형</option>
			  			<option value="2" >중형</option>
			  			<option value="3">대형</option>
			  			<option value="4">전체</option>
					</select>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-outline-warning">검색</button>
			</div>

				
			
					
			
	</div>
	</form>
	
		

	
	
	<div class="row mt-5">

<% for (int i =0; i < v.size(); i++){
		CarListBean bean = v.get(i);
		
%>

	
	   	<div class="col">
	      	<div class="card h-100" style="width: 18rem; " >
	      		<img class="card-img-top" src="img/<%=bean.getImg() %>" alt="Card image cap" style="height:11rem;">
	      		<div class="card-body">
	      			<h5 class="card-title"><%= bean.getName() %></h5>
	      			<p class="card-text" style="font-size: 13px;"><%= bean.getInfo() %></p>
	      			<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo() %>" class="btn btn-primary">상세보기</a>
	      		</div>
	   		</div>
		</div>

	
      
      


<%
	}
%>

	</div>

</div>


</body>
</html>