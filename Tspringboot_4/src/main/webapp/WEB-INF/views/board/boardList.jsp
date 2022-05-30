<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerSub.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="container-fluid bg-primary py-5 bg-header"
		style="margin-bottom: 90px;">
		<div class="row py-5">
			<div class="col-12 pt-lg-5 mt-lg-5 text-center">
				<h1 class="display-4 text-white animated zoomIn">${sort}게시판</h1>
				<sec:authorize access="hasRole('USER')">
					<a class="h5 text-white"><${principal.user.school.schoolName }></a>
				</sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
					<a class="h5 text-white"><관리자입니다></a>
				</sec:authorize>
				<!-- <i class="far fa-circle text-white px-2"></i> <a href=""
								class="h5 text-white">게시판</a> -->
			</div>
		</div>
	</div>


	<div class="container">
		<div align="right" style="margin: 15px 0">
			<button class="btn btn-primary" id="writeBtn">글쓰기</button>
		</div>
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

					<c:forEach items="${boards.content }" var="board" varStatus="st">

						<tr>
							<td class="bg-white col-num">${rowNo-st.index }</td>
							<td class="bg-white col-sort">${board.sort }</td>
							<td class="bg-white col-title" style="text-align: left"><a
								href="/boardDetail/${board.no}">${board.title }</a></td>
							<td class="bg-white col-regdate"><fmt:formatDate
									value="${board.regdate }" pattern="yyyy-MM-dd" /></td>
							<td class="bg-white col-writer">${board.writer }</td>
							<td class="bg-white col-hitcount">${board.hitcount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-flex justify-content-between mt-5 mr-auto bg-white">
				<ul class="pagination">
					<c:if test="${boards.first==false }">
						<li class="page-item"><a class="page-link"
							href="?page=${boards.number-1 }">이전</a></li>
					</c:if>
					<c:if test="${boards.last==false }">
						<li class="page-item"><a class="page-link"
							href="?page=${boards.number+1 }">다음</a></li>
					</c:if>
				</ul>
				<form class="form-inline">
					<div class="row">
						<div class="col-3">
							<select name="field" class="form-control mr-sm-1">
								<option value="writer">이름</option>
								<option value="title">제목</option>
							</select>
						</div>
						<div class="col-6">
							<input type="text" name="word" class="form-control"
								placeholder="Search">
						</div>
						<div class="col-3">
							<button class="btn btn-info">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$("#writeBtn").click(function() {
			location.href = "/boardInsert"
		})
	</script>