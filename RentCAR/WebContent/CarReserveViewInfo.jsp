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
	int no = Integer.parseInt(request.getParameter("no"));
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
	CarViewBean bean = rdao.getAllReserveInfo(id, no);
	
	int usein = bean.getUsein();
	int usewifi = bean.getUsewifi();
	int usenavi = bean.getUsenavi();
	int useseat = bean.getUseseat();
	String temp="";
	String temp2="";
	String temp3="";
	String temp4="";
	if(usein == 1) {
		temp = "적용";
	} else {  
		temp = "미적용";
	}
	if(usewifi == 1) {
		temp2 = "적용";
	} else {  
		temp2 = "미적용";
	}
	if(usenavi == 1) {
		temp3 = "적용";
	} else {  
		temp3 = "미적용";
	}
	if(useseat == 1) {
		temp4 = "적용";
	} else {  
		temp4 = "미적용";
	}
	
	
	
	
	
	
%>

	
<script type="text/javascript">
		 function removeCheck() {
			 if(confirm("정말 예약 취소하시겠습니까?") == true){
				 alert("예약취소되었습니다.");
				 location.href='CarReserveDel.jsp?id=<%=id%>&rday=<%= bean.getRday()%>';
			 } else{
				 return;
			 }
		 }
</script>

<div class="container">
	<form action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
		<table style="width : 1000">
			
				<tr height="100">
					<td align="center" colspan="3">
						<font size="6"> 예약 상세정보</font>
					</td>
				</tr>
			
				<tr>
					<td rowspan="9" width="500" align="center">
						<img alt="" src="img/<%=bean.getImg() %>" width="450" height="350">
					</td>
					<td width="250" align="center"> 이름 </td>
					<td width="250" align="center"> <%= bean.getName() %></td>
				</tr>
				<tr>
					<td width="250" align="center"> 대여일 </td>
					<td width="250" align="center"> <%= bean.getRday() %> </td>
				</tr>
				<tr>
					<td width="250" align="center"> 대여기간 </td>
					<td width="250" align="center"><%= bean.getDday() %>일간</td>
				</tr>
				<tr>
					<td width="250" align="center"> 금액 </td>
					<td width="250" align="center"><%= bean.getPrice() %> 원</td>
				</tr>
				<tr>
					<td width="250" align="center"> 수량 </td>
					<td width="250" align="center"> <%= bean.getQty() %></td>
				</tr>
				<tr>
					<td width="250" align="center"> 보험 </td>
					<td width="250" align="center"><%= temp %></td>
				</tr>
				<tr>
					<td width="250" align="center"> wifi </td>
					<td width="250" align="center"><%= temp2 %></td>
				</tr>
								<tr>
					<td width="250" align="center"> 네비게이션 </td>
					<td width="250" align="center"><%= temp3 %></td>
				</tr>
				<tr>
					<td width="250" align="center"> 베이비시트 </td>
					<td width="250" align="center"><%= temp4 %></td>
				</tr>
				<tr>
				
					<td align="center" colspan="3" style="margin-top: 10px">
						<button type="button" class="btn btn-warning" onclick="location.href='RentcarMain.jsp?center=CarReserveView.jsp'">예약 목록</button>
						<button type="button" class="btn btn-danger" onclick="removeCheck()">예약 취소</button>
					</td>
				</tr>
		</table>
	</form>
</div>

</body>
</html>