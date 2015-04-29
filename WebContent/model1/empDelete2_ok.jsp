<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDTO" class="lwh.emp.EmpDto"/>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="lwh.emp.EmpDao"/>
<%
	int result = eDAO.empDelete(eDTO);
	String msg = result > 0 ? "사원삭제 성공(Beans)" : "사원삭제실패(Beans)";
%>
<script>
window.alert("<%=msg%>");
location.href="emp2.jsp";
</script> 