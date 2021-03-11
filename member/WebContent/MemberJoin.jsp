<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원 가입</h2>
<form action="MemberJoinProc.jsp" method="post">
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="id" id="inputEmail3" placeholder="아이디">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">패스워드</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="pass1" id="inputPassword3" placeholder="Password는 영문과 숫자의 조합으로 적어주세요">
  </div>
 
   <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email" id="inputEmail3" placeholder="Email">
    </div>
  </div>
   <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
    <div class="col-sm-10">
      <input type="tel" class="form-control" name="tel" id="inputEmail3" placeholder="전화번호">
    </div>
  </div>
  </div>
   <div class="form-group row">
	    <div class="col-sm-10">
	      <input type="submit" class="btn btn-primary" value="회원 가입"></input>
	    </div>
	  </div>
 
</form>




</body>
</html>