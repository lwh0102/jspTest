<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainlayout.css">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<h3>사원등록</h3>
			<form name="empAdd" action="empAdd2_ok.jsp">
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
			<h3>사원조회</h3>
			<form name="empSelect" action="empSelect2.jsp">
				<fieldset>
					<legend>사원조회</legend>
					<ul>
						<li><label for="selectName">사원번호</label> <input type="text"
							name="idx" id="selectName"></li>
					</ul>
					<p>
						<input type="submit" value="사원조회"> <input type="reset"
							value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
		<article>
			<h3><a href="empList2.jsp">전체사원조회</a></h3>
		</article>
		<article>
			<h3>사원삭제</h3>
			<form name="empAdd" action="empDelete2_ok.jsp">
				<fieldset>
					<legend>사원삭제</legend>
					<ul>
						<li><label for="deleteName">사원이름</label> <input type="text"
							name="name" id="deleteName"></li>
					</ul>
					<p>
						<input type="submit" value="사원삭제"> <input type="reset"
							value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
		<article>
			<h3>사원수정</h3>
			<form name="empAdd" action="empUpdate2.jsp">
				<fieldset>
					<legend>사원수정</legend>
					<ul>
						<li><label for="updateIdx">사번</label> <input
							type="text" name="idx" id="updateIdx" required="required"></li>
					</ul>
					<p>
						<input type="submit" value="사원검색"> <input type="reset"
							value="다시작성">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>