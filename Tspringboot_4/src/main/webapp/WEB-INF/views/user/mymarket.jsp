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
					<h3 class="mb-0">나의 장터(${count })</h3>
				</div>
				<div class="row g-5">		
					<c:forEach items="${products.content }" var="product">
						<div class="col-md-6 wow slideInUp" data-wow-delay="0.3s">
							<div class="blog-item bg-light rounded overflow-hidden">
								<div class="blog-img position-relative overflow-hidden">
									<img class="img-fluid"
										src="/resources/img/${product.m_pimage }" alt=""> <a
										class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4"
										href="">Web Design</a>
								</div>
								<div class="p-4">
									<div class="d-flex mb-3">
										<small class="me-3"><i
											class="far fa-user text-primary me-2"></i>조회수 :
											${product.hitcount }</small> <small><i
											class="far fa-calendar-alt text-primary me-2"></i> 게시일 : <fmt:formatDate
												value="${product.m_regdate }" pattern="yyyy-MM-dd" /> </small>
									</div>
									<h4 class="mb-3">${product.mpname }</h4>
									<p>가격 : ${product.price }원</p>
									<a class="text-uppercase" href="/marketDetail/${product.mno }">자세히
										보기<i class="bi bi-arrow-right"></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-12 wow slideInUp" data-wow-delay="0.1s">

							<div class="d-flex justify-content-between mt-5 mr-auto bg-white">
								<ul class="pagination">
									<c:if test="${products.first==false }">
										<li class="page-item"><a class="page-link"
											href="?page=${products.number-1 }">이전</a></li>
									</c:if>
									<c:if test="${products.last==false }">
										<li class="page-item"><a class="page-link"
											href="?page=${products.number+1 }">다음</a></li>
									</c:if>
								</ul>
								<form class="form-inline">
									<div class="row">
										<div class="col-3">
											<select name="field" class="form-control mr-sm-1">
												<option value="mpname">제목</option>
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
	</div>