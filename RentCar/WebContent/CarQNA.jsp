<%@page import="db.BboardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentCAR: Q&A</title>



<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String subject = request.getParameter("subject");
	String searchword = request.getParameter("search_word");
	
	RentcarDAO dao = new RentcarDAO();
	Vector<BboardBean> v = dao.getsearchsub(searchword);

	
	//게시글보기에 카운터링을 설정하기위한 변수 선언
	//게시글의 개수
	int pageSize = 10;
	//현재 카운터를 클릭한 번호값을 읽어옴
	String pageNum = request.getParameter("pageNum");
	//null값 처리
	if (pageNum == null){
		pageNum = "1";
	}
	
	
	int count = 0; //전체 글의 갯수
	int number = 0; //페이지 넘버링 변수
	
	//보고자 하는 페이지 숫자를 저장
	int currentPage = Integer.parseInt(pageNum);
	
	RentcarDAO bdao = new RentcarDAO();
	count =bdao.getAllCount(); //전체 게시글의 갯수를 읽는 메소드 호출 
	
	//현재 페이지에서 보여줄 시작번호, 끝번호를 설정
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	//게시글 리턴
	Vector<BboardBean> vec = bdao.getAllBboard(startRow, endRow); 
	
	//테이블에 표시할 번호
	number = count - (currentPage -1) * pageSize;
%>

<div class="container">
<div class="row text-center mt-3">
	<div class="col">
		<a href="RentcarMain.jsp?center=CarQNA.jsp">
		<img alt="" src="img/QNA.png" width="530" height="250">
		</a>
	</div>
</div>
<div class="row mt-5">

   		<button type="button" class="btn btn-outline-dark" onclick="location.href='RentcarMain.jsp?center=BboardWriteForm.jsp'">글쓰기</button>
	
</div>
<div class="row mt-1 text-center">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">조회</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
<% 
	for(int i = 0; i <vec.size(); i++){
		BboardBean bean = vec.get(i); // 벡터에있는 데이터 추출
%>
  
    <tr>
      <th scope="row"><%=number-- %></th>
      <td align="left"><a href="RentcarMain.jsp?center=BboardInfo.jsp?num=<%=bean.getNum() %>" style="text-decoration:none; color:black">
      <%
      	if(bean.getRe_step() > 1){
      		for(int j = 0; j <(bean.getRe_step()-1)*5; j++){
      %>&nbsp;
      <%
      		}
      	}
      %>
      	<%=bean.getSubject() %></a></td>
      <td><%=bean.getId() %></td>
      <td><%=bean.getReadcount() %></td>
      <td><%=bean.getSub_date() %></td>
    </tr>
<%
	}
%>
  </tbody>
</table>
</div>
<!-- 페이지 카운터링 -->
<% 
	if(count > 0) {
		int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);//카운터링 숫자를 얼마까지 보여줄건지 결정
		
		//시작페이지
		int startPage = 1;
		if(currentPage % 10 != 0){
			startPage = ((int)(currentPage/10)) * 10 +1;
		} else {
			startPage = ((int)(currentPage/10)-1) * 10 +1;
		}
		
		int pageBlock = 10; //카운터링 처리 숫자
		int endPage = startPage + pageBlock -1; //화면에 보여질 페이지의 마지막 숫자
		
		if(endPage > pageCount) endPage = pageCount;
		
		
%>
<form action="RentcarMain.jsp?center=Search.jsp" method="post">
<div class="row mt-4">
	<div class="col-2 text-center form-control">
		제목
	</div>
	<div class="col-8">
		<input name="search_word" type="text" class="form-control">
	</div>
	<div class="col-2">
		<input type="hidden" name="search_word" value="search_word">
		<button type="submit" class="btn btn-dark">검색</button>
	</div>
</div>
</form>
<div class="row justify-content-center mt-3">
<nav aria-label="Page navigation example" >
  <ul class="pagination justify-content-center" >
    <li class="page-item">
    <%
  		//이전이라는 링크를 만들건지 파악
  		if(startPage > 10){
    %>
      <a class="page-link" href="RentcarMain.jsp?center=CarQNA.jsp?pageNum=<%=startPage-10 %>" aria-label="Previous" style="color: black">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <%	}
    	//페이징 처리
    	for(int i = startPage; i <= endPage; i++){
    %>
    <li class="page-item"><a class="page-link" href="RentcarMain.jsp?center=CarQNA.jsp?pageNum=<%=i %> " style="color: black"><%=i %></a>
    </li>
    <%
    	}
    	
    	//다음이라는 링크를 만들건지 파악
    	if (endPage < pageCount) {
    %>
    <li class="page-item">
      <a class="page-link" href="RentcarMain.jsp?center=CarQNA.jsp?pageNum=<%=startPage+10 %>" aria-label="Next" style="color: black">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
      <%
     	 }
	}
    %>
    </li>
  </ul>
</nav>
</div>





</div>
</body>
</html>