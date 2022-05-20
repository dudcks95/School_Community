<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/4headerSub.jsp"%>
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
							href="/mywrite"><i class="bi bi-arrow-right me-2"></i>내가 작성한
							글</a> <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
							href="/mycomment"><i class="bi bi-arrow-right me-2"></i>내가
							작성한 댓글</a> <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2"
							href="/mypage"><i class="bi bi-arrow-right me-2"></i>회원정보수정</a><a
							class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
							class="bi bi-arrow-right me-2"></i>Keyword Research</a> <a
							class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
							class="bi bi-arrow-right me-2"></i>Email Marketing</a>
					</div>
				</div>
				<!-- Category End -->
			</div>
			<div class="col-lg-9">
				<div
					class="section-title section-title-sm position-relative pb-3 mb-4">
					<h3 class="mb-0">회원정보수정</h3>
				</div>
				<div class="bg-light rounded p-5">
					<form>
					<input type="hidden" name="num" id="num" value="" />
						<div class="row g-3">
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="이름" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="text" class="form-control bg-white border-0"
									 style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="아이디" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="text" class="form-control bg-white border-0"
									placeholder="Enter username" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="비밀번호" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="password" class="form-control bg-white border-0"
									placeholder="Enter password" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="비밀번호 체크" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="password" class="form-control bg-white border-0"
									placeholder="Enter pwd_check" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="이메일" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Enter Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="전화번호" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="text" class="form-control bg-white border-0"
									placeholder="Enter phone" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0" disabled="disabled"
									placeholder="재학중인 학교" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="text" class="form-control bg-white border-0"
									placeholder="Enter shcoolname" style="height: 55px;">
							</div>
							<div class="form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="schoolgrade" checked="checked"
									id="schoolgrade" value="1"> 1학년
								</label> <label class="form-check-label"> <input type="radio"
									class="form-check-input" name="schoolgrade" id="schoolgrade"
									value="2"> 2학년
								</label> <label class="form-check-label"> <input type="radio"
									class="form-check-input" name="schoolgrade" id="schoolgrade"
									value="3"> 3학년
								</label> <label class="form-check-label"> <input type="radio"
									class="form-check-input" name="schoolgrade" id="schoolgrade"
									value="4"> 4학년
								</label>
							</div>
							<div class="col-4">
								<button class="btn btn-primary w-100 py-3" type="button" id="btnUpdate">
									수정하기</button>
							</div>
							<div class="col-4">
								<button class="btn btn-dark w-100 py-3" type="reset">
									취소하기</button>
							</div>
							<div class="col-4">
								<button class="btn btn-danger w-100 py-3" type="button" id="btnDelete">
									탈퇴하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
$("#btnDelete").click(function(){
	if(!confirm("정말 탈퇴하시겠습니까?")) return false;
	$.ajax({
		type:"delete",
		url:"/delete/${user.no}",
		success:function(resp){
			if(resp=="success"){
				alert("탈퇴성공")
				location.href="/login"
			}
		},
		error:function(){
			alert("탈퇴실패")
		}
	})
})
</script>
</div>

</body>
</html>