<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="wf" class="lwh.wf.WebFolderDAO" scope="session" />
<%
	String savePath = wf.USER_HOME + "/" + wf.getCr_path();
	String folderName = request.getParameter("userFolder");
	try {
		File f = new File(savePath + "/" + folderName);
		f.mkdir();
		wf.userFolderExists();
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
	alert("폴더생성 완료!!");
	opener.location.href="webFolder.jsp?cp=<%=wf.getCr_path()%>";
	location.reload();
	self.close();
</script>

