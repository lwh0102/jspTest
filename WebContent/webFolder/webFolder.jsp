<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/jspTest/css/mainlayout.css">
<style type="text/css">
table {
	margin: 10px auto;
	padding: 10px;
	border: 3;
}

th {
	margin: 10px auto;
	padding: 12px;
	background-color: skyblue;
	width: 100px;
}

tr {
	text-align: center;
}

#list {
	width: 600px;
}
</style>
<script type="text/javascript">
	function uploadOpen() {
		window.open("fileUpload.jsp", "fileUpload",
				"width=300 height=180 left=600 top=180");
	}

	function makeFolder() {
		window.open("makeFolder.jsp", "makeFolder",
				"width=300 height=180 left=600 top=180");
	}
</script>
</head>
<body>
	<%
		String sid = (String) session.getAttribute("id");
		if (sid == null || sid.equals("")) {
	%>
	<script>
		window.alert("로그인 후 서비스 이용이 가능합니다.");
		location.href = "/jspTest";
	</script>
	<%
		return;
		}
	%>
	<%@include file="../header.jsp"%>
	<jsp:useBean id="wf" class="lwh.wf.WebFolderDAO" scope="session" />
	<%
		wf.setUserId(id);
		if (!wf.userFolderExists()) {
			File f = new File(wf.USER_HOME + "/" + wf.getUserId());
			f.mkdir();
			wf.userFolderExists();
		}
		String cp = request.getParameter("cp");
		if (cp == null || cp.equals("")) {
			cp = id;
		}
		wf.setCr_path(cp);
	%>
	<section>
		<article>
			<h2 style="text-align: center; color: skyblue; text-shadow: 2px 2px">
				<%=id%>님 Y드라이브
			</h2>
			<fieldset>
				<legend>사용정보</legend>
				<table>
					<tr>
						<td align="right">총용량</td>
						<td><meter min="0" max="<%=wf.getTotal_size()%>"
								value="<%=wf.getTotal_size()%>"></meter><%=wf.getTotal_size() / 1024%>kbyte</td>
					</tr>
					<tr>
						<td>사용용량</td>
						<td><meter min="0" max="<%=wf.getTotal_size()%>"
								value="<%=wf.getUsed_size()%>"></meter><%=wf.getUsed_size() / 1024%>kbyte</td>
					</tr>
					<tr>
						<td>남은용량</td>
						<td><meter min="0" max="<%=wf.getTotal_size()%>"
								value="<%=wf.getFree_size()%>"></meter><%=wf.getFree_size() / 1024%>kbyte</td>
					</tr>
				</table>
			</fieldset>
		</article>
		<article>
			<fieldset>
				<legend>파일 탐색기</legend>
				<input type="button" value="파일올리기" onclick="uploadOpen()"> <input
					type="button" value="폴더만들기" onclick="makeFolder();">
				<form name="listForm" action="fileDelete_ok.jsp">
				<table id="list">
					<thead>
						<th>Type</th>
						<th>Folder or File Name</th>
						<th>Delete</th>
					</thead>
					<tbody>
						<%
							if (!wf.getCr_path().equals(wf.getUserId())) {
								int pos = wf.getCr_path().lastIndexOf("/");
								String up_cp = wf.getCr_path().substring(0, pos);
						%>
						<tr>
							<td colspan="3" align="left"><a
								href="webFolder.jsp?cp=<%=up_cp%>">상위로..</a></td>
						</tr>
						<%
							}
						%>
						<%
							File f2 = new File(wf.USER_HOME + "/" + wf.getCr_path());
							File files[] = f2.listFiles();
							if (files == null || files.length == 0) {
						%>
						<tr>
							<td>등록된 경로에 파일이 없습니다.</td>
						</tr>
						<%
							} else {
								for (int i = 0; i < files.length; i++) {
						%>
						<tr>
							<td><%=files[i].isFile() ? "[파일]" : "[폴더]"%></td>
							<td>
								<%
									if (files[i].isFile()) {
								%> <a href="upload/<%=wf.getCr_path()%>/<%=files[i].getName()%>">
									<%=files[i].getName()%>
							</a> <%
 									} else {
 								 %> <a
								href="webFolder.jsp?cp=<%=wf.getCr_path()%>/<%=files[i].getName()%>">
									<%=files[i].getName()%>
							</a> <%
 									}
 								 %>
							</td>
							<td><input type="hidden" name="fileName" value="<%=files[i].getName()%>"><input type="submit" value="삭제"></td>
							<%
								}
							}
							%>
						</tr>
					</tbody>
				</table>
				</form>
			</fieldset>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>
