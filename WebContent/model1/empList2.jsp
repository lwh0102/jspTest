<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lwh.emp.*" %>
<jsp:useBean id="eDAO" class="lwh.emp.EmpDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/JspTest/css/mainlayout.css">
<link rel="stylesheet" type="text/css" href="/JspTest/css/table.css">

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
#ok{
	margin: 0px auto;
	width: 1000px;
	
}
</style>
<script type="text/javascript">
function ok(){
	location.href="emp2.jsp";
}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>모든 사원 내역 보기(Beans)</h2>
			<fieldset>
				<table summary="모든 사원 내역 보기">
					<!-- summary 속성은 국가에서 지정한 표준이지만 HTML5에서는 제공되지 않는다. 
				그래서 caption이라는 태그를 이용한다. -->

					<legend>모든 사원 내역 보기</legend>
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
					EmpDto dtos[] = eDAO.empAllSelect();
					if(dtos == null || dtos.length == 0 ){
						%>
						<tr>
							<td colspan="4" align="center">등록된 사원이 없습니다.</td>
						</tr>
						<%
					} else {
						for(int i = 0; i < dtos.length; i++) {
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
				<div id="ok">
					<input type="button" value="확인" onclick="ok()">
				</div>
			</fieldset>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>