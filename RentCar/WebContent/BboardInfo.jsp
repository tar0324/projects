<%@page import="db.RentcarDAO"%>
<%@page import="db.BboardBean"%>
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
<%
	//공백제거후 정수형으로 바뀜
	int num = Integer.parseInt(request.getParameter("num").trim());

	RentcarDAO bdao = new RentcarDAO();
	
	BboardBean bean = bdao.getOneBboard(num);
	
	
%>
<script type="text/javascript">
		 function removeCheck() {
			 if(confirm("정말 삭제하시겠습니까?") == true){
				 alert("삭제되었습니다.");
				 location.href='BboardDeleteProc.jsp?num=<%=bean.getNum() %>';
			 } else{
				 return;
			 }
		 }
</script>

<div class="container">
	<div class="row">
		<div class="col-1"></div>
		<div class="col">
			<div class="row mt-4">
				<a href="RentcarMain.jsp?center=CarQNA.jsp">
					<button type="button" class="btn btn-dark">목록</button>
				</a>
			</div>
			<div class="row mt-3">
				<h1> <%=bean.getSubject() %> </h1>
			</div>
			<div class="row mt-3">
				<div class="col mt-3">
					<%=bean.getId()%> ・ <%=bean.getSub_date() %>
				</div>
				<div class="col mt-3" align="right">
					조회수 <%=bean.getReadcount() %>
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
						<%=bean.getContent() %>
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
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='RentcarMain.jsp?center=BboardUpdateForm.jsp?num=<%=bean.getNum() %>'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick=" location.href='RentcarMain.jsp?center=BboardDeleteForm.jsp?num=<%=bean.getNum() %>'">삭제</button>
				</div>
			
				<div class="col" align="right">
						<button type="button" class="btn btn-dark" onclick="location.href='RentcarMain.jsp?center=BoardReWriteForm.jsp?num=<%=bean.getNum()%>&id=<%=bean.getId() %>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">답변</button>


				</div>
				
			</div>
		</div>
		<div class="col-1"></div>
	</div>




</div>
</body>
</html>