<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
		<!DOCTYPE html>


		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 30px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
			<h1 class="display-4 text-white animated zoomIn">장터 게시판</h1>
			<sec:authorize access="hasRole('USER')">
			<a class="h5 text-white"><${principal.user.school.schoolName }></a>
			</sec:authorize>
			<sec:authorize access="hasRole('ADMIN')">
			<a class="h5 text-white"><관리자입니다></a>
			</sec:authorize>
		</div>
			</div>
		</div>



		<!-- Full Screen Search Start -->
		<div class="modal fade" id="searchModal" tabindex="-1">
			<div class="modal-dialog modal-fullscreen">
				<div class="modal-content" style="background: rgba(9, 30, 62, .7);">
					<div class="modal-header border-0">
						<button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body d-flex align-items-center justify-content-center">
						<div class="input-group" style="max-width: 600px;">
							<input type="text" class="form-control bg-transparent border-primary p-3"
								placeholder="Type search keyword">
							<button class="btn btn-primary px-4">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Full Screen Search End -->


		<!-- Contact Start -->
		<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container py-5">

				<!-- 입력창과 지도 쪽  -->
				<div class="row g-5">
					<div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s">
						<%-- <img src="/resources/img/${product.m_pimage }" alt=""> --%>
							<div class="blog-img position-relative overflow-hidden">
								<img class="img-fluid" src="/resources/img/${product.m_pimage }" alt="">

							</div>
					</div>
					<div class="col-lg-6 wow slideInUp" data-wow-delay="0.3s">
						<input type="hidden" id="mno" name="mno" />
						<form>
							<div class="row g-3">
								<div class="col-2">
									<input type="text" class="form-control border-0 bg-white" value="상품명:" style="height: 55px;"
										disabled="disabled">
								</div>
								<div class="col-10">
									<input type="text" class="form-control border-0 bg-light px-4" value="${product.mpname }"
										style="height: 55px;" disabled="disabled">
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control border-0 bg-white px-4" value="가격:" style="height: 55px;"
										disabled="disabled">
								</div>

								<div class="col-md-4">
									<input type="text" class="form-control border-0 bg-light px-4" value="${product.price }원"
										style="height: 55px;" disabled="disabled">
								</div>

								<div class="col-md-2">
									<input type="text" class="form-control border-0 bg-white" value="판매자:" style="height: 55px;"
										disabled="disabled">
								</div>

								<div class="col-md-4">
									<input type="text" class="form-control border-0 bg-light px-4" value="${product.m_writer }"
										style="height: 55px;" disabled="disabled">
								</div>

								<div class="col-md-2">
									<input type="text" class="form-control border-0 bg-white px-4" value="설명:" style="height: 55px;"
										disabled="disabled">
								</div>

								<div class="col-md-10">
									<input type="text" class="form-control border-0 bg-light px-4" value="${product.m_pcontent }"
										style="height: 110px;" disabled="disabled">
								</div>
								<div class="col-7"></div>
								<c:if test="${principal.user.name== product.m_writer }">
								<div class="col-5">
									<button type="button" class="btn btn-primary" id="btnUpdate">글
										수정</button>
									<button type="button" class="btn btn-danger" id="btnDelete">글
										삭제</button>
									<button type="button" class="btn btn-secondary" id="btnList">글
										목록</button>
								</div>
								</c:if>
							</div>
						</form>
					</div>

				</div>
				<!-- 입력창과 지도 끝 -->

				<div class="mt-5" align="center">
					<textarea rows="3" cols="70" id="msg"></textarea>
					<button type="button" class="btn btn-info btn-sm " id="btnMcomment" style="margin: 0 0 25px 0">댓글쓰기</button>
				</div>
				<div id="replyResult" style="margin: 0 60px"></div>
			</div>
		</div>
		<!-- Contact End -->

		<script>
			$("#btnUpdate").click(function () {
				if (confirm("수정화면으로 이동할까요?")) {
					location.href = "/marketUpdate/${product.mno}"
				}
			})

			$("#btnDelete").click(function () {
				if (!confirm("삭제 하시겠습니까?")) return
				$.ajax({
					type: "delete",
					url: "/marketDelete/${product.mno}",
					success: function (resp) {
						if (resp == "success") {
							alert("삭제성공")
							location.href = "/marketList"
						}
					},
					error: function (e) {
						alert("삭제 실패" + e)
					}
				})
			})

			$("#btnList").click(function () {
				location.href = "/marketList"
			})
			//댓글추가
			var init = function () {
				$.ajax({
					type: "get",
					url: "/mreply/list/${product.mno}"
				})
					.done(function (resp) {
						var str = "<table class='table table-condensed'><tr><th class='col-name'>이름</th><th class='col-ccontent'>내용</th><th class='col-cregdate'>날짜</th><th class='col-name'>구분</th></tr>"
						$.each(resp, function (key, val) {
							str += "<tr>"
							str += "<td class='col-name'>" + val.user.name + "</td>"
							str += "<td class='col-ccontent'>" + val.m_c_content + "</td>"
							str += "<td class='col-cregdate'>" + val.m_c_regdate + "</td>"
							if ("${principal.user.username}" == val.user.username) {
								str += "<td class='col-name'><a href='javascript:mdel(" + val.m_cnum + ")'>삭제</a></td>"
							} else {
								str += "<td class='col-name'></td>"
							}
							str += "</tr>"
						})
						str += "</table>"
						$("#replyResult").html(str);
					})
				$("#btnMcomment").click(function () {
					if (${empty principal.user }){
					alert("로그인 하세요")
					location.href = "/login";
					return;
				}
				var data = {
					"m_bnum": $("#mno").val(),
					"m_c_content": $("#msg").val()
				}
				$.ajax({
					type: "POST",
					url: "/mreply/insert/${product.mno}",
					contentType: "application/json;charset=utf-8",
					data: JSON.stringify(data)
				})
					.done(function (resp) {
						alert("댓글추가성공")
						$("#msg").val("")
						init();
					})
					.fail(function () {
						alert("댓글추가실패")
					})
			})
					
			}

			init();

			//댓글삭제
			function mdel(m_cnum) {
				$.ajax({
					type: "delete",
					url: "/mreply/delete/" + m_cnum
				})
					.done(function (resp) {
						alert(resp + "번 댓글 삭제완료")
						init()
					})
					.fail(function () {
						alert("댓글삭제살패")
					})
			}
		</script>

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>