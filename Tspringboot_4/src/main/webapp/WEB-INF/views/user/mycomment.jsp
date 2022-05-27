<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../includes/4headerSub.jsp" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
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
								<%@ include file="../includes/categori.jsp" %>
							</div>
							<!-- Category End -->
						</div>
						<div class="col-lg-9">
							<div class="section-title section-title-sm position-relative pb-3 mb-4">
								<h3 class="mb-0">내가 작성한 댓글(${count})</h3>
							</div>
							<div class="bg-white">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="col-num1 bg-light">번호</th>
											<th class="col-title1 bg-light">제목</th>
											<th class="col-content1 bg-light">내용</th>
											<th class="col-writer1 bg-light">작성자</th>
											<th class="col-regdate1 bg-light">날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${comments.content }" var="comment" varStatus="st">
											<tr>
												<td class="col-num1">${rowNo-st.index }</td>
												<td class="col-title1"><a href="/boardDetail/${comment.board.no}">${comment.board.title }</a>
												</td>
												<td class="col-content1">${comment.c_content }</td>
												<td class="col-writer1">${comment.user.name }</td>
												<td class="col-regdate1">
													<fmt:formatDate value="${comment.c_regdate }" pattern="yyyy-MM-dd" />
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="d-flex justify-content-between mt-5 mr-auto bg-white">
									<ul class="pagination">
										<c:if test="${comments.first==false }">
											<li class="page-item"><a class="page-link" href="?page=${comments.number-1 }">이전</a></li>
										</c:if>
										<c:if test="${comments.last==false }">
											<li class="page-item"><a class="page-link" href="?page=${comments.number+1 }">다음</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>