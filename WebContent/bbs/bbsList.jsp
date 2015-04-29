<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="lwh.bbs.BbsDTO"%>
<jsp:useBean id="bDAO" class="lwh.bbs.BbsDAO" />
<jsp:useBean id="bDTO" class="lwh.bbs.BbsDTO" />
<jsp:setProperty property="*" name="bDTO" />
<%
	int totalCnt = bDAO.getTotalCnt(); //총 게시글 수
int listSize = 10; //보여줄 리스트의 수
int pageSize = 5; //보여줄 페이지의 수

String cp_s = request.getParameter("cp");
if(cp_s== null || cp_s.equals("")){
	cp_s="1";
}

int cp = Integer.parseInt(cp_s); //현재 페이지

int pageCnt = (totalCnt / listSize) +1;
if(totalCnt % listSize == 0){
	pageCnt--;
}

int groupNumber = cp / pageSize;
if(cp % pageSize == 0) {
	groupNumber--;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인화면(리스트)</title>
<link rel="stylesheet" type="text/css"
	href="/jspTest/css/mainlayout.css">
<style type="text/css">
listTable {
	margin: 0px auto;
	text-align: center;
}

td {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
	function bbsWrite() {
		window.location.href = "bbsWrite.jsp";
	}
</script>
<body>
	<%
		ArrayList<BbsDTO> arr = bDAO.bbsList(cp, listSize);
	%>
	<%@include file="../header.jsp"%>
	<section>
		<fieldset>
			<legend>게시판</legend>
			<article>
				<form name="bbsList" action="bbsContent.jsp" method="post">
					<table id="listTable">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (arr == null || arr.size() == 0) {
							%>
							<tr>
								<td colspan="4" align="center">검색된 회원이 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < arr.size(); i++) {
							%>
							<tr>
								<td><%=arr.get(i).getIdx()%></td>
								<td>
								<%
								for(int z = 1; z<=arr.get(i).getLev(); z++){
									out.println("&nbsp;&nbsp;");
								}
								%>							
								<a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject()%></a></td>
								<td><%=arr.get(i).getWriter()%></td>
								<td><%=arr.get(i).getReadnum()%></td>
							</tr>
							<%
								}
							}
							%>
							<tr>
								<td colspan="4">
									<%
										if (groupNumber != 0) {
									%> <a
									href="bbsList.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>">&lt;&lt;</a>
									<%
										}

										for (int i = ((groupNumber * pageSize) + 1); i <= (groupNumber * pageSize)
												+ pageSize; i++) {
									%> <a href="bbsList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;
									<%
										if (i == pageCnt)
												break;
										}
										if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
												: 0))) {
									%> <a
									href="bbsList.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>">&gt;&gt;</a>
									<%
										}
									%>
								</td>
							</tr>
							<tr align="right">
								<td colspan="4"><input type="button" value="글쓰기"
									onclick="bbsWrite()"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</article>
		</fieldset>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>
