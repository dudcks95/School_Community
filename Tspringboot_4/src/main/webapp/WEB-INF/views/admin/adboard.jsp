<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/4headerSub.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid bg-primary py-5 bg-header"
	style="margin-bottom: 90px;">
	<div class="row ">
		<div class="col-12 text-center"></div>
	</div>
</div>
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
	<div class="container py-5">
		<div class="row g-5">
			<div class="col-lg-3">
				<%@ include file="../includes/adcategori.jsp"%>
			</div>
			<div class="container col-lg-9">
				<div
					class="section-title section-title-sm position-relative pb-3 mb-4">
					<h3 class="mb-0">게시글현황(${count})</h3>
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
								<td class="col-delete bg-light">구분</td>

							</tr>
						</thead>

						<tbody>

							<c:forEach items="${boards.content }" var="board" varStatus="st">
								<tr>
									<td class="bg-white col-num">${rowNo-st.index }</td>
									<td class="bg-white col-sort">${board.sort }</td>
									<td class="bg-white col-title" style="text-align: left"><a
										href="/boardDetail/${board.no}">${board.title }</a></td>
									<td class="bg-white col-aregdate"><fmt:formatDate
											value="${board.regdate }" pattern="yyyy-MM-dd" /></td>
									<td class="bg-white col-writer">${board.writer }</td>
									<td class="bg-white col-hitcount">${board.hitcount }</td>
									<td class="bg-white col-delete" onclick="del('${board.no}')">삭제</td>
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
						<form class="form-inline" action="/adboard" method="get">
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
		</div>
	</div>
</div>
<script>
	function del(no) {
		if (confirm("정말 삭제할까요?")) {
			$.ajax({
				type : "delete",
				url : "/boardDelete/" + no
			}).done(function(resp) {
				alert("삭제성공")
				location.href = "/adboard";
			}).fail(function(e) {
				alert("삭제실패")
			})
		}
	}
</script>