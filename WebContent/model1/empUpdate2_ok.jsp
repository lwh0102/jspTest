<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eDAO" class="lwh.emp.EmpDao" />
<jsp:useBean id="eDTO" class="lwh.emp.EmpDto" />
<jsp:setProperty property="*" name="eDTO" />
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
		location.href = "emp2.jsp";
	}
</script>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>사원 정보 수정 결과</h2>
			<form name="update_ok_form">
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
							int cnt = eDAO.empUpdate_ok(eDTO);
							if (cnt > 0) {
						%>
						<tr>
							<td><%=eDTO.getIdx() %></td>
						</tr>
						<tr>
							<td><%=eDTO.getName()%></td>
						</tr>
						<tr>
							<td><%=eDTO.getEmail()%></td>
						</tr>
						<tr>
							<td><%=eDTO.getDept()%></td>
						</tr>
						<tr>
							<td><input type="button" value="확인" onclick="ok()"></td>
						</tr>

						<%	
							}
						%>
					</tbody>
				</table>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>