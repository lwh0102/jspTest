<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="popupForm" action="popup_ok.jsp" method="post">
		<table border="1">
			<tr align="center">
				<td><h2 align="center">공지사항</h2></td>
			</tr>
			<tr>
				<td>지각하지말자</td>
			</tr>
			<tr>
				<td>나쁜짓하지말자</td>
			</tr>
			<tr>
				<td>욕하지말자</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="popupCheck" value="on">오늘하루
					안보기<input type="submit" value="닫기"></td>
			</tr>
		</table>
	</form>
</body>
</html>