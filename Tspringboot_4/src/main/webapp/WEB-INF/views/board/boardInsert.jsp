<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
		<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
					<h1 class="display-4 text-white animated zoomIn">게시글 입력</h1>
					
				</div>
			</div>
		</div>
		<div class="container">
			<form action="boardInsert" method="post">
				<div class="form-group">
					<label for="title">제목:</label> <input type="text" class="form-control" id="title" placeholder="Enter title"
						name="title">
				</div>

				<div class="form-group">
					<label for="sort">분류:</label>
					<select class="form-control bg-white" id="sort" name="sort">
						<option value="자유">자유게시판</option>
						<option value="동아리">동아리</option>
						<option value="취미">취미</option>
					</select>
				</div>

				<div class="form-group">
					<label for="writer">작성자:</label>
					<input type="text" class="form-control" id="writer" value="${principal.user.name }" name="writer"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용:</label>
					<textarea class="form-control" row="5" id="content" name="content"></textarea>

				</div>

				<button type="submit" class="btn btn-primary btn-sm mt-3">글쓰기</button>
			</form>
		</div>