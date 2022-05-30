<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerSub.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<div class="container-fluid bg-primary py-5 bg-header"
	style="margin-bottom: 45px;">
	<div class="row py-5">
		<div class="col-12 pt-lg-5 mt-lg-5 text-center">
			<h1 class="display-4 text-white animated zoomIn">장터 게시판</h1>
			<sec:authorize access="hasRole('USER')">
			<a class="h5 text-white"><${principal.user.school.schoolName }></a>
			</sec:authorize>
			<sec:authorize access="hasRole('ADMIN')">
			<a class="h5 text-white"><관리자입니다></a>
			</sec:authorize>
			<!-- <i
				class="far fa-circle text-white px-2"></i> <a href=""
				class="h5 text-white">ㄷㄷㄷㄷㄷ</a> -->
		</div>
	</div>
</div>





	<!-- Blog Start -->
	<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<!-- Blog list Start -->
				<div class="col-lg-8">
					<div class="row g-5">
						<c:forEach items="${products.content }" var="product">
							<div class="col-md-6 wow slideInUp" data-wow-delay="0.3s">
								<div class="blog-item bg-light rounded overflow-hidden">
									<div class="blog-img position-relative overflow-hidden">
										<img class="img-fluid"
											src="/resources/img/${product.m_pimage }" alt=""> <a
											class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4"
											href="">판매</a>
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
						<!-- Blog list End -->

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
							</div>
							<button type="button" class="btn btn-info mt-3"
								onclick="location.href='marketInsert'">물건 올리기</button>
						</div>
					</div>
				</div>
			
				<!-- Blog list End -->

				<!-- Sidebar Start -->
				<div class="col-lg-4">
					<!-- Search Form Start -->
					<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
						<form action="/marketList">
							<div class="input-group">
								<select name="field" class="form-control mr-sm-1">
									<option value="mpname">제목</option>
								</select> <input type="text" class="form-control p-3" name="word"
									placeholder="Keyword" style="width: 60%">
								<button class="btn btn-primary px-4">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</form>
					</div>
					<!-- Search Form End -->

					<!-- 인기 판매글 시작 -->
					<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
						<div
							class="section-title section-title-sm position-relative pb-3 mb-4">
							<h3 class="mb-0">인기 판매 글</h3>
						</div>
						<c:forEach items="${hits }" var="hit" end="2"
							varStatus="num">
							<div class="d-flex rounded overflow-hidden mb-3">
								<img class="img-fluid" src="/resources/img/${hit.m_pimage }"
									style="width: 100px; height: 100px; object-fit: cover;" alt="">

								<a href="/marketDetail/${hit.mno }"
									class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0"
									style="width: 300px; height: 100px;"> ${num.count }위 /
									${hit.mpname } <br> <br> ${hit.price } 원
								</a>
							</div>
						</c:forEach>



					</div>
					<!-- Sidebar End -->
				</div>
			</div>
		</div>
		<!-- Blog End -->




		<!-- Back to Top -->
		<a href="#"
			class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i
			class="bi bi-arrow-up"></i></a>


</html>