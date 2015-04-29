<%@page import="oracle.net.aso.l"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lwh.emp.*" %>
<jsp:useBean id="eDao" class="lwh.emp.EmpDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 전체검색</title>
<link rel="stylesheet" type="text/css" href="/jspTest/css/mainlayout.css">
<style type="text/css">
h2 {
	text-align: center;
}

table {
	margin: 0px auto;
	width: 450px;
	border-top: 3px double black;
	border-bottom: 3px double black;
	border-spacing: 0px;
}

thead th {
	border-bottom: 2px solid black;
	background: skyblue;
}

td {
	border-bottom: 1px dotted black;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>전체 사원 보기</h2>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>부서</th>
					</tr>
				</thead>
				<tbody>
				<%
				EmpDto dtos[] = eDao.empAllSelect();
				if(dtos == null || dtos.length == 0) {
					%>
					<tr>
						<td colspan="4" align="center">등록된 사원이 없습니다.</td>
					</tr>
					<%
				} else {
					for(int i = 0; i < dtos.length; i++){
						%>
						<tr>
							<td><%=dtos[i].getIdx() %></td>
							<td><%=dtos[i].getName() %></td>
							<td><%=dtos[i].getEmail() %></td>
							<td><%=dtos[i].getDept() %></td>
						</tr>
						<%
					}
				}
				%>
				</tbody>
			</table>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>