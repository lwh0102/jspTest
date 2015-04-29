<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="lwh.member.MemberDTO"/>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="lwh.member.MemberDAO"/>
<%
	int result = mDAO.joinMember(mDTO);
	String msg = result > 0 ? "가입 성공" : "가입 실패";
%>
<script>
window.alert("<%=msg%>");
location.href="join.jsp";
</script>
