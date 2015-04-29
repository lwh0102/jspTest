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
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>사원 정보를 수정하세요</h2>
			<form name="f" action="empUpdate2_ok.jsp">
				<table>
					<thead>
					</thead>
					<tbody>
						<%
							eDTO = eDAO.empUpdate(eDTO);
							if (eDTO == null) {
						%>
						<tr>
							<td colspan="4" align="center">등록된 사원이 없습니다.</td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td><input type="hidden" name="idx" value="<%=eDTO.getIdx()%>"></td>
						</tr>
						<tr>
							<td>사번</td>
							<td><input type="text" name="idx" value="<%=eDTO.getIdx()%>"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"
								value="<%=eDTO.getName()%>"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email"
								value="<%=eDTO.getEmail()%>"></td>
						</tr>
						<tr>
							<td>부서</td>
							<td><input type="text" name="dept"
								value="<%=eDTO.getDept()%>"></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<input type="submit" value="수정">
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>

</body>
</html>