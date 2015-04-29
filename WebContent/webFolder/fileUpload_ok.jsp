<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="wf" class="lwh.wf.WebFolderDAO" scope="session" />
<%
	String savePath = wf.USER_HOME + "/" + wf.getCr_path();
	try {
		MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFree_size(), "UTF-8");
	} catch (Exception e) {
%>
<script>
	window.alert("용량이 초과되었습니다.!!");
	self.close();
</script>
<%
	}
%>
<script>
window.alert("업로드 성공!!");
opener.location.href="webFolder.jsp?cp=<%=wf.getCr_path()%>";
self.close();
</script>

