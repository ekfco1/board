<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="flase" />
	<div class="container">
		<div class="row">
			<div class="col-md-4 mx-auto">
				<div class = "text-center">
					<h2>로그인</h2>
					<form class="form-inline" role = "form" action="/login" method="post">
						<div class="row form-group">
							<div class = "col-md-6">
								<label class="text-left">아이디</label>
							</div>
							<div class="col-md-12">
								<input class="form-control" type="text" id="id" name="memId"/>	
							</div>
						</div>
						<div class="row form-group"><br>
							<div class = "col-md-6">
							<label class ="text-center">비밀번호</label>
							</div>
							<div class="col-md-12">
								<input class="form-control" type="password" id="pw" name="memPasswd"/>	
							</div>	
							</div>	
					</form>
					
					<div class ="text-center" style = "margin-right: 30px;" >
						<button type="button"  class="btn btn-primary" id="loginBtn">로그인</button>
						<button onclick = "javascript:location.href='find'"  class="btn btn-primary" >ID/PW 찾기</button>
						<button onclick="javascript:location.href='register'"  class="btn btn-primary" >회원가입</button>
					</div>
				</div>
			</div>
	</div>
	</div>
	
</body>
<script>
	logincheck=0
	$("#loginBtn").click(function(){
		$.ajax({
		    url : "/login",
		    type : "POST",
		    cache : false,
		    dataType:"json",
		    data : {"memId":$("#id").val(),"memPasswd":$("#pw").val()},
		    success : function(res){
			    if(res.result == false){
					alert("ID 또는 비밀번호가 잘못 되었습니다.")
					return
				    }else{
					alert("로그인 성공!")
					location.href="/";
					
					    }
			
		}});
	})
	/* check에 no 가 들어왔을 경우 처리 */
	
</script>
</html>
