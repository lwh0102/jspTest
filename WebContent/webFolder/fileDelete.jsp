<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cancel() {
		self.close();
	}
</script>
</head>
<body>
	<section>
		<article>
			<h2>삭제하시겠습니까?</h2>
			<form name="deleteFile" action="fileDelete_ok.jsp">
				<table>
					<tr>
						<td><input type="button" value="취소" onclick="cancel()"><input
							type="submit" value="삭제"></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
</body>
</html>