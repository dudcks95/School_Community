<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerMain.jsp"%>
<!DOCTYPE html>
<html>

<head>



</head>

<body>
	<!-- 회원, 게시글, 학교 수 출력부분 시작 -->
	<div class="container-fluid facts py-5 pt-lg-0">
		<div class="container py-5 pt-lg-0">
			<div class="row gx-0">
				<div class="col-lg-4 wow zoomIn" data-wow-delay="0.1s">
					<div
						class="bg-primary shadow d-flex align-items-center justify-content-center p-4"
						style="height: 150px;">
						<div
							class="bg-white d-flex align-items-center justify-content-center rounded mb-2"
							style="width: 60px; height: 60px;">
							<i class="fa fa-users text-primary"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-white mb-0">총 회원 수</h5>
							<h1 class="text-white mb-0" data-toggle="counter-up">${usercount }</h1>
						</div>
					</div>
				</div>
				<div class="col-lg-4 wow zoomIn" data-wow-delay="0.3s">
					<div
						class="bg-light shadow d-flex align-items-center justify-content-center p-4"
						style="height: 150px;">
						<div
							class="bg-primary d-flex align-items-center justify-content-center rounded mb-2"
							style="width: 60px; height: 60px;">
							<i class="fa fa-check text-white"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-primary mb-0">총 게시글 수</h5>
							<h1 class="mb-0" data-toggle="counter-up">${boardcount }</h1>
						</div>
					</div>
				</div>
				<div class="col-lg-4 wow zoomIn" data-wow-delay="0.6s">
					<div
						class="bg-primary shadow d-flex align-items-center justify-content-center p-4"
						style="height: 150px;">
						<div
							class="bg-white d-flex align-items-center justify-content-center rounded mb-2"
							style="width: 60px; height: 60px;">
							<i class="fa fa-award text-primary"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-white mb-0">등록 학교 수</h5>
							<h1 class="text-white mb-0" data-toggle="counter-up">${schoolcount }</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원, 게시글, 학교 수 출력부분 끝 -->

</body>

</html>