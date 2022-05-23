<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid bg-primary py-5 bg-header"
			style="margin-bottom: 90px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
					<h1 class="display-4 text-white animated zoomIn">게시판</h1>
					<a href="" class="h5 text-white">Home</a> <i class="far fa-circle text-white px-2"></i> <a href=""
						class="h5 text-white">게시판</a>
				</div>
			</div>
		</div>


<div class="container">
<div class="bg-light">
<table class="table table-hover">


	<thead>
	<tr>
		<th>번호</th>
		<th>분류</th>
		<th>제목</th>
		<th>날짜</th>
		<th>글쓴이</th>
		<th>조회수</th>

	</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${boards }" var="board">
		<tr>
			<td class="bg-white">${board.no }</td>
			<td class="bg-white">${board.sort }</td>
			<td class="bg-white"><a href="/boardDetail/${board.no}">${board.title }</a></td>
			<td class="bg-white">
			<fmt:formatDate value= "${board.regdate }" pattern="yyyy-MM-dd"/>
			</td>
			<td class="bg-white">${board.writer }</td>
			<td class="bg-white">${board.hitcount }</td>
		</tr>
	
	</c:forEach>

	
	</tbody>

</table>
</div>
<button><a href="/boardInsert">글 작성하기</a></button>
</div>
</body>
</html>