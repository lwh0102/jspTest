<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>paramTest3.jsp테스트</h2>
<%
String name=request.getParameter("name");
String addr=request.getParameter("addr");
%>
<h3>이름:<%=name %> </h3>
<h3>주소:<%=addr %> </h3>
</body>
</html>



