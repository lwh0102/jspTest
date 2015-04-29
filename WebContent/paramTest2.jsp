<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>paramTest2.jsp 테스트</h2>
<%
	String name=request.getParameter("name");
%>
<form action="paramTest3.jsp" name="f">
<input type="hidden" name="name" value="<%=name %>">
주소:<input type="text" name="addr"><br>
<input type="submit" value="전달">
</form>
</body>
</html>


