<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="lwh.bbs.BbsDAO" />
<jsp:useBean id="bDTO" class="lwh.bbs.BbsDTO" />
<jsp:setProperty property="*" name="bDTO" />
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int result = bDAO.deleteContent(idx);
	if (result > 0) {
%>
<script>
	window.alert("삭제 성공!");
	location.href = "bbsList.jsp";
</script>
<%
	} else {
%>
<script>
	window.alert("삭제 실패!");
	location.href = "bbsList.jsp";
</script>
<%
	}
%>
