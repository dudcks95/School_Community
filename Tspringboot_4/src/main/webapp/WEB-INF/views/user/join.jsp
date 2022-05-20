<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/4header.jsp" %>
<div class="container mt-5" >
<h2 align="center">회원가입</h2>
	<div class="form-group">
		<label for="username">이름:</label> <input type="text"
			class="form-control" id="username"name="username" placeholder="username">
	</div>
	
	<div class="row">
		<div class="col-sm-10">
			<label for="userid">아이디:</label> <input type="text"
				class="form-control" id="userid" name="userid" placeholder="userid">
		</div>
		<div class="col-sm-2 align-self-end">
			<button class="btn btn-secondary" id="idCheckBtn">중복확인</button>
		</div>
	</div>
	
	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password"name="password" placeholder="password">
	</div>
	
	<div class="form-group">
		<label for="pwd_check">비밀번호 체크:</label> <input type="password"
			class="form-control" id="pwd_check"name="pwd_check" placeholder="pwd_check">
	</div>
	
	<div class="form-group">
		<label for="email">이메일:</label> <input type="text"
			class="form-control" id="email"name="email" placeholder="email">
	</div>
	
	<div class="form-group">
		<label for="phone">전화번호:</label> <input type="text"
			class="form-control" id="phone"name="phone" placeholder="phone">
	</div>
			
	<div class="form-group">
		<label for="schoolname">재학중인 대학:</label> <input type="text"
			class="form-control" id="schoolname"name="schoolname" placeholder="schoolname">
	</div>
	<div class="form-check-inline">
	  <label class="form-check-label">
	    <input type="radio" class="form-check-input" name="schoolgrade" checked="checked"
	    id="schoolgrade" value="1">1학년</label>
	</div>
	<div class="form-check-inline">
	  <label class="form-check-label">
	    <input type="radio" class="form-check-input" name="schoolgrade"
	     id="schoolgrade" value="2">2학년</label>
	</div>
	<div class="form-check-inline">
	  <label class="form-check-label">
	    <input type="radio" class="form-check-input" name="schoolgrade"
	     id="schoolgrade" value="3">3학년</label>
	</div>
	<div class="form-check-inline">
	  <label class="form-check-label">
	    <input type="radio" class="form-check-input" name="schoolgrade"
	     id="schoolgrade" value="4">4학년</label>
	</div><br/><br/>
	
	<button class="btn btn-dark btn-block" id="btnJoin">회원가입</button>
	
<script>
$("#btnJoin").click(function(){
	var tel=/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
	var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if($("#username").val()==""){
		alert("이름을 입력하세요.")
		$("#username").focus();
		return false;
	}
	if($("#userid").val()==""){
		alert("아이디를 입력하세요.")
		$("#userid").focus();
		return false;
	}
	if($("#password").val()==""){
		alert("비밀번호를 입력하세요.")
		$("#password").focus();
		return false;
	}
	if($("#password").val()!=$("#pwd_check").val()){
		alert("비밀번호가 일치하지 않습니다.")
		$("#pwd_check").focus();
		return false;
	}
	if($("#email").val()==""){
		alert("이메일을 입력하세요.")
		$("#email").focus();
		return false;
	}
	if(!$("#email").val().match(mail)){
		alert("이메일 형식이 아닙니다.")
		$("#email").focus();
		return false;
	}
	if($("#phone").val()==""){
		alert("전화번호를 입력하세요.")
		$("#phone").focus();
		return false;
	}
	if(!$("#phone").val().match(tel)){
		alert("전화번호 형식이 아닙니다.")
		$("#phone").focus();
		return false;
	}
	if($("#school").val()==""){
		alert("학교명을 입력하세요.")
		$("#school").focus();
		return false;
	}
	var data={
			"username":$("#username").val(),
			"userid":$("#userid").val(),
			"password":$("#password").val(),
			"pwd_check":$("#pwd_check").val(),
			"email":$("#email").val(),
			"phone":$("#phone").val(),
			"school":{
				"schoolname":$("#schoolname").val()
			},
			"schoolgrade":$("#schoolgrade").val()
	}
	$.ajax({
		type:"POST",
		url:"/join",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("회원가입 성공")
			location.href="/login"
		}else if(resp=="fail"){
			alert("아이디 중복")
			$("#username").val("")
		}
	})
	.fail(function(){
		alert("회원가입 실패")
	})
})
$("#idCheckBtn").click(function(){
	window.open("idCheck","","width=600 height=300");
})

</script>
</div>

