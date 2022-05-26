<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../includes/4headerSub.jsp" %>
		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
			<div class="row ">
				<div class="col-12 text-center"></div>
			</div>
		</div>
		<div class="container mt-5">
			<h1 align="center">회원가입</h1>
			<div class="rounded h-100 flex align-items-center p-5 wow" data-wow-delay="0.9s"
				style="width: 70%; margin: 0 auto">
				<div class="row g-3">
					<div class="col-sm-12">
						<label for="username">이름:</label> <input type="text" class="form-control bg-light border-0" id="name"
							name="name" placeholder="이름(name)" style="height: 55px;">
					</div>

					<div class="col-sm-10">
						<label for="username">아이디:</label> <input type="text" class="form-control bg-primary border-0" id="username"
							name="username" placeholder="아이디(username)" readonly="readonly" style="height: 55px;" disabled="disabled">
					</div>
					<div class="col-sm-2 align-self-end">
						<button class="btn btn-primary" id="idCheckBtn">중복확인</button>
					</div>


					<div class="col-sm-12">
						<label for="password">비밀번호:</label> <input type="password" class="form-control bg-light border-0"
							id="password" name="password" placeholder="비밀번호(password)" style="height: 55px;">
					</div>

					<div class="col-sm-12">
						<label for="pwd_check">비밀번호 체크:</label> <input type="password" class="form-control bg-light border-0"
							id="pwd_check" name="pwd_check" placeholder="비밀번호 체크(pwd_check)" style="height: 55px;">
					</div>

					<div class="col-sm-12">
						<label for="email">이메일:</label> <input type="text" class="form-control bg-light border-0" id="email"
							name="email" placeholder="이메일(email)" style="height: 55px;">
					</div>

					<div class="col-sm-12">
						<label for="phone">전화번호:</label> <input type="text" class="form-control bg-light border-0" id="phone"
							name="phone" placeholder="전화번호(phone)" style="height: 55px;">
					</div>

					<div class="col-sm-12">
						<label for="schoolName">재학중인 학교:</label> <select class="form-control bg-light border-0" id="schoolId"
							name="schoolId" style="height: 55px;">
							<c:forEach items="${schools}" var="school">
								<option value="${school.schoolId }">${school.schoolName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="schoolgrade"
								checked="checked" id="schoolgrade" value="1"> 1학년
						</label> <label class="form-check-label"> <input type="radio" class="form-check-input" name="schoolgrade"
								id="schoolgrade" value="2"> 2학년
						</label> <label class="form-check-label"> <input type="radio" class="form-check-input" name="schoolgrade"
								id="schoolgrade" value="3"> 3학년
						</label> <label class="form-check-label"> <input type="radio" class="form-check-input" name="schoolgrade"
								id="schoolgrade" value="4"> 4학년
						</label>
					</div>
					<br /> <br />
					<div class="col-xl-12">
						<button class="btn btn-dark w-100 py-3" id="btnJoin">회원가입</button>
					</div>
				</div>
			</div>
			<script>
				$("#btnJoin").click(function () {
					var tel = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
					var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
					if ($("#name").val() == "") {
						alert("이름을 입력하세요.")
						$("#name").focus();
						return false;
					}
					if ($("#username").val() == "") {
						alert("아이디를 입력하세요.")
						$("#username").focus();
						return false;
					}
					if ($("#password").val() == "") {
						alert("비밀번호를 입력하세요.")
						$("#password").focus();
						return false;
					}
					if ($("#password").val() != $("#pwd_check").val()) {
						alert("비밀번호가 일치하지 않습니다.")
						$("#pwd_check").focus();
						return false;
					}
					if ($("#email").val() == "") {
						alert("이메일을 입력하세요.")
						$("#email").focus();
						return false;
					}
					if (!$("#email").val().match(mail)) {
						alert("이메일 형식이 아닙니다.")
						$("#email").focus();
						return false;
					}
					if ($("#phone").val() == "") {
						alert("전화번호를 입력하세요.")
						$("#phone").focus();
						return false;
					}
					if (!$("#phone").val().match(tel)) {
						alert("전화번호 형식이 아닙니다.")
						$("#phone").focus();
						return false;
					}
					var data = {
						"name": $("#name").val(),
						"username": $("#username").val(),
						"password": $("#password").val(),
						"pwd_check": $("#pwd_check").val(),
						"email": $("#email").val(),
						"phone": $("#phone").val(),
						"school": {
							"schoolId": $("#schoolId").val()
						},
						"schoolgrade": $("input:radio[name='schoolgrade']:checked").val()
					}
					$.ajax({
						type: "POST",
						url: "/join",
						contentType: "application/json;charset=utf-8",
						data: JSON.stringify(data)
					}).done(function (resp) {
						if (resp == "success") {
							alert("회원가입 성공")
							location.href = "/login"
						}
					}).fail(function () {
						alert("회원가입 실패")
					})
				})
				$("#idCheckBtn").click(function () {
					window.open("idCheck", "", "width=600 height=300");
				})
			</script>
		</div>