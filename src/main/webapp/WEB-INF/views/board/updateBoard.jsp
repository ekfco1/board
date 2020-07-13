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
					<h2 style = "text-align : center" >게시판 수정</h2><br>
				</div>
			</div>
		</div>
	</div>
	<form action="/updateBoard" method="post" id = "updateform">
		<div style="display: inline;    float: right;    margin-right: 20px;    margin-top: -50px;">
			<button id = change type="button" class="btn btn-primary">수정</button>
		</div>
		<div>
		<table style = "margin-left : auto; margin-right : auto;">
				<tr>
					<th>제목</th>
					<td><input name="boardTitle" id = title type="text" style="width:1000px;text-align:left;" value = ${update.boardTitle}>
					<input name="boardNo"  type="text" style="display:none" value = ${update.boardNo}>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="boardContent" id = content rows="10" cols="135" style = "text-align : left;">${update.boardContent}</textarea>
					</td>
				</tr>
			</table>
	</div>
	</form>
</body>
<script type="text/javascript">
$("#change").click(function(){
	title = $("#title").val()
	content = $("#content").val()
	if(title == ""){
		alert("제목을 적어주세요")
		return
		}else if (content ==""){
			alert("내용을 적어주세요")
			return
			}
	
	$("#updateform").submit()
	
})</script>
</html>
