<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
				<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			</head>
			<sec:authorize access="isAuthenticated()">
				<!-- 인증받게 되면 -->
				<sec:authentication property="principal" var="principal" />
			</sec:authorize>

			<body>
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
					<div class="container">
						<a class="navbar-brand" href="/">Logo</a>

						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="boardList">게시판</a>
							</li>
							<li class="nav-item active"><a class="nav-link" href="#">장터</a>
							</li>
							<li class="nav-item active"><a class="nav-link" href="#">시간표</a>
							</li>
							<sec:authorize access="hasRole('ADMIN')">
								<li class="nav-item active"><a class="nav-link" href="/user/userList">회원관리</a>
								</li>
							</sec:authorize>
						</ul>

						<sec:authorize access="isAnonymous()">
							<ul class="navbar-nav">
								<li class="nav-item active"><a class="nav-link" href="/join">회원가입</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
							</ul>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<ul class="navbar-nav">
								<li class="nav-item active"><a class="nav-link" href="/join">회원가입</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
							</ul>
						</sec:authorize>
					</div>
				</nav>
			</body>

			</html>