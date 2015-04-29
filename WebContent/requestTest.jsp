<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Request 테스트</h2>
	<h3>사용자 IP:<%=request.getRemoteAddr() %></h3>
	<h3>사용자의 접속포트:<%=request.getRemotePort() %></h3>
	<h3>서버의 이름:<%=request.getServerName() %></h3>
	<h3>서버의 포트번호:<%=request.getServerPort() %></h3>
	<h3>프로젝트의 이름:<%=request.getContextPath() %></h3>
	<h3>사용자 접속페이지:<%=request.getRequestURI() %></h3>
	<h3>사용자의 접속방식:<%=request.getMethod() %></h3>
</body>
</html>