<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../includes/4headerSub.jsp" %>
		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
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
							<%@ include file="../includes/categori.jsp" %>
						</div>
						<!-- Category End -->
					</div>
					<div class="col-lg-9">
						<div class="section-title section-title-sm position-relative pb-3 mb-4">
							<h3 class="mb-0">회원정보수정</h3>
						</div>
						<div class="bg-light rounded p-5">
							<form>
								<input type="hidden" name="userNo" id="userNo" value="${user.userNo }" />
								<div class="row g-3">
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="이름"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="text" class="form-control bg-white border-0" id="name" name="name"
											value="${user.name }" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="아이디"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="text" class="form-control bg-white border-0" id="username" name="username"
											value="${user.username }" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="비밀번호"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="password" class="form-control bg-white border-0" id="password" name="password"
											placeholder="Enter password" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="비밀번호 체크"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="password" class="form-control bg-white border-0" id="pwd_check" name="pwd_check"
											placeholder="Enter pwd_check" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="이메일"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="email" class="form-control bg-white border-0" id="email" name="email"
											value="${user.email }" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="전화번호"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="text" class="form-control bg-white border-0" id="phone" name="phone"
											value="${user.phone }" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-3">
										<input type="text" class="form-control bg-light border-0" disabled="disabled" placeholder="학교"
											readonly="readonly" style="height: 55px;">
									</div>
									<div class="col-12 col-sm-9">
										<input type="text" class="form-control bg-white border-0" id="schoolName" name="schoolName"
											value="${user.school.schoolName }" style="height: 55px;" disabled="disabled">
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input type="radio" class="form-check-input" name="schoolgrade"
												id="schoolgrade" value="1"> 1학년
										</label> <label class="form-check-label"> <input type="radio" class="form-check-input"
												name="schoolgrade" id="schoolgrade" value="2"> 2학년
										</label> <label class="form-check-label"> <input type="radio" class="form-check-input"
												name="schoolgrade" id="schoolgrade" value="3"> 3학년
										</label> <label class="form-check-label"> <input type="radio" class="form-check-input"
												name="schoolgrade" id="schoolgrade" value="4"> 4학년
										</label>
									</div>
									<div class="col-4">
										<button class="btn btn-primary w-100 py-3" type="button" id="btnUpdate">수정하기</button>
									</div>
									<div class="col-4">
										<button class="btn btn-dark w-100 py-3" type="reset">
											취소하기</button>
									</div>
									<div class="col-4">
										<button class="btn btn-danger w-100 py-3" type="button" id="btnDelete">탈퇴하기</button>
									</div>
								</div>
								<!-- Category End -->
						</div>

					</div>
				</div>
			</div>
		</div>
		<script>
			if (${ user.schoolgrade == 1 }) {
				$("input:radio[value=1]").attr("checked", true)
			}else if (${ user.schoolgrade == 2 }) {
				$("input:radio[value=2]").attr("checked", true)
			}else if (${ user.schoolgrade == 3 }) {
				$("input:radio[value=3]").attr("checked", true)
			}else {
				$("input:radio[value=4]").attr("checked", true)
			}

			$("#btnUpdate").click(function () {
				var tel = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
				var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if ($("#password").val() != $("#pwd_check").val()) {
					alert("비밀번호가 일치하지 않습니다.")
					$("#pwd_check").focus();
					return false;
				}
				if (!$("#email").val().match(mail)) {
					alert("이메일 형식이 아닙니다.")
					$("#email").focus();
					return false;
				}
				if (!$("#phone").val().match(tel)) {
					alert("전화번호 형식이 아닙니다.")
					$("#phone").focus();
					return false;
				}
				var data = {
					"userNo": $("#userNo").val(),
					"name": $("#name").val(),
					"username": $("#username").val(),
					"password": $("#password").val(),
					"pwd_check": $("#pwd_check").val(),
					"email": $("#email").val(),
					"phone": $("#phone").val(),
					/* "school": {
						"schoolId": $("#schoolName").val()
					}, */
					"schoolgrade": $(
						"input:radio[name='schoolgrade']:checked")
						.val()
				}
				$.ajax({
					type: "put",
					url: "/update",
					contentType: "application/json;charset=utf-8",
					data: JSON.stringify(data),
					success: function (resp) {
						alert("수정완료")
						location.href = "/mywrite/${user.userNo}";
					},
					error: function () {
						alert("수정실패")
					}
				})

			})
			$("#btnDelete").click(function () {
				if (!confirm("정말 탈퇴하시겠습니까?"))
					return false;
				$.ajax({
					type: "delete",
					url: "/delete/${user.userNo}",
					success: function (resp) {
						if (resp == "success") {
							alert("탈퇴성공")
							location.href = "/logout"
						}
					},
					error: function () {
						alert("탈퇴실패")
					}
				})
			})
		</script>