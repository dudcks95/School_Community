<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="../js/member.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-5">
	<div class="row">
		<div class="col">
			<label for="userid">아이디:</label> 
			<input type="text" class="form-control" id="userid" 
			placeholder="Enter UserID"name="userid">
		</div>
		<div class="col align-self-end">
			<button type="button" class="btn btn-secondary" id="useBtn">사용여부</button>
		</div>
	</div>
<script>
$("#useBtn").click(function(){
	$.ajax({
		type:"post",
		url:"/idCheck",
		data:{"userid":$("#userid").val()},
		success:function(resp){
			if(reap.trim()=="yes"){
				alert("사용 가능한 아이디입니다.")
				$(opener.document).find("#userid").val($("#userid").val());
				self.close();
			}else{
				alert("사용 불가능한 아이디입니다.")
				$("#userid").val("");
				$("#userid").focus();
			}
		}
	})
})
</script>	
</div>
