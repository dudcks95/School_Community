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
								<h3 class="mb-0">내가 작성한 글(${count })</h3>
							</div>
							<div class="bg-white">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="col-num bg-light">번호</th>
											<th class="col-sort bg-light">분류</th>
											<th class="col-title bg-light">제목</th>
											<th class="col-regdate bg-light">날짜</th>
											<th class="col-writer bg-light">작성자</th>
											<th class="col-hitcount bg-light">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${boards.content }" var="board" varStatus="st">
											<tr>
												<td class="col-num">${rowNo-st.index }</td>
												<td class="col-sort">${board.sort }</td>
												<td class="col-title" style="text-align: left"><a href="/boardDetail/${board.no}">${board.title
														}</a></td>
												<td class="col-regdate">
													<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd" />
												</td>
												<td class="col-writer">${board.writer }</td>
												<td class="col-hitcount">${board.hitcount }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="d-flex justify-content-between mt-5 mr-auto bg-white">
									<ul class="pagination">
										<c:if test="${boards.first==false }">
											<li class="page-item"><a class="page-link" href="?page=${boards.number-1 }">이전</a></li>
										</c:if>
										<c:if test="${boards.last==false }">
											<li class="page-item"><a class="page-link" href="?page=${boards.number+1 }">다음</a></li>
										</c:if>
									</ul>
									<form class="form-inline">
										<div class="row">
											<div class="col-3">
												<select name="field" class="form-control mr-sm-1">
													<option value="title">제목</option>
												</select>
											</div>
											<div class="col-6">
												<input type="text" name="word" class="form-control" placeholder="Search">
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