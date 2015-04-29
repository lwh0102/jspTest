<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="lwh.bbs.BbsDAO" />
<jsp:useBean id="bDTO" class="lwh.bbs.BbsDTO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainlayout.css">
<script type="text/javascript">
	function cancel() {
		location.href = "bbsList.jsp";
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%
		String subject = request.getParameter("subject");
		String ref = request.getParameter("ref");
		String lev = request.getParameter("lev");
		String sunburn = request.getParameter("sunburn");
	%>
	<section>
		<article>
			<fieldset>
				<legend>글쓰기</legend>
				<form name="writeContent" action="bbsReWrite_ok.jsp" method="post">
					<input type="hidden" name="ref" value="<%=ref%>"> <input
						type="hidden" name="lev" value="<%=lev%>"> <input
						type="hidden" name="sunburn" value="<%=sunburn%>">
					<table>
						<tr>
							<td>글쓴이</td>
							<td><input type="text" name="writer"></td>
							<td>비번</td>
							<td><input type="text" name="pwd"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" name="subject"
								value="RE:)<%=subject%>"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="content" cols="50" rows="10"></textarea></td>
						</tr>
						<tr align="right">
							<td colspan="3"><input type="reset" value="다시작성"> <input
								type="button" value="취소" onclick="cancel()"> <input
								type="submit" value="입력"></td>
							<td></td>
						</tr>
					</table>
				</form>
			</fieldset>

		</article>
	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>
