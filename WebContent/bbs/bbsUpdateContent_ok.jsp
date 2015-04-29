<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="lwh.bbs.BbsDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String writer = request.getParameter("writer");
	String pwd = request.getParameter("pwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

	int result = bDAO.updateContent(idx, writer, pwd, subject, content);
	if (result > 0) {
%>
<script>
	window.alert("수정 성공!");
	location.href = "bbsList.jsp";
</script>
<%
	} else {
%>
<script>
	window.alert("수정 실패!");
	location.href = "bbsList.jsp";
</script>
<%
	}
%>
