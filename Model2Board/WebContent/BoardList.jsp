<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

</head>
<body>
<c:if test="${msg != null }">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
	</script>
</c:if>

<div class="container">
<div class="row text-center mt-5">
	<div class="col">
		<h2>게시글 보기</h2>
	</div>
</div>
<div class="row mt-5 text-right">
	<button  type="button" class="btn btn-outline-dark" onclick="location.href='BoardWriteForm.jsp'" >글쓰기</button>
</div>
<div class="row mt-1 text-center">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  
  <c:set var="number" value="${number }"/>
  <c:forEach var="bean" items="${v }">
  	<tr>
  		<th scope="row">${number }</th>
  		<td align="left">
  		<c:if test="${bean.re_step > 1 }">
  			<c:forEach var="j" begin="1" end="${(bean.re_step-1)*5 }">
  				&nbsp;
  			</c:forEach>
  		</c:if>
  		<a href="BoardInfoControl.do?num=${bean.num }">${bean.subject }</a>
  		</td>
  		<td>${bean.writer }</td>
  		<td>${bean.reg_date}</td>
  		<td>${bean.readcount }</td>
  	</tr>
  	<c:set var="number" value="${number - 1 }"/>
  </c:forEach>
</table>
</div>
<!-- 페이지 카운터링 소스를 작성 -->
<c:if test="${count > 0 }">
	<c:set var="pageCount" value="${count / pageSize + (count%pageSize == 0 ? 0 : 1) }"/>
	<c:set var="startPage" value="${1 }" />
	<c:if test="${ currentPage % 10 != 0}">
		<!-- 결과를 정수형으로 리턴 받아야하기에 fmt -->
		<fmt:parseNumber var="result" value="${currentPage / 10 }" integerOnly="true"/>
		<c:set var="startPage" value="${result*10 + 1 }"/>
	</c:if>
	<c:if test="${ currentPage % 10 == 0}">
		<!-- 결과를 정수형으로 리턴 받아야하기에 fmt -->
		<c:set var="startPage" value="${(result-1)*10 + 1}"/>
	</c:if>
	<!-- 화면에 보여질 페이지를 처리 -->
	<c:set var="pageBlock" value="${10 }" />
	<c:set var="endPage" value="${startPage + pageBlock -1}" />
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount }" />
	</c:if>
	
<div class="row justify-content-center mt-3">
<nav aria-label="Page navigation example" >
  <ul class="pagination justify-content-center" >
    <li class="page-item">
	<!-- 이전링크를 걸지 파악 -->
	<c:if test="${startPage > 10 }">
		 <a class="page-link" href="BoardListCon.do?pageNum=${startPage - 10 }" aria-label="Previous" style="color: black">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      	</a>
	</c:if>
	</li>
	<!-- 페이징 처리 -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		 <li class="page-item"><a class="page-link" href='BoardListCon.do?pageNum=${i }' style="color: black">${i }</a>
    </li>
	</c:forEach>
	<!-- 다음 -->
	<c:if test="${endPage<pageCount }" >
	<li class="page-item">
      <a class="page-link" href="BoardListCon.do?pageNum=${startPage+10}" aria-label="Next" style="color: black">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
      </li>
	</c:if>
	
  </ul>
</nav>
</div>
</c:if>
	



</div>
</body>
</html>