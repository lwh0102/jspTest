<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
table {
	margin: 0px auto;
}

h2 {
	text-align: center;
}

legend {
	text-align: center;
}
</style>
</head>
<%
	String rememberId = "";
	Cookie cks[] = request.getCookies();
	if (cks != null && cks.length != 0) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("rememberId")) {
				rememberId = cks[i].getValue();
			}
		}
	}
%>
<body>
	<section>
		<article>
			<fieldset>
				<legend>
					<h2>로그인</h2>
				</legend>
				<form name="loginForm" action="login_ok.jsp" method="post">
					<table>
						<tr>
							<td>ID</td>
							<td><input type="text" name="id" value="<%=rememberId%>"
								placeholder="id"></td>
						</tr>
						<tr>
							<td>password</td>
							<td><input type="password" name="pwd" placeholder="password"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" name="rememberId"
								value="on" <%=rememberId.equals("") ? "" : "checked"%>>ID기억하기
								<input type="submit" value="로그인"></td>
						</tr>
					</table>
				</form>
			</fieldset>
		</article>
	</section>
</body>
</html>
