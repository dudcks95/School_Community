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

				<!-- Category Start -->
				<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
					<%@ include file="../includes/categori.jsp"%>
				</div>
				<!-- Category End -->
			</div>
			<div class="col-lg-9">
				<div
					class="section-title section-title-sm position-relative pb-3 mb-4">
					<h3 class="mb-0">내가 작성한 글</h3>
				</div>
				<div class="bg-light">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-num">번호</th>
								<th class="col-sort">분류</th>
								<th class="col-title">제목</th>
								<th class="col-regdate">날짜</th>
								<th class="col-writer">작성자</th>
								<th class="col-hitcount">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boards }" var="board">
								<tr>
									<td class="bg-white col-num">${board.user.userNo }</td>
									<td class="bg-white col-sort">${board.sort }</td>
									<td class="bg-white col-title"><a
										href="/boardDetail/${board.no}">${board.title }</a></td>
									<td class="bg-white col-regdate"><fmt:formatDate
											value="${board.regdate }" pattern="yyyy-MM-dd" /></td>
									<td class="bg-white col-writer">${board.writer }</td>
									<td class="bg-white col-hitcount">${board.hitcount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>