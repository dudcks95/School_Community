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
<h2 align="center">회원가입</h2>
	<div class="form-group">
		<label for="username">이름:</label> <input type="text"
			class="form-control" id="username"name="username">
	</div>
	
	<div class="row">
		<div class="col-sm-10">
			<label for="userid">아이디:</label> <input type="text"
				class="form-control" id="userid" name="userid">
		</div>
		<div class="col-sm-2 align-self-end">
			<button type="button" class="btn btn-secondary" id="idCheckBtn">중복확인</button>
		</div>
	</div>
	
	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password"name="password">
	</div>
	
	<div class="form-group">
		<label for="pwd_check">비밀번호 체크:</label> <input type="password"
			class="form-control" id="pwd_check"name="pwd_check">
	</div>
	
	<div class="form-group">
		<label for="phone">전화번호:</label> <input type="text"
			class="form-control" id="phone"name="phone">
	</div>
	
	<div class="form-group">
		<label for="email">이메일:</label> <input type="text"
			class="form-control" id="email"name="email">
	</div>
	
	<div class="form-group">
		<label for="school">재학중인 대학:</label> <input type="text"
			class="form-control" id="school"name="school">
	</div>
	<button type="button" class="btn btn-dark btn-block">회원가입</button>
</div>

</body>
</html>