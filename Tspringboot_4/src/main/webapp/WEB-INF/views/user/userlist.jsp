<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/4headerSub.jsp"%>
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
					<div
						class="section-title section-title-sm position-relative pb-3 mb-4">
						<h3 class="mb-0">Categories</h3>
					</div>
					<div class="link-animated d-flex flex-column justify-content-start">
						<a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
							href="/myinfo/${user.userNo }"><i class="bi bi-arrow-right me-2"></i>회원리스트</a>
						<a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
							href="/mywrite/${user.userNo}"><i class="bi bi-arrow-right me-2"></i>커뮤니티</a>
						<a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
							href="/mycomment/${user.userNo}"><i
							class="bi bi-arrow-right me-2"></i>내가 작성한 댓글</a>
					</div>
				</div>
				<!-- Category End -->
			</div>
			<div class="col-lg-9">
				<div
					class="section-title section-title-sm position-relative pb-3 mb-4">
					<h3 class="mb-0">회원리스트(${count})</h3>
				</div>
				<div class="bg-white">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-num1 bg-light">번호</th>
								<th class="col-name bg-light">이름</th>
								<th class="col-username bg-light">아이디</th>
								<th class="col-email bg-light">이메일</th>
								<th class="col-phone bg-light">전화번호</th>
								<th class="col-schoolName bg-light">학교</th>
								<th class="col-delete bg-light">구분</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${users.content }" var="user" varStatus="st">
								<tr>
									<td class="col-num1">${rowNo-st.index}</td>
									<td class="col-name">${user.name }</td>
									<td class="col-username">${user.username }</td>
									<td class="col-email">${user.email }</td>
									<td class="col-phone">${user.phone }</td>
									<td class="col-schoolName">${user.school.schoolName }</td>
									<td class="col-delete" onclick="del('${user.userNo}')">삭제</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="d-flex justify-content-between mt-5 mr-auto bg-white">
						<ul class="pagination">
							<c:if test="${users.first==false }">
								<li class="page-item"><a class="page-link"
									href="?page=${users.number-1 }">이전</a></li>
							</c:if>
							<c:if test="${users.last==false }">
								<li class="page-item"><a class="page-link"
									href="?page=${users.number+1 }">다음</a></li>
							</c:if>
						</ul>
						<form class="form-inline" action="/userlist" method="get">
							<div class="row">
								<div class="col-3">
									<select name="field" class="form-control mr-sm-1">
										<option value="name">이름</option>
										<option value="username">아이디</option>
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
<script>
	function del(userNo) {
		if (confirm("정말 삭제할까요?")) {
			$.ajax({
				type : "delete",
				url : "/delete/" + userNo
			}).done(function(resp) {
				alert("삭제성공")
				location.href = "/userlist";
			}).fail(function(e) {
				alert("삭제실패")
			})
		}
	}
</script>