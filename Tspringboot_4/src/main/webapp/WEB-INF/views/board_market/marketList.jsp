<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>

			<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 45px;">
				<div class="row py-5">
					<div class="col-12 pt-lg-5 mt-lg-5 text-center">
						<h1 class="display-4 text-white animated zoomIn">장터(${count })</h1>
						<a href="" class="h5 text-white">ㄴㄴㄴㄴ</a> <i class="far fa-circle text-white px-2"></i> <a href=""
							class="h5 text-white">ㄷㄷㄷㄷㄷ</a>
					</div>
				</div>
			</div>

			<head>

			</head>

			<body>









				<!-- Full Screen Search Start -->
				<div class="modal fade" id="searchModal" tabindex="-1">
					<div class="modal-dialog modal-fullscreen">
						<div class="modal-content" style="background: rgba(9, 30, 62, .7);">
							<div class="modal-header border-0">
								<button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body d-flex align-items-center justify-content-center">
								<div class="input-group" style="max-width: 600px;">
									<input type="text" class="form-control bg-transparent border-primary p-3"
										placeholder="Type search keyword">
									<button class="btn btn-primary px-4">
										<i class="bi bi-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Full Screen Search End -->


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
													<img class="img-fluid" src="/resources/img/${product.m_pimage }" alt=""> <a
														class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4"
														href="">Web Design</a>
												</div>
												<div class="p-4">
													<div class="d-flex mb-3">
														<small class="me-3"><i class="far fa-user text-primary me-2"></i>조회수 :
															${product.m_hitcount }</small> <small><i
																class="far fa-calendar-alt text-primary me-2"></i> 게시일 :
															<fmt:formatDate value="${product.m_regdate }" pattern="yyyy-MM-dd" />
														</small>
													</div>
													<h4 class="mb-3">${product.m_pname }</h4>
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
													<li class="page-item"><a class="page-link" href="?page=${products.number-1 }">이전</a></li>
												</c:if>
												<c:if test="${products.last==false }">
													<li class="page-item"><a class="page-link" href="?page=${products.number+1 }">다음</a></li>
												</c:if>
											</ul>
											<form class="form-inline" action="/boardList" method="get">
												<div class="row">
													<div class="col-3">
														<select name="field" class="form-control mr-sm-1">
															<option value="m_pname">제목</option>
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

										<button type="button" class="btn btn-info mt-3" onclick="location.href='marketInsert'">물건
											올리기</button>
									</div>
								</div>
							</div>
							<!-- Blog list End -->

							<!-- Sidebar Start -->
							<div class="col-lg-4">
								<!-- Search Form Start -->
								<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
									<div class="input-group">
										<input type="text" class="form-control p-3" placeholder="Keyword">
										<button class="btn btn-primary px-4">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</div>
								<!-- Search Form End -->

								<!-- Recent Post Start -->
								<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
									<div class="section-title section-title-sm position-relative pb-3 mb-4">
										<h3 class="mb-0">인기 판매 글</h3>
									</div>
									<c:forEach items="${hits }" var="hit">
										<div class="d-flex rounded overflow-hidden mb-3">
											<!-- <img class="img-fluid" src="img/blog-1.jpg" style="width: 100px; height: 100px; object-fit: cover;" alt=""> -->
											<!-- <a href="" class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0">Lorem ipsum dolor sit amet adipis elit </a> -->
											${hit.m_pname }
										</div>
									</c:forEach>

								</div>
								<!-- Recent Post End -->

								<!-- Category Start -->
								<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
									<div class="section-title section-title-sm position-relative pb-3 mb-4">
										<h3 class="mb-0">Categories</h3>
									</div>
									<div class="link-animated d-flex flex-column justify-content-start">
										<a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
												class="bi bi-arrow-right me-2"></i>Web Design</a> <a
											class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
												class="bi bi-arrow-right me-2"></i>Web Development</a> <a
											class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
												class="bi bi-arrow-right me-2"></i>Web Development</a> <a
											class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
												class="bi bi-arrow-right me-2"></i>Keyword Research</a> <a
											class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
												class="bi bi-arrow-right me-2"></i>Email Marketing</a>
									</div>
								</div>
								<!-- Category End -->



								<!-- Image Start -->
								<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
									<img src="img/blog-1.jpg" alt="" class="img-fluid rounded">
								</div>
								<!-- Image End -->

								<!-- Tags Start -->
								<div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
									<div class="section-title section-title-sm position-relative pb-3 mb-4">
										<h3 class="mb-0">Tag Cloud</h3>
									</div>
									<div class="d-flex flex-wrap m-n1">
										<a href="" class="btn btn-light m-1">Design</a> <a href="" class="btn btn-light m-1">Development</a>
										<a href="" class="btn btn-light m-1">Marketing</a> <a href="" class="btn btn-light m-1">SEO</a> <a
											href="" class="btn btn-light m-1">Writing</a> <a href="" class="btn btn-light m-1">Consulting</a>
										<a href="" class="btn btn-light m-1">Design</a> <a href="" class="btn btn-light m-1">Development</a>
										<a href="" class="btn btn-light m-1">Marketing</a> <a href="" class="btn btn-light m-1">SEO</a> <a
											href="" class="btn btn-light m-1">Writing</a> <a href="" class="btn btn-light m-1">Consulting</a>
									</div>
								</div>
								<!-- Tags End -->


							</div>
							<!-- Sidebar End -->
						</div>
					</div>
				</div>
				<!-- Blog End -->




				<!-- Back to Top -->
				<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>

			</body>

			</html>