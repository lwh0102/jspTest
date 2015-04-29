<%@page import="lwh.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<jsp:useBean id="bDAO" class="lwh.bbs.BbsDAO" />
<jsp:useBean id="bDTO" class="lwh.bbs.BbsDTO" />
<jsp:setProperty property="*" name="bDTO" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/jspTest/css/mainlayout.css">
<style type="text/css">
#sub {
	background-color: #cccccc;
	text-align: center;
}

#contentTable {
	margin: 0px auto;
	width: 600px;
}

#content {
	width: 600px;
	height: 300px;
}
</style>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s == null || idx_s.equals("")) {
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);
	BbsDTO bdto = bDAO.bbsContent(idx);
	if(bdto == null) {
%>
	<script>
	window.alert("잘못된 접근 또는 삭제된 게시글입니다.");
	location.href="bbsList.jsp";
	</script>
<%
	return;
	}
%>
<script type="text/javascript">
	function ok() {
		location.href = "bbsList.jsp";
	}
</script>

</head>
<body>

	<%@include file="../header.jsp"%>
	<section>
		<article>
			<form name="bbsContent" action="bbsList.jsp">
				<table>
					<tr>
						<td>번호</td>
						<td><%=idx_s%></td>
						<td>글쓴이</td>
						<td><%=bdto.getWriter()%></td>
					</tr>
					<tr>
						<td>작성날짜</td>
						<td><%=bdto.getWritedate()%></td>
						<td>조회수</td>
						<td><%=bdto.getReadnum()%></td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="2"><%=bdto.getSubject()%></td>
					</tr>
					<tr>
						<td><input type="submit" value="확인"></td>
					</tr>
					<tr>
						<td colspan="4" align="center">목록보기 | <a
							href="bbsReWrite.jsp?subject=<%=bdto.getSubject()%>&ref=<%=bdto.getRef()%>&lev=<%=bdto.getLev()%>&sunburn=<%=bdto.getSunburn()%>">답변쓰기</a>
							| <a
							href="bbsUpdateContent.jsp?idx=<%=bdto.getIdx()%>&writer=<%=bdto.getWriter()%>&pwd=<%=bdto.getPwd()%>&subject=<%=bdto.getSubject()%>&content=<%=bdto.getContent()%>">수정</a>
							| <a href="bbsDeleteContent.jsp?idx=<%=bdto.getIdx()%>">삭제</a></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>
