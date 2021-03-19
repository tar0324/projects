<%@page import="db.CarListBean"%>
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
<div class="container">
	<div class="row">
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	RentcarDAO rdao = new RentcarDAO();
	
	//렌트카 하나에 대한 정보를 얻어옴
	CarListBean bean = rdao.getOneCar(no);
	
	int category = bean.getCategory();
	String temp="";
	if(category == 1) temp = "소형";
	else if (category == 2) temp = "중형";
	else if (category == 3) temp = "대형";

%>
		<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
			<table width="1000">
				<tr height="100">
					<td align="center" colspan="3">
						<font size="6"><%=bean.getName() %> 차량 선택</font>
					</td>
				</tr>
				<tr>
					<td rowspan="6" width="500" align="center">
						<img alt="" src="img/<%=bean.getImg() %>" width="450">
					</td>
					<td width="250" align="center"> 차량이름 </td>
					<td width="250" align="center"> <%= bean.getName() %> </td>
				</tr>
				<tr>
					<td width="250" align="center"> 차량수량 </td>
					<td width="250" align="center"> 
						<select class="form-control w-50" name="qty" >
				  			<option value="1" selected>1</option>
				  			<option value="2" >2</option>
				  			<option value="3">3</option>
						</select> 
					</td>
				</tr>
				<tr>
					<td width="250" align="center"> 차량분류 </td>
					<td width="250" align="center"> <%= temp %> </td>
				</tr>
				<tr>
					<td width="250" align="center"> 대여가격 </td>
					<td width="250" align="center"> <%= bean.getPrice() %> 원 </td>
				</tr>
				<tr>
					<td width="250" align="center"> 제조회사 </td>
					<td width="250" align="center"> <%= bean.getCompany() %> </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name = "no" value="<%= bean.getNo() %>">
						<input type="hidden" name="img" value="<%=bean.getImg() %>">
						<button type="submit" class="btn btn-warning" >옵션선택하러가기🚗</button>
					</td>
					
				</tr>
				
			</table>
			<div class="row mt-5" style="text-align-last: center">
				<div class="col">
					<font size="5" color="gray">차량 정보보기</font>
				</div>
			</div>
			<div class="row mt-3" style="text-align-last: center">
				<div class="col">
					<%=bean.getInfo() %>
				</div>
			</div>
			
		</form>
	</div>
</div>
</body>
</html>