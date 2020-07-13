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
						<h2 style = "text-center">게시판작성</h2><br>
					</div>
				</div>
			</div>
		</div>
	<form action="/writeBoard" method="post" id = writeform>
	<div>
	<table style = "margin-left : auto; margin-right : auto;">
				<tr>
					<th>제목</th>
					<td><input name="boardTitle" name = title id = title type="text" style="width:1100px;text-align:left;" />
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="boardContent" name = content id = content rows="10" cols="149" style = "text-align : left;"></textarea>
					</td>
				</tr>
			</table>
	</div>
	<div style="display: inline;    float: right;    margin-right: 20px;    /* margin-bottom: -70px; */">
			<button type="button" class="btn btn-primary" name = "btnWrite" id = btnWrite>입력</button>
	</div>
	</form>
</body>
<script>
$("#btnWrite").click(function(){
	title = $("#title").val()
	content = $("#content").val()
	if(title == ""){
		alert("제목을 적어주세요")
		return
		}else if (content ==""){
			alert("내용을 적어주세요")
			return
			}
	
	$("#writeform").submit()
	
})







</script>
</html>
