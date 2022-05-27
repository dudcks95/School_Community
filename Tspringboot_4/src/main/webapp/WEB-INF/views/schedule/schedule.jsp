<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
					<div class="row py-5">
						<div class="col-12 pt-lg-5 mt-lg-5 text-center">
							<h1 class="display-4 text-white animated zoomIn">3213213421</h1>
							
							<a href="" class="h5 text-white">Home</a> <i class="far fa-circle text-white px-2"></i> <a href=""
								class="h5 text-white">게시판</a>
						</div>
					</div>
				</div>
과목명 : <input type="text" placeholder="Enter SubjectName" id="subjectname" name="subjectname">
요일 : <input type="text" placeholder="Enter SubjectName" id="day" name="day">
시간 : <input type="text" placeholder="Enter SubjectName" id="time" name="time">
<div class="container">
<table class="table table-bordered" border="2">
	<tr>
		<td></td>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>		
	</tr>
	<tr>
		<th>09~10</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	
</table>
</div>
</body>
</html>