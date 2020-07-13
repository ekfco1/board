<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="flase" />
<div class = "text-center">
	<table style="width:1200px; margin: 0 auto; border:solid 2px;">
		<tr>
			<th style="width:10%;" class = "text-center">번호</th>
			<th style="width:80%;">제목</th>
			<th style="width:10%;" class = "text-center">작성자</th>
			
		</tr>
		<!-- 게시글 -->
		<br><br>
		<c:choose>
           	<c:when test="${!empty list}">
 					<c:forEach items="${list}" var="brd">
                    	<tr style="text-align:center;">
                        <td style="width:10%;" id = boardNo>${brd.boardNo}</td>
                        <td style="width:80%; text-align:left;" id = boardTitle><a href="readBoard?boardNo=${brd.boardNo}">${brd.boardTitle}</a></td>
                        <td style="width:10%; text-align : center;" id = memName>${brd.memName}</td>
                   	</tr>
                   </c:forEach>
              </c:when>
              <c:otherwise>
              		<tr style="text-align: center; height: 35px;">
                    	<td colspan="6">게시글이 없습니다.</td>
                   </tr>
			</c:otherwise>
          </c:choose>
	</table>
	<!-- 글쓰기의 경우에는 로그인 한 경우에만 보여져야 한다. -->
	
	<!-- 페이징처리 -->
</div>
</body>
</html>
