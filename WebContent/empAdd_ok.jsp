<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "scott";
    String pwd = "1234";
        
    Connection conn = DriverManager.getConnection(url, user, pwd);
        
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String dept = request.getParameter("dept");
        
    String sql = "insert into employee values(employee_idx.nextval, ?,?,?)";
        
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, dept);
        
    int count = ps.executeUpdate();
        
    if(count > 0 ) {
   	%>
    <script>
    	window.alert("사원등록 성공");
        location.href="emp.jsp";
    </script>
	<%
    } else {
    %>
	<script>
		window.alert("사원등록 실패");
        location.href="emp.jsp";
    </script>
	<%
        }	
	%>