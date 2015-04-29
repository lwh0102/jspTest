<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String temp = request.getParameter("temp");
	String str = request.getParameter("str");
		String str1 = "JSP";
	%>
	<h2 style="color: blue">sub.jsp에서 출력한 문장 A</h2>
	<h2 style="color: blue">sub.jsp에서 출력한 str의 값:<%=str1%></h2>
	<h2 style="color: green">super.jsp로부터 가져온 str의 값:<%=str %></h2>
	<h2 style="color: green">super.jsp로부터 가져온 temp의 값:<%=temp %></h2>
	<h2 style="color: blue">sub.jsp에서 출력한 문장 B</h2>
</body>
</html>

