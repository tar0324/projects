<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
 
 <!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
</head>
<style>

	.wrap {
	
	 width : 100%;
	}
  /*네비게이션, 드롭메뉴*/
    .navs {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: row;
        font-family: 'Gugi', cursive;
        


    }

    .nav_item {
        width: 100%;
        text-align: center;
        padding: 10px 0px 10px;
        font-size: 40px;
        color: black;
        display: inline-block;
        position: relative;
        text-decoration: none;

    }

    .main_menu {
    	text-decoration: none;
        color: black;
    }

    .main_menu:hover {
        text-decoration: none;
        color: grey;


    }
   p {
    	margin-right : 100px;
    	margin-top : 10px;
    	
    }
    main_nav {
    	position: fixed-top;
    	
    }
    

</style>
<body>
<!-- 세션을 이용한 로그인 처리 -->
<%
	String id = (String) session.getAttribute("id");

	//로그인이 되어있지않다면
	if (id == null){
		id = "GUEST";
	}
%>



<div class="row-2">
<!-- 상단 -->

<nav class="navbar navbar-light bg-light  ">
	<div>
  		<a class="navbar-brand" href="RentcarMain.jsp" class="logo">
    		&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
    		<img src="img/mainlogo(2).png" width="150" height="60"  class="d-inline-block align-top" alt="">
    		
  		</a>
  	</div>
  	
  	<p align ="right" >
		<%=id %>님😊&nbsp;
		<%
			if(id.equals("GUEST")){
		%>
			<button type="button" class="btn btn-light" onclick="location.href='MemberLogin.jsp'" >Login</button>
			<button type="button" class="btn btn-light" onclick="location.href='MemberSignup.jsp'" >Sign up</button>
		<%
			}else {	
		%>
			<button type="button" class="btn btn-light" onclick="location.href='MemberLogout.jsp'" >Logout</button>
		<%
			}
		%>
			

</nav>



<!-- 네이게이션 -->

 <nav class="main_nav"  >
 	<ul class="navs" >
		<li class="nav_item">
			<a class="main_menu" href="RentcarMain.jsp?center=CarReserveMain.jsp">예약하기</a>
        </li>
        <li class="nav_item">
            <a class="main_menu" href="RentcarMain.jsp?center=CarReserveView.jsp">예약확인</a>
        </li>
        <li class="nav_item">
            <a class="main_menu" href="Series.html">자유게시판</a>
        </li>
        <li class="nav_item">
            <a class="main_menu" href="#">이벤트</a>
        </li>
              <li class="nav_item">
            <a class="main_menu" href="#">고객센터</a>
        </li>
    </ul>
</nav>
<hr size="2">
</div>


</body>
</html>