<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainlayout.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<article>
			<h3>사원등록</h3>
			<form name="empAdd" action="empAdd_ok.jsp">
				<fieldset>
					<legend>사원등록</legend>
					<ul>
						<li><label for="addName">사원이름</label> <input type="text"
							name="name" id="addName"></li>
						<li><label for="addEmail">E-mail</label> <input type="text"
							name="email" id="addEmail"></li>
						<li><label for="addDept">부서</label> <input type="text"
							name="dept" id="addDept"></li>
					</ul>
					<p>
						<input type="submit" value="사원등록"> <input type="reset"
							value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
		<article>
			<h3>사원검색</h3>
			<form name="empAdd" action="empSelect_ok.jsp">
				<fieldset>
					<legend>사원검색</legend>
					<ul>
						<li><label for="addName">사원이름</label> <input type="text"
							name="name" id="addName"></li>
					</ul>
					<p>
						<input type="submit" value="사원검색"> <input type="reset"
							value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
		<article>
			<h3><a href="empAllSelect_ok.jsp">모든사원검색</a></h3>
		</article>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>
