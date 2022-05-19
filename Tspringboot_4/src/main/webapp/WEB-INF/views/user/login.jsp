<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/4headerSub.jsp" %>
<%-- <div class="container mt-5 pt-5" >
<h2 align="center">로그인</h2>
<c:if test="${not empty errorMsg }">
	${errorMsg }
</c:if>
 	<form action="/login" method="post">
	    <div class="form-group">
			 <br/>
	        <input type="text" class="form-control" id="username" name="username" placeholder="아이디(username)">
	    </div>
	    <div class="form-group">
	    	<br/>
	        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호(password)">
	    </div>
	    <br/>
	    <button class="btn btn-dark btn-block">로그인</button> <br/> 
	    <button type="button" class="btn btn-dark btn-block">회원가입</button>
    </form>
</div> --%>
<div class="container mt-5" >
<h1 align="center">로그인</h1>
	<div class="rounded h-100 flex align-items-center p-5 wow zoomIn" data-wow-delay="0.9s" style="width:70%; margin:0 auto">	
		
		<form action="/login" method="post">
			<div class="row g-3 mr-5">	
				<div class="col-xl-12 ">
					<input type="text" class="form-control bg-light border-0" id="username" name="username" 
					placeholder="아이디(username)" style="height: 55px;">
					<c:if test="${not empty errorMsg }">
						 ${errorMsg }
					</c:if>
					<br/>
				</div>
				<div class="col-xl-12 ">
					<input type="password" class="form-control bg-light border-0" id="password" name="password" 
					placeholder="비밀번호(password)" style="height: 55px;"><br/>
		  		</div>
				<div class="col-xl-12">
					<button class="btn btn-dark w-100 py-3" type="submit">로그인</button><br/><br/>
				</div>
				<div class="col-xl-12">
					<button class="btn btn-dark w-100 py-3" type="button" id="btnJ">회원가입</button>
				</div>
			</div>
		</form>
	</div>
<script>
$("#btnJ").click(function(){
	location.href="/join";
})
</script>
</div>
</body>
</html>