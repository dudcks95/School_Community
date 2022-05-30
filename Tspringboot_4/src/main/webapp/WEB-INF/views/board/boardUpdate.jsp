<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerSub.jsp"%>
<div class="container-fluid bg-primary py-5 bg-header"
	style="margin-bottom: 90px;">
	<div class="row py-5">
		<div class="col-12 pt-lg-5 mt-lg-5 text-center">
			<h1 class="display-4 text-white animated zoomIn">게시글 수정</h1>
		</div>
	</div>
</div>
<div class="container">
	<form action="boardUpdate" method="post">
	<input type="hidden" id="no" name="no" value="${board.no }"/> 
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" value="${board.title }" placeholder="Enter title"
				name="title">
		</div>

		<div class="form-group">
			<label for="writer">작성자:</label> <input type="text"
				class="form-control" id="writer" placeholder="Enter writer"
				name="writer" value="${board.writer }" readonly="readonly">
		</div>

		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" row="5" id="content" name="content">${board.content }</textarea>
		</div>

		<button type="button" class="btn btn-primary btn-sm mt-3" id="btnModify">수정하기</button>
		</form>
		</div>
		<hr>
		<script>
		$("#btnModify").click(function(){
			data = {
					"no" : $("#no").val(),
					"title" : $("#title").val(),
					"writer" : $("#writer").val(),
					"content" : $("#content").val(),
					"regdate" : $("#regdate").val(),
					"image" : $("#image").val(),
					/*"no" : $("#no").val(),
					"no" : $("#no").val(),
					"no" : $("#no").val(),
					"no" : $("#no").val(),
					"no" : $("#no").val(),*/
			}
			$.ajax({
				type:"put",
				url : "/boardUpdate",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				success: function(resp){
					alert("수정완료")
					location.href="/boardList";
				},
				error : function(e){
					alert("수정실패 : " + e);
				}
			})
		})
		</script>
	
