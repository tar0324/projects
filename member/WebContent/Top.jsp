<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Top  -->
<table width="800">
	<tr heigth="100">
	<!--  로고이미지 -->
		<td colspan="2" align="center" width="260">
		<img alt=" "src="img/logo.PNG" width="200" height="100">
		</td>
		<td colspan="5" align="center">
		<font size="10">낭만 캠핑</font>
		</td>
	</tr>
	<tr>
	<tr height="50">
		<td width="110" align="center"> 텐트 </td>
		<td width="110" align="center"> 의자 </td>
		<td width="110" align="center"> 식기류 </td>
		<td width="110" align="center"> 침낭 </td>
		<td width="110" align="center"> 테이블 </td>
		<td width="110" align="center"> 화롯대 </td>
		<td width="140" align="center"> <%= request.getParameter("id") %> </td>
	</tr>
</table>

</body>
</html>