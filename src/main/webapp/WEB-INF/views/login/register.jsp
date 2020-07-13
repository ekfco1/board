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
					<h2 style = "text-align : center">회원가입</h2><br>
						<form action="/register" method="post" id="loginForm">
							<div class="row form-group">
								<div class = "col-md-5 text-left">
									<label class="text-center">이름</label>
								</div>
								<div class="col-md-10">
									<input class="form-control" type="text-left" id="name" name="memName"/>	
								</div>
								</div>
							<div class="row form-group">
								<div class="col-md-12 text-left">
									<label >성별</label>
								</div>`
									<div class = "col-md-10">
										<label for="male" class = "radio-inline">남자</label>	
										<input type="radio" id="male" name="memGender"/>
										<label for = "femael">여자</label>
										<input type ="radio" id = "female" name = "memGender"/>
									</div>
								</div>
							</div>
							<div class="row form-group">
								<div style = "text-center;" class="col-md-5">
								<label >이메일</label>
								</div>
								<div class="col-md-10">
									<input type="text" id="email" name="memEmail" class="form-control" />
								</div>
							</div>
							<div class="row form-group">
								<div style = "text-center" class = " col-md-5">
									<label>휴대폰</label>
								</div>
								<div class="col-md-10">
									<input class="form-control" type="text" id="phone" name="memPhone"/>
								</div> 
							</div>						
							<div class="row form-group">
								<div style = "text-center" class="col-md-5">
									<label>아이디</label>
								</div>
								<div class="col-md-10">
								<input class="form-control" type="text" id="id" name="memId"/>
								</div>
								<button type="button" class="btn btn-primary"  id="btn_checkid">확인</button>	
							</div>
							
							<div class="row form-group">
							<div style ="text-center" class="col-md-5">
									<label>비밀번호</label>
								</div>
								<div class="col-md-10">
									<input  class="form-control" type="password" id="pw" name="memPasswd" />
								</div>
							</div>
							<div class="row form-group">							
								<div style = "text-center" class="col-md-5">
									<label>비밀번호 확인</label>
								</div>
								<div class="col-md-10">
									<input class="form-control" type="password" id="pwok" />
								</div>
							</div>
								<div class ="center-block;">
									<button class="btn btn-primary" type="button" id="loginBtn">가입하기</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
							
</body>
<script>
/* $("#pw"). 아이디
$(".class 이름") 클래스
 */
 	logincheck=0
	$("#btn_checkid").click(function(){
		$.ajax({
		    url : "/idcheck",
		    type : "POST",
		    cache : false,
		    data : "memId="+$("#id").val(),
		    success : function(res){
			    console.log(res)
			    if(res.result > 0){
					alert("중복된 아이디입니다.");
					logincheck=0
				}
				else{
					alert("사용 가능한 아이디 입니다.")
					logincheck=1
				}
		}});
	})
	$("#loginBtn").click(function(){
		pw=$("#pw").val()
		pwok=$("#pwok").val()
		name = $("#name").val()
		var gender = $('input[name=memGender]:checked').val()
		email=$("#email").val()
		phone=$("#phone").val()
		id=$("#id").val()
		
		if(pw!=pwok){
			alert("비밀번호가 같지 않습니다.")
			return
		}		
		else if(name == ""){
			alert("이름을 적어주세요.")
			return
			}
		else if(gender == null){
			alert("성별을 눌러주세요")
			return
		}
		else if(email == ""){
			alert("email을 적어주세요.")
			return
			}
		else if(phone == ""){
			alert("번호를 적어주세요")
			return
			}else if(phone !=""){
				    var regNumber = /^[0-9]*$/;
				    var temp = phone;
				    if(!regNumber.test(temp))
				    {
				        alert("숫자만 입력하세요");
				        $("#phone").val(temp.replace(/[^0-9]/g,""));
				        return
				    }}				
		else if(id == ""){
			alert("아이디를 입력하세요.")
			return
			}
		else if(logincheck!=1){
				alert("아이디 중복확인을 해주세요.")
				return
				}
		else if(pw == ""){
			alert("비밀번호를 입력하세요.")
			return
			}
		else if(pwok == ""){
			alert("비밀번호를 확인하세요")
			return
			}
		
		
		$("#loginForm").submit()
	})	
	/* check에 no 가 들어왔을 경우 처리 */
	/* 유효값 인증 검사 - > 비밀번호 확인, 아이디 중복확인 등등 */
</script>
</html>
