<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="scopeTest" class="lwh.bean.Counter" scope="application"/>
<h3>counter객체의 counter값:
	<jsp:getProperty property="count" name="scopeTest"/>
</h3>
<a href="scopeTest.jsp">이전 다음 페이지로...</a>
</body>
</html>


