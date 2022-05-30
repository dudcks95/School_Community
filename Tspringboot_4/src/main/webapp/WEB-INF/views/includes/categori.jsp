<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="section-title section-title-sm position-relative pb-3 mb-4">
		<h3 class="mb-0">Categories</h3>
	</div>
	<div class="link-animated d-flex flex-column justify-content-start">
		<a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
			href="/myinfo/${principal.user.userNo }"><i
			class="bi bi-arrow-right me-2"></i>회원정보수정</a> <a
			class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
			href="/mywrite/${principal.user.userNo }"><i
			class="bi bi-arrow-right me-2"></i>내가 작성한 글</a> <a
			class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
			href="/mycomment/${principal.user.userNo }"><i
			class="bi bi-arrow-right me-2"></i>내가 작성한 댓글</a><a
			class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
			href="/mymarket/${principal.user.userNo }"><i
			class="bi bi-arrow-right me-2"></i>나의 장터</a> 
	</div>
</body>

</html>