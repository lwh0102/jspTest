<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" type="text/css" href="css/mainlayout.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script>
function openPopup() {
	window.open("popup.jsp", "popup", "width=300 height=300");
}
</script>
</head>
<%
String lastDate = "첫방문을 환영합니다.";
String popupCheck = null;
Cookie cks[] = request.getCookies();
if(cks != null || cks.length != 0) {
	for(int i = 0; i < cks.length; i++) {
		if(cks[i].getName().equals("lastDate")){
			lastDate = URLDecoder.decode(cks[i].getValue());
		}
		if(cks[i].getName().equals("popupCheck")){
			popupCheck = cks[i].getValue();
		}
	}
} else {
	out.println("값이 없습니다.");
}
%>
<body <%= popupCheck == null ? "onload='openPopup()'":""%>>
	<%@ include file="header.jsp"%>
	<section>
		<!-- 본문에 관련된 컨텐츠 영역. section 태그를 통해 전반적인 컨텐츠 영역을 잡는다.-->
		<article id="mainImg">
			<img alt="MainImage" src="image/main.jpg">
		</article>
		<article id="mainMenu">
			<h2>반갑습니다. 여러분!</h2>
			<h3><%=lastDate %></h3>
			<%
				Calendar now = Calendar.getInstance();
				int y = now.get(Calendar.YEAR);
				int m = now.get(Calendar.MONTH);
				int d = now.get(Calendar.DATE);
				int h = now.get(Calendar.HOUR);
				int mm = now.get(Calendar.MINUTE);
				String str = "마지막 접속일:"+y+"년"+m+"월"+d+"일"+h+"시"+mm+"분"; 
				str = URLEncoder.encode(str);
				Cookie ck = new Cookie("lastDate", str);
				ck.setMaxAge(60*60*24*30);
				response.addCookie(ck);
			%>
			<ul>
				<li>여기에 계속적으로 추가..</li>
				<li><a href="emp.jsp">사원관리</a></li>
				<li><a href="/jspTest/member/join.jsp">회원가입</a></li>
				<li><a href="/jspTest/member/memberFind.jsp">회원검색</a></li>
			</ul>
		</article>
	</section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>