<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
					<h1 class="display-4 text-white animated zoomIn">게시판</h1>
					<a href="" class="h5 text-white">Home</a> <i class="far fa-circle text-white px-2"></i> <a href=""
						class="h5 text-white">게시판</a>
				</div>
			</div>
		</div>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Insert title here</title>
		</head>

		<body>
			<div class="container">
				<table class="table table-hover">
					<thead>
						<tr>
							<td colspan="2">글제목: ${board.title}</td>
							<td>ㅇㅇ게시판</td>
							<td>조회수 : ${board.hitcount }</td>
						</tr>

					</thead>
					<tbody>
						<tr>
							<td>작성자 : ${board.writer}</td>
							<td>작성일 : ${board.regdate}</td>
						</tr>
						<tr>
							<td>내용 : ${board.content }</td>
						</tr>
					</tbody>
				</table>
				<%-- <c:if test="${principal.user. }"> --%>
					<button type="button" id="btnUpdate">글 수정</button>
					<button type="button" id="btnDelete">글 삭제</button>
					<%-- </c:if> --%>
						<button type="button" id="btnList">글 목록</button>
			</div>
		</body>

		<script>
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
		</script>

		</html>