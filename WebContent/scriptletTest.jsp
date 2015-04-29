<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>html에서 작성한 문자열</h4>
	<!-- HTML 주석입니다. -->
	<%
		System.out.println("JSP에서 출력한 문자열");
		//한줄 주석
		/*복수 주석*/
		/**문서화 주석*/
		//out: jsp의 기본 내장객체(출력 스트림)
		out.println("<h3>JSP에서 출력한 문자열</h3>");
		
		String str = "java"; //지역변수 
		//퍼센트 안에 기술된 코드들은 서블릿으로 변환되면서 메서드 안으로 기술된다. 그래서 지역변수
		out.println("<h3>str에서 출력한 문자열: "+str+"</h3>");
	%>
<h3>str의 값: <%= str %></h3>

<%! 
	String str = "JSP"; //멤버변수
	public int getNum(int a, int b){
		return a + b;
	}
%>
<%
	out.println("<h3>str의 값: "+this.str+"</h3>"); //멤버변수에 접근하고 싶으면 this 키워드를 이용해라.
	out.println("<h3>3+7="+getNum(3,7)+"</h3>");
%>
<h3>5+6=<%=getNum(5,6) %></h3>
<%
	Calendar now = Calendar.getInstance();
	int y = now.get(Calendar.YEAR);
	int m = now.get(Calendar.MONTH)+1;
	int d = now.get(Calendar.DATE);
	
	out.println("<h2>"+y+"년"+m+"월"+d+"일</h2>");
	
	
%>
</body>
</html>