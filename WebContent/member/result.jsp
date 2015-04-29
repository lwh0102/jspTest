<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="lwh.member.*"%>
<jsp:useBean id="mDAO" class="lwh.member.MemberDAO" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainlayout.css">
</head>
<body>
	<%
		String fkey = request.getParameter("fkey");
		String fvalue = request.getParameter("fvalue");
		ArrayList<MemberDTO> arr = mDAO.memberFind(fkey, fvalue);
	%>
	<table border="1" cellspacing="0" width="450">
		<thead>
			<tr>
				<td>idx</td>
				<td>id</td>
				<td>name</td>
				<td>tel</td>
				<td>sysdate</td>
			</tr>
		</thead>
		<tbody>
			<%
				if (arr == null || arr.size() == 0) {
			%>
			<tr>
				<td colspan="5" align="center">검색된 회원이 없습니다.</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < arr.size(); i++) {
			%>
			<tr>
				<td><%=arr.get(i).getIdx()%></td>
				<td><%=arr.get(i).getId()%></td>
				<td><%=arr.get(i).getName()%></td>
				<td><%=arr.get(i).getTel()%></td>
				<td><%=arr.get(i).getJoinDate()%></td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
</body>
</html>
