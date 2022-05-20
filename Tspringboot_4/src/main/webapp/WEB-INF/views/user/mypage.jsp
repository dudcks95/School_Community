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
							href="#"><i class="bi bi-arrow-right me-2"></i>회원정보수정</a> <a
							class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
							class="bi bi-arrow-right me-2"></i>내가 작성한 글</a> <a
							class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
							class="bi bi-arrow-right me-2"></i>내가 작성한 댓글</a> <a
							class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
							class="bi bi-arrow-right me-2"></i>Keyword Research</a> <a
							class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i
							class="bi bi-arrow-right me-2"></i>Email Marketing</a>
					</div>
				</div>
				<!-- Category End -->
			</div>
			<div class="col-lg-9">
				<!-- Comment Form Start -->
				<div
					class="section-title section-title-sm position-relative pb-3 mb-4">
					<h3 class="mb-0">회원정보수정</h3>
				</div>
				<div class="bg-light rounded p-5">
					<form>
						<div class="row g-3">
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="이름" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="아이디" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="비밀번호" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="비밀번호 체크" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="이메일" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="전화번호" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-3">
								<input type="text" class="form-control bg-light border-0"
									placeholder="재학중인 학교" readonly="readonly" style="height: 55px;">
							</div>
							<div class="col-12 col-sm-9">
								<input type="email" class="form-control bg-white border-0"
									placeholder="Your Email" style="height: 55px;">
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
							<div class="col-6">
								<button class="btn btn-primary w-100 py-3" type="submit">
									수정하기</button>
							</div>
							<div class="col-6">
								<button class="btn btn-danger w-100 py-3" type="submit">
									삭제하기</button>
							</div>
						</div>
					</form>
				</div>
				<!-- Comment Form End -->
			</div>
		</div>
	</div>
</div>

</body>
</html>