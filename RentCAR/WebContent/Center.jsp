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

</head>
<body>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  				<ol class="carousel-indicators">
	    				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  				</ol>
	  			<div class="carousel-inner">
	    			<div class="carousel-item active">
	      				<img class="d-block " src="img/center1.jpg" alt="First slide"   height="800">
	    			</div>
	    		<div class="carousel-item">
	      			<img class="d-block" src="img/center2.jpg" alt="Second slide"  height="800">
	    		</div>
	    		<div class="carousel-item">
	      			<img class="d-block"  src="img/center3.jpg" alt="Third slide"  height="800" >
	    		</div>
  			</div>
  			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="sr-only">Previous</span>
  			</a>
  			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
   				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
 			</a>
</div>

</body>
</html>