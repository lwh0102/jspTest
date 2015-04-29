<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDto" class="lwh.emp.EmpDto"/>
<jsp:setProperty property="*" name="eDto"/>
<jsp:useBean id="eDao" class="lwh.emp.EmpDao"/>
<%
	int result = eDao.empDelete(eDto);
	String msg = result > 0 ? "사원삭제 성공(Beans)" : "사원삭제 실패(Beans)";
%>
<script>
window.alert("<%=msg%>");
location.href="emp2.jsp";
</script>