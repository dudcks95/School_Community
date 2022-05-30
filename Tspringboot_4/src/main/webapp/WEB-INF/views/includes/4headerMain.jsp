<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<title>University Community</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="/src/main/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/animate/animate.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>


<sec:authorize access="isAuthenticated()">
	<!-- 인증받게 되면 -->
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<body>


	<!-- Topbar Start -->
	<div class="container-fluid bg-dark px-5 d-none d-lg-block">
		<div class="row gx-0">
			<div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
				<div class="d-inline-flex align-items-center" style="height: 45px;">
					<small class="me-3 text-light"><i class="fa fa-map-marker-alt me-2"></i>부산시 부산진구 부전동
									</small> <small class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>010-1111-1111</small> <small class="text-light"><i
										class="fa fa-envelope-open me-2"></i>example@naver.com</small>
				</div>
			</div>
			<div class="col-lg-4 text-center text-lg-end">
				<div class="d-inline-flex align-items-center" style="height: 45px;">
					<a
						class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
						href=""><i class="fab fa-twitter fw-normal"></i></a> <a
						class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
						href=""><i class="fab fa-facebook-f fw-normal"></i></a> <a
						class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
						href=""><i class="fab fa-linkedin-in fw-normal"></i></a> <a
						class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
						href=""><i class="fab fa-instagram fw-normal"></i></a> <a
						class="btn btn-sm btn-outline-light btn-sm-square rounded-circle"
						href=""><i class="fab fa-youtube fw-normal"></i></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar & Carousel Start -->
	<div class="container-fluid position-relative p-0">
		<nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
			<a href="/" class="navbar-brand p-0">
				<h1 class="m-0">
					<i class="fa fa-user-tie me-2"></i>University Community
				</h1>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav lf-auto py-0">
				<sec:authorize access="hasRole('USER')">
					<a href="${principal.user.school.adres }" class="nav-item nav-link"><${principal.user.school.schoolName
						} 사이트로 이동></a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="nav-item dropdown">
						<a href="" class="nav-item nav-link" data-bs-toggle="dropdown">게시판</a>
						<div class="dropdown-menu m-0">
							<a href="/boardList" class="dropdown-item">전체 게시판</a> <a
								href="/boardList/자유" class="dropdown-item">자유 게시판</a> <a
								href="/boardList/동아리" class="dropdown-item">동아리 게시판</a> <a
								href="/boardList/취미" class="dropdown-item">취미 게시판</a>
						</div>
					</div>
					<a href="/marketList" class="nav-item nav-link">장터</a>
					</sec:authorize>
				</div>
			</div>
			
			<sec:authorize access="hasRole('ADMIN')">
			<div class="navbar-nav ms-auto py-0">
				<a href="/userlist" class="nav-item nav-link">회원관리</a>
				</div>
			</sec:authorize>




			<sec:authorize access="isAnonymous()">
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto py-0">
				<a class="nav-item nav-link" href="/login">로그인</a>
				<a class="nav-item nav-link" href="/join">회원가입</a>
				</div>
			</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div class="navbar-nav ms-auto py-0">
				<a class="nav-item nav-link"
					href="/myinfo/${principal.user.userNo }">마이페이지</a>
				<a class="nav-item nav-link" href="/logout">로그아웃
					(${principal.user.name}님)</a>
				</div>
			</sec:authorize>
		</nav>

		<div id="header-carousel" class="carousel slide carousel-fade"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100" src="img/carousel-1.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 900px;">
							<sec:authorize access="isAnonymous()">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">어서오세요!</h5>
							</sec:authorize>
							<sec:authorize access="hasRole('USER')">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">어서오세요!
									${principal.user.school.schoolName } 학생 ${principal.user.name}
									님</h5>
							</sec:authorize>
							<h1 class="display-1 text-white mb-md-4 animated zoomIn">University
								Community</h1>
							<sec:authorize access="isAnonymous()">
								<a href="/login"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">로그인</a>
								<a href="/join"
									class="btn btn-outline-light py-md-3 px-md-5 animated slideInRight">회원가입</a>
							</sec:authorize>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="img/carousel-2.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 900px;">
							<sec:authorize access="isAnonymous()">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">어서오세요!</h5>
							</sec:authorize>
							<sec:authorize access="hasRole('USER')">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">어서오세요!
									${principal.user.school.schoolName } 학생 ${principal.user.name}
									님</h5>
							</sec:authorize>

							<h1 class="display-1 text-white mb-md-4 animated zoomIn">University
								Community</h1>
							<sec:authorize access="isAnonymous()">
								<a href="/login"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">로그인</a>
								<a href="/join"
									class="btn btn-outline-light py-md-3 px-md-5 animated slideInRight">회원가입</a>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Navbar & Carousel End -->






	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</html>