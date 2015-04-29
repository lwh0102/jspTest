<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="lwh.wf.WebFolderDAO" scope="session" />
<%
String savePath = wf.USER_HOME + "/" + wf.getCr_path();
String fileName = request.getParameter("fileName");
try{
	File f = new File(savePath +"/"+fileName);
	if(f.isFile()){
		f.delete();
		%>
		<script>
		alert("파일 삭제 성공!!");
		location.reload();
		location.href="webFolder.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		alert("디렉토리는 지울 수 없습니다.");
		location.href="webFolder.jsp";
		</script>
		<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>