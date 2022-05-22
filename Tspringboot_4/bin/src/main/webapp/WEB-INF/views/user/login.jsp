<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-5 pt-5" >
  <h2 align="center">로그인</h2>
  <form action="/login" method="post">
    <div class="form-group">
		 <br/>
        <input type="text" class="form-control" id="userid" name="userid" placeholder="아이디(userid)">
    </div>
    <div class="form-group">
    	<br/>
        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호(password)">
    </div>
    <br/>
    <button type="button" class="btn btn-dark btn-block">로그인</button> <br/> 
    <button type="button" class="btn btn-dark btn-block">회원가입</button>
  </form>
</div>

</body>
</html>