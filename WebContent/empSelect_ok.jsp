<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/jspTest/css/mainlayout.css">
<!--웹에서는 슬러시로 시작하면 무조건 절대경로이다. myweb이 루트이다. -->
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
	<%@include file="header.jsp"%>
	<section>
		<article>
			<table summary="모든 사원 내역 보기">
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
						Class.forName("oracle.jdbc.driver.OracleDriver");
						String url = "jdbc:oracle:thin:@localhost:1521:xe";
						String user = "scott";
						String pwd = "1234";

						Connection conn = DriverManager.getConnection(url, user, pwd);
						String name = request.getParameter("name");
						String sql = "select * from employee where name=?";
						PreparedStatement ps = conn.prepareStatement(sql);
						ps.setString(1, name);
						ResultSet rs = ps.executeQuery();
						if (rs.next()) {
							do {
					%>
					<tr>
						<td><%=rs.getInt("idx")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getString("dept")%></td>
					</tr>
					<%
						} while (rs.next());
						} else {
					%>
					<tr>
						<td colspan="4" align="center">등록된 사원이 없습니다.</td>

					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>