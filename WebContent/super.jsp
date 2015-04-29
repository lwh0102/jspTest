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
String str ="java";
%>
<h2 style="color: red">super.jsp에서 출력한 문장 A</h2>
<h2 style="color: red">super.jsp에서 출력한 str의 값:<%=str %></h2>
	<jsp:include page="sub.jsp">
		<jsp:param value="<%=str%>" name="str" />
	</jsp:include>
<h2 style="color: red">super.jsp에서 출력한 문장 B</h2>
</body>
</html>


