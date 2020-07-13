<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID/PW 찾기</title>
<jsp:include page="/WEB-INF/views/header.jsp" flush="flase" />
	
</head>
<body>
	<div class="container">
			<div class="row">
				<div class="col-md-4 mx-auto">
					<div class = "text-center">
						<h2 style = "text-align : center">ID/PW 찾기</h2><br>
					<form action = "find" method = "post" >
					<div class="row form-group">
						<div class = "col-md-5 text-left">
							<label class="text-center">이름</label>
						</div>
						<div class="col-md-10">
							<input class="form-control" type="text-left" id="name" name="name"/>	
						</div>
						</div>
					<div class="row form-group">
						<div class = "col-md-5 text-left">
							<label class="text-center">휴대폰</label>
						</div>
					<div class="col-md-10">
						<input class="form-control" type="text-left" id="phone" name="phone"/>	
					</div>
					</div>
						<button class="btn btn-primary" type ="button" id="check">확인</button>
						</div>
					</div>
						</form>
					</div>
				</div>
			</div>
		</div>
			</div>
			</body>
			<script>
				$("#check").click(function(){
					$.ajax({
						url:'/infofind',
						type:'post',
						dataType:'json',
						data:{memName:$("#name").val(),memPhone:$("#phone").val()},
						success:function(res){
							if(res.result){
								alert("아이디"+res.id+"\n비밀번호"+res.pw)
							}
							else{
								alert("이름 또는 전화번호를 잘못입력했습니다")
							}
						}
					})
				})
			</script>
</html>