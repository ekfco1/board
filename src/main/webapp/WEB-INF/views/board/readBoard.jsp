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
						<h2 style = "text-align : center">게시글</h2><br>
					</div>
				</div>
			</div>
		</div>
				<!-- 게시판 내부구조 종류 1. 그리드 2. 테이블 3. (1,2) 방법을 제외하고 직접세팅 -->
					<c:choose>
						<c:when test='${board.memNo == sessionScope.no}'>
					<!-- 글수정과 삭제는 본인일 경우만 가능해야한다. -->
							<div style="display: inline;    float: right;    margin-right: 20px;    margin-top: -50px;">
								<button onclick="javascript:location.href='updateBoard?boardNo=${board.boardNo}'" class="btn btn-primary">수정</button>
								<button onclick="javascript:location.href='deleteBoard?boardNo=${board.boardNo}'" type = "submit"class="btn btn-primary">삭제</button>
							</div>
						</c:when>
						</c:choose>	
							
							<table style = "margin-left: auto; margin-right: auto;">
								<tr>
									<th>제목</th>
									<td><input name="boardTitle" id = title type="text" style="width:1100px;text-align:left;" value = ${board.boardTitle} readonly/>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea name="boardContent" id = content rows="10" cols="149" style = "text-align : left;" readonly>${board.boardContent}</textarea>
									</td>
								</tr>
								<c:choose>	
								 <c:when test='${not empty sessionScope.no}'>                
										<tr>
											<th>댓글입력</th>
											<td><input name="response" id = "response"  type="text" style="width:1100px; text-align:left;" />
											<button class="btn btn-primary" style="display: inline;  margin-right: 10px;  float: right; " 
											name = "btn" id= "btn">입력</button>	</td>
										</tr>
								</c:when>
							</c:choose>
								<tr>
					 			<th>댓글</th>
					 			</tr>
					 			<c:forEach items="${list}" var="res">	
					 			<tr>
									<td><c:out value = "${res.memName}"/></td>
									<td><c:out value ="${res.resContent}"/></td>
								</tr>
								</c:forEach>
									
						</table>
				
</body>
<script type="text/javascript">
var boardNo = ${board.boardNo}
var memNo = ${sessionScope.no}  
$("#btn").click(function(){

	$.ajax({
	    url : "/boardComment",
	    type : "POST",
	    dataType:"json",
	    cache : false,
	    data : {"boardNo":boardNo,"memNo":memNo,"resContent":$('#response').val()},
	    success : function(res){
		    if($("#response").val() == ""){
		    	alert("다시 입력하세요");
		    	return
			}else{
				location.reload()}
	}});
});

/* $('#response').ready(function() {
   $("input[name=testInput]").each(function(index, item){
       alert($(item).attr("value1") + ": " + $(item).attr("value2"));
   });
});  */
</script>
</html>
