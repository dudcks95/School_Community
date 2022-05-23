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
<div class="bg-white">
<table class="table table-hover">


	<thead>
	<tr>
		<th class="col-num bg-light">번호</th>
		<th class="col-sort bg-light">분류</th>
		<th class="col-title bg-light">제목</th>
		<th class="col-regdate bg-light">날짜</th>
		<th class="col-writer bg-light">글쓴이</th>
		<th class="col-hitcount bg-light">조회수</th>

	</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${boards }" var="board" varStatus="st">
		<tr>
			<td class="bg-white col-num">${board.no }</td>
			<td class="bg-white col-sort">${board.sort }</td>
			<td class="bg-white col-title"><a href="">${board.title }</a></td>
			<td class="bg-white col-regdate">
			<fmt:formatDate value= "${board.regdate }" pattern="yyyy-MM-dd"/>
			</td>
			<td class="bg-white col-writer">${board.writer }</td>
			<td class="bg-white col-hitcount">${board.hitcount }</td>
		</tr>
	
	</c:forEach>

	
	</tbody>

</table>
</div>
<button><a href="/boardInsert">글 작성하기</a></button>
</div>
</body>
</html>