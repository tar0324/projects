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
</head>
<body>
<%
	//카테고리 분류값을 받아옴
	int category = Integer.parseInt(request.getParameter("category"));
	

	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getCategoryCar(category);   
%>

<div class="container">
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
	<div class="row mt-2" >
		
			<div class="col-2">
				
					<select class="form-control w-100" style="text-align-last: center" name="category">
			  			<option value="1" <%if(category == 1) { %> selected <%} %>>소형</option>
			  			<option value="2" <%if(category == 2) { %> selected <%} %>>중형</option>
			  			<option value="3" <%if(category == 3) { %> selected <%} %>>대형</option>
			  			<option value="4" <%if(category == 4) { %> selected <%} %>>전체</option>
					</select>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-outline-warning">검색</button>
			</div>

				
			
					
			
	</div>
	</form>
	<div class="row mt-5">
	<%
		int j =0;
	
		for(int i =0; i< v.size(); i++){
			//벡터에 저장되어있는 빈클래스를 
			CarListBean bean = v.get(i);
			if(j%3 == 0){
	%>
				
	<%
			}
	%>		
			
		<div class="col">
		
	      	<div class="card h-100" style="width: 18rem; " >
	      		<img class="card-img-top" src="img/<%=bean.getImg() %>" alt="Card image cap" style="height:11rem;">
	      		<div class="card-body">
	      			<h5 class="card-title"><%= bean.getName() %></h5>
	      			<p class="card-text" style="font-size: 13px;"><%= bean.getInfo() %></p>
	      			<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%= bean.getNo() %>" class="btn btn-primary">상세보기</a>
	      		</div>
	   		</div>
		</div>
	
	<%
			j = j+1; //j값을 증가하여 하나의 행에 총 3개의 차량정보를 보여주기위해서 증가
		}
	%>
	</div>
</div>

</body>
</html>