<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
<div class="container-fluid bg-primary py-5 bg-header"
			style="margin-bottom: 90px;">
			<div class="row py-5">
				<div class="col-12 pt-lg-5 mt-lg-5 text-center">
					<h1 class="display-4 text-white animated zoomIn">게시판</h1>
					<a href="" class="h5 text-white">Home</a> <i class="far fa-circle text-white px-2"></i> <a href=""
						class="h5 text-white">게시판</a>
				</div>
			</div>
		</div>
<div class="container">
		<form action="boardInsert" method="post">
		<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title" name="title">
			</div>
			
			<div class="form-group">
				<label for="writer">작성자:</label>
					<input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer"
					value="" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="content">내용:</label> 
				<textarea class="form-control" row="5" id="content" name="content" ></textarea>
					<!-- #을쓰지 않는 이상 name으로 넘어감, jQuery는 id를 사용함 -->
			</div>
			
			<button type="submit" class="btn btn-primary btn-sm"  >글쓰기</button>
		</form>
	</div>