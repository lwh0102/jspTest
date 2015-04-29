<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" type="text/css" href="../css/mainlayout.css">
<script type="text/javascript">
function idCheck() {
	window.open("idCheck.jsp", "popup", "width=300 height=200 left=500 top=300 location=no");
}
</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	<section>
		<article>
			<h2>회원가입</h2>
			<form name="join" action="join_ok.jsp">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" readonly="readonly"></td>
						<td><input type="button" value="중복확인" onclick="idCheck()"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="tel"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="가입"> 
							<input type="reset" value="재작성">
						</td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>