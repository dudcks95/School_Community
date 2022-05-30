<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
					<h1 class="display-4 text-white animated zoomIn">게시판</h1>
				</div>
			</div>
		</div>
		<!DOCTYPE html>
		<html>


		<body>
			<div class="container">
				<div class="bg-white">
					<input type="hidden" id="no" name="no" />
					<table class="table table-condensed">
						<thead>
							<tr>
								<td colspan="2">글제목: ${board.title}</td>
								<td class="col-hitcount2">조회수 : ${board.hitcount }</td>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td>작성자 : ${board.writer}</td>
								<td class="col-regdate2">작성일 : ${board.regdate}</td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3">내용 : ${board.content }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div align="right">
						<c:if test="${principal.user.name== board.writer }">
						<button class="btn btn-info" type="button" id="btnUpdate">글
							수정</button>
						<button class="btn btn-danger" type="button" id="btnDelete">글
							삭제</button>
						</c:if>
							<button class="btn btn-dark" type="button" id="btnList">글 목록</button>
				</div>
				<div class="mt-5" align="center">
					<textarea rows="3" cols="70" id="msg"></textarea>
					<button type="button" class="btn btn-info btn-sm" id="btnComment" style="margin:0 0 25px 0">댓글쓰기</button>
				</div>
				<div id="replyResult" style="margin:0 60px"></div>
			</div>
		</body>

		<script>
			var init = function () {
				$.ajax({
					type: "get",
					url: "/reply/list/${board.no}"
				})
					.done(function (resp) {
						var str = "<table class='table table-condensed'><tr><th class='col-name'>이름</th><th class='col-ccontent'>내용</th><th class='col-cregdate'>날짜</th><th class='col-name'>구분</th></tr>"
						$.each(resp, function (key, val) {
							str += "<tr>"
							str += "<td class='col-name'>" + val.user.name + "</td>"
							str += "<td class='col-ccontent'>" + val.c_content + "</td>"
							str += "<td class='col-cregdate'>" + val.c_regdate + "</td>"
							if ("${principal.user.username}" == val.user.username) {
								str += "<td class='col-name'><a href='javascript:cdel(" + val.cnum + ")'>삭제</a></td>"
							} else {
								str += "<td class='col-name'></td>"
							}
							str += "</tr>"
						})
						str += "</table>"
						$("#replyResult").html(str);
					})
			}
			$("#btnComment").click(function () {
				if (${empty principal.user }){
				alert("로그인 하세요")
				location.href = "/login";
				return;
			}
			if ($("#msg").val() == "") {
				alert("댓글을 적으세요")
				return;
			}
			var data = {
				"bnum": $("#no").val(),
				"c_content": $("#msg").val()
			}
			$.ajax({
				type: "POST",
				url: "/reply/insert/${board.no}",
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
			//댓글삭제
			function cdel(cnum) {
				$.ajax({
					type: "delete",
					url: "/reply/delete/" + cnum
				})
					.done(function (resp) {
						alert(resp + "번 댓글삭제완료")
						init()
					})
					.fail(function () {
						alert("댓글삭제실패")
					})
			}
			$("#btnDelete").click(function () {
				if (!confirm("정말 삭제할까요?")) return
				$.ajax({
					type: "delete",
					url: "/boardDelete/${board.no}",
					success: function (resp) {
						if (resp == "success") {
							alert("삭제성공")
							location.href = "/boardList"
						}
					},
					error: function (e) {
						alert("삭제 실패" + e)
					}
				})
			})

			$("#btnUpdate").click(function () {
				if (confirm("수정창으로 이동합니다.")) {
					location.href = "/boardUpdate/${board.no}"
				}
			})

			$("#btnList").click(function () {
				location.href = "/boardList"
			})


			init();
		</script>

		</html>