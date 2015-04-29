<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="lwh.member.MemberDTO" />
<jsp:setProperty property="*" name="mDTO" />
<jsp:useBean id="mDAO" class="lwh.member.MemberDAO" />
<script type="text/javascript">
function popupOpen() {
	window.open("member/login.jsp", "popup", "width=350 height=180 top=240 left=600 ");
}
</script>
<header>
	<!-- 시멘틱 태그로 구분지을 수 있다. 예전에는 div로 id값을 통해 구분했으나 div가 많아지면 헷갈리는 문제가 있었다. -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null || id=="") {
	%>
	<p>
	<a href="javascript:popupOpen()">로그인</a> | <a href="/jspTest/member/join.jsp">회원가입</a>
	</p>
	<%	
	} else {
		%>
		<p><%=id %>님이 로그인 중입니다 | <a href="/jspTest/member/logout.jsp">로그아웃</a></p>
		<%
	}
	%>
	

	<h1>JSP Study Site</h1>
	<nav>
		<ul>
			<li><a href="/jspTest/index.jsp">Home</a></li>
			<li><a href="/jspTest/profile.jsp">Profile</a></li>
			<li><a href="/jspTest/webFolder/webFolder.jsp">WebFolder</a></li>
			<li><a href="/jspTest/bbs/bbsList.jsp">BBS</a></li>
			<li><a href="/jspTest/guestbook.jsp">GuestBook</a></li>
		</ul>
	</nav>
	<hr>
</header>