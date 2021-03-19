<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentCAR: RESERVE_OPTION</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
<%
	
	//로그인처리
	String id = (String)session.getAttribute("id");

	if(id==null){
%>
	<script>
		alert("로그인 후 예약이 가능합니다.");
		location.href='MemberLogin.jsp';
	</script>
<%
		
	}
	
	//날짜 비교
	Date d1 = new Date();
	Date d2 = new Date();
	
	//날짜를 포맷
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	d1 = sdf.parse(rbean.getRday());
	d2 = sdf.parse(sdf.format(d2));
	
	//날짜 비교 메소드 사용
	int compare = d1.compareTo(d2);
	//예약하려는 날짜 < 현재 날짜가 -1
	// 같다면 0
	//예약 날짜 > 현재 날짜   1
	
	if(compare < 0){
%>
	<script>
		alert("현재 날짜보다 이전 날짜는 선택할 수 없습니다.");
		history.go(-1);
	</script>
<%
	}
	
	//데이터 저장 후 결과 보여주기, id 에 null이 들어갈수 있으므로 durltjsms 새로 정의
	String id1 = (String)session.getAttribute("id");
	rbean.setId(id1);
	
	
	
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean); //하나의 예약정보를 저장하는 메소드
	
	//차량 정보 얻어오기
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	
	//차량 총 금액
	int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
	
	//옵션 금액
	int usein =  0;
	if(rbean.getUsein()==1){usein=10000;}
	int usewifi =  0;
	if(rbean.getUsein()==1){usewifi=10000;}
	int useseat =  0;
	if(rbean.getUsein()==1){useseat=10000;}		
	int totaloption = (rbean.getQty()*rbean.getDday())*(usein+usewifi+useseat);
%>

<div class="container">
	<div class="row mt-3">
		<div class="col text-center">
			<h3>차량 예약 확인</h3>
		</div>
	</div>
	<div class="row">
		<div class = "col">
			<img alt="" src="img/<%=cbean.getImg() %>" width="550" height="400">
		</div>
		<div class="col"></div>
		<div class = "col-4 text-center">
			
			<div class="row mt-5">

				<font size="5">차량 총예약 금액 : <%=totalcar %> 원</font>
			</div>
			<div class = "row mt-5">
				<font size="5">차량 총옵션 금액 : <%=totaloption %> 원</font>
			</div>
		</div>
		<div class="col"></div>
	
	</div>
	<div class="row text-center">
		<div class="col mt-3 mb-3">
			<font size="6" color="red">차량 총금액 :</font>  <font size="6"><%=totalcar + totaloption %> 원</font>
		</div>
	</div>
</div>
</body>
</html>