<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/4header.jsp" %>
<div class="container mt-5 pt-5" >
<h2 align="center">로그인</h2>
<c:if test="${not empty errorMsg }">
	${errorMsg }
</c:if>
 	<form action="/login" method="post">
	    <div class="form-group">
			 <br/>
	        <input type="text" class="form-control" id="username" name="username" placeholder="아이디(userid)">
	    </div>
	    <div class="form-group">
	    	<br/>
	        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호(password)">
	    </div>
	    <br/>
	    <button class="btn btn-dark btn-block">로그인</button> <br/> 
	    <button type="button" class="btn btn-dark btn-block">회원가입</button>
    </form>
</div>

</body>
</html>