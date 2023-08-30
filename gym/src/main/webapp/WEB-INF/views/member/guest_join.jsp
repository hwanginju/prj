<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
	crossorigin="anonymous">
<style>
.content {
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 1rem;
  border-radius: 1rem;
  width:40%;
  margin:auto;
}
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
#email{
width:75%;
display:inline-block;
}
#emailDubBtn{
	width:20%;
	line-height: 26px;
}
</style>

<script>

function emailDup(){
	var email = $("#email").val();
	if(email != ""){
		$.ajax({
			url:"/member/emailDup",
			type:"POST",
			data:{email},
			success: function(cnt){
				console.log(cnt);
				if(cnt == 0){
					$('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                    $('#emailDupCk').val("Y");
				}
			},error:function(){
				$('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                alert("아이디를 다시 입력해주세요");
                $('#email').val('');
                $('#emailDupCk').val("N");
			}
		})
	}else{
		alert("이메일을 입력해주세요.");
	}
}

function frmSub(){
	let pwd = $("#pwd1").val();
	let pwd2 = $("#pwd2").val();
	if(pwd != pwd2){
		alert("비밀번호를 확인해주세요.");
		$("#pwd2").focus();
		return false;
	}else{
		if($("#emailDupCk").val() != "Y"){
			alert("중복확인을 해주세요.");
			return false;
		}else{
			return true;
		}
	}
}

/* function frmSub() {
	let pwd = $("#pwd1").val();
	let pwd2 = $("#pwd2").val();
	if(pwd != pwd2){
		alert("비밀번호를 확인해주세요.");
		$("#pwd2").focus();
	}else{
		if($("#emailDupCk").val() != "Y"){
			alert("중복확인을 해주세요.");
		}else{
			var data = $("#guestJoinForm").serialize();
			
			$.ajax({
				url:"/member/guestJoin.do",
				type:"POST",
				data:data,
				success: function(data){
					console.log(data)
					if(data == "Y"){
						alert("회원가입이 완료되었습니다.");
						location.href="/member/guestLogin.do";
					}else{
						alert("회원가입에 실패했습니다.");
						location.href="/member/guestJoin";
					}
				}, error:function(data){
					alert("실패");
					console.log(data);
				}
			})
		}
	}
} */
</script>

</head>
<body>
<jsp:include page="../top_navbar.jsp"></jsp:include>
<h2 style="text-align:center; font-weight:bold">게스트 회원가입</h2>
<div class="wrapper">

<form id="joinForm" method="POST" action="/member/guestJoin.do" onsubmit="return frmSub()">
  <div class="content">
	<div class="mb-3 row" >
	    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-100">
	      <input type="text" required class="form-control" placeholder="email@example.com"name="email" id="email">
	      <input type="button" value="중복확인"class="btn-info btn" onclick = "emailDup()" id="emailDubBtn">
	      <input type="hidden" value="N" id="emailDupCk">
	      <span class="id_ok">사용 가능한 아이디입니다.</span>
		  <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
	    </div>
	  </div>
	  <br>
	  <div class="mb-3 row">
	    <label for="inputPassword1" class="col-sm-10 col-form-label">비밀번호</label>
	    <div class="col-sm-100">
	      <input type="password" required class="form-control" id="pwd1" name="pwd">
	    </div>
	  </div>
		<br>
	  <div class="mb-3 row">
	    <label for="inputPassword2" class="col-sm-10 col-form-label">비밀번호 확인</label>
	    <div class="col-sm-100">
	      <input type="password" required class="form-control" id="pwd2">
	    </div>
	  </div>
		<br>
		<div class="mb-3 row" >
	    <label for="staticNick" class="col-sm-10 col-form-label">닉네임</label>
	    <div class="col-sm-100">
	      <input type="text" class="form-control" required id="staticNick" name="nickName">
	    </div>
	  </div>
		<br>
		<div class="mb-3 row" >
	    <label for="staticTel" class="col-sm-10 col-form-label">연락처</label>
	    <div class="col-sm-100">
	      <input type="text" class="form-control" required id="staticTel" name="tel">
	      <input type="hidden" name="auth" value="E300">
	    </div>
	  </div>
	<button type="submit" class="btn btn-info" id="emailDubBtn" onclick="frmSub();">회원가입</button>
   </div>
</form>
</div>

</body>
</html>