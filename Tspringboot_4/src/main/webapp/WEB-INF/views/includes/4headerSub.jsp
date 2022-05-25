<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Startup - Startup Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">
<head>
<meta charset="UTF-8">
<title>Startup - Startup Website Template</title>
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

<!-- Libraries Stylesheet -->
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/animate/animate.min.css" rel="stylesheet">

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
					<small class="me-3 text-light"><i
						class="fa fa-map-marker-alt me-2"></i>123 Street, New York, USA</small> <small
						class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>+012
						345 6789</small> <small class="text-light"><i
						class="fa fa-envelope-open me-2"></i>info@example.com</small>
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

	<!-- Navbar Start -->
	<div class="container-fluid position-relative p-0">
		<nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
			<a href="index.html" class="navbar-brand p-0">
				<h1 class="m-0">
					<i class="fa fa-user-tie me-2"></i>Startup
				</h1>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto py-0">
					<a href="/" class="nav-item nav-link">Home</a>
					<div class="nav-item dropdown">
						<a href="/boardList" class="nav-item nav-link"
							data-bs-toggle="dropdown">게시판</a>
						<div class="dropdown-menu m-0">
							<a href="" class="dropdown-item">자유 게시판</a> <a href=""
								class="dropdown-item">xx 게시판</a>
						</div>
					</div>
					<a href="/marketInsert" class="nav-item nav-link">장터</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
						<div class="dropdown-menu m-0">
							<a href="blog.html" class="dropdown-item">Blog Grid</a> <a
								href="detail.html" class="dropdown-item">Blog Detail</a>
						</div>
					</div>
					<a href="contact.html" class="nav-item nav-link">시간표</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Pages</a>
						<div class="dropdown-menu m-0">
							<a href="price.html" class="dropdown-item">Pricing Plan</a> <a
								href="feature.html" class="dropdown-item">Our features</a> <a
								href="team.html" class="dropdown-item">Team Members</a> <a
								href="testimonial.html" class="dropdown-item">Testimonial</a> <a
								href="quote.html" class="dropdown-item">Free Quote</a>
						</div>
					</div>
					<a href="contact.html" class="nav-item nav-link">Contact</a>
				</div>
				<butaton type="button" class="btn text-primary ms-3"
					data-bs-toggle="modal" data-bs-target="#searchModal"> <i
					class="fa fa-search"></i> </butaton>
			</div>
			<sec:authorize access="hasRole('ADMIN')">
				<a href="/boardList" class="nav-item nav-link">회원관리</a>
			</sec:authorize>
			<sec:authorize access="hasRole('USER')">
				<a href="/boardInsert" class="nav-item nav-link">회원전용</a>
			</sec:authorize>
			<butaton type="button" class="btn text-primary ms-3"
				data-bs-toggle="modal" data-bs-target="#searchModal"> <i
				class="fa fa-search"></i> </butaton>

			<butaton type="button" class="btn text-primary ms-3"
				data-bs-toggle="modal" data-bs-target="#searchModal"> <i
				class="fa fa-search"></i> </butaton>
			<sec:authorize access="isAnonymous()">
				<a class="nav-item nav-link" href="/login">로그인</a>
				<a class="nav-item nav-link" href="/join">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a class="nav-item nav-link"
					href="/myinfo/${principal.user.userNo }">마이페이지</a>
				<a class="nav-item nav-link" href="/logout">로그아웃
					(${principal.user.name}님)</a>
			</sec:authorize>

		</nav>
	</div>


	<!-- <div class="container-fluid bg-primary py-5 bg-header"
			style="margin-bottom: 90px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
					<h1 class="display-4 text-white animated zoomIn">Free Quote</h1>
					<a href="" class="h5 text-white">Home</a> <i
						class="far fa-circle text-white px-2"></i> <a href=""
						class="h5 text-white">Free Quote</a>
				</div>
			</div>
		</div> -->