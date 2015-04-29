<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainlayout.css">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<h2>회원검색</h2>
			<form name="memberFind" method="post">
				<table>
					<tbody>
						<tr>
							<td><select name="fkey">
									<option value="idx">사번</option>
									<option value="name">이름</option>
							</select></td>
							<td><input type="text" name="fvalue"></td>
							<td><input type="submit" value="검색"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</article>
		<article>
			<fieldset>
				<legend>결과화면</legend>
				<%
					if(request.getMethod().equals("GET")){
                 %>
				<h4>위 검색란에 검색어를 입력해주세요</h4>
				<%
					} else {
                %>
				<jsp:include page="result.jsp" />
				<%
                	}
                %>
			</fieldset>
		</article>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>