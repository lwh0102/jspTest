<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bDAO" class="lwh.bbs.BbsDAO" />
<jsp:useBean id="bDTO" class="lwh.bbs.BbsDTO" />
<jsp:setProperty property="*" name="bDTO" />
<%
int count = bDAO.bbsWrite(bDTO);
if(count > 0) {
	%>
	<script>
	window.alert("입력성공");
	location.href="bbsList.jsp";
	</script>
	<%
} else {
	%>
	<script>
	window.alert("입력실패");
	location.href="bbsList.jsp";
	</script>
	<%
}
%>