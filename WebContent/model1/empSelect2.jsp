<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lwh.emp.*" %>
<jsp:useBean id="eDAO" class="lwh.emp.EmpDao"/>
<jsp:useBean id="eDTO" class="lwh.emp.EmpDto"/>
<jsp:setProperty property="*" name="eDTO"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainlayout.css">
</head>
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
<script>
function ok() {
	location.href="emp2.jsp";
	
}
</script>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>사원검색</h2>
			<form name ="f" action="emp2.jsp">
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
						eDTO = eDAO.empSelect(eDTO);
						if(eDTO == null) {
							%>
							<tr>
								<td colspan="4" align="center">등록된 사원이 없습니다.</td>
							</tr>
							<%
						} else {
							%>
							<tr>
								<td><%=eDTO.getIdx() %></td>
								<td><%=eDTO.getName() %></td>
								<td><%=eDTO.getEmail() %></td>
								<td><%=eDTO.getDept() %></td>			
							</tr>
							<%
						}
					
					%>
					</tbody>				
				</table>
				<input type="button" value="확인" onclick="ok()">
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>

</body>
</html>