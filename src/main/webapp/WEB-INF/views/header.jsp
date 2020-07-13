<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "/resources/bootstrap/css/bootstrap.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="text-center" style="width: 100%">
			<h1 style="text-align: center"><p><a href="/">자유게시판</a></p></h1>
		</div>
		<div style="display: inline;    float: right;    margin-right: 20px;    margin-top: -25px;">
			<c:choose>
				<c:when test='${not empty sessionScope.no}'>
					<button type="button" class="btn btn-primary" onclick="javascript:location.href='/writeBoard'">글쓰기</button>
					<button type ="button" class ="btn btn-primary" onclick="javascript:location.href='/logout'">로그아웃</button>					
				</c:when>
				<c:otherwise>
					<button onclick="goLogin()" type ="button" class ="btn btn-primary">로그인</button>
					<button onclick="javascript:location.href='register'"type ="button" class ="btn btn-primary">회원가입</button>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			
		</div>
	</header>
</body>
<script>
	function goLogin() {
		location.href = "login"
	}
</script>
</html>