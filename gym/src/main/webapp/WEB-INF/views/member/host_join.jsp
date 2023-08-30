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
#emailDubBtn, #subBtn{
	width:20%;
	line-height: 26px;
}
</style>
</head>

<body>
	<jsp:include page="../top_navbar.jsp"></jsp:include>
	<h2 style="text-align: center; font-weight: bold">호스트 회원가입</h2>
	<form id="joinForm" enctype="multipart/form-data" method="POST" action="/member/hostJoin.do" onsubmit="return frmSub()">
		<div class="wrapper">
			<div class="content">
				<div class="mb-3 row">

					<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-100">
						<input type="text" class="form-control" required
							placeholder="email@example.com" id="email" name="email">
						<input type="button" class="btn-info btn" value="중복확인" id="emailDubBtn" onclick="emailDup();">
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
					<label for="inputPassword2" class="col-sm-10 col-form-label">비밀번호
						확인</label>
					<div class="col-sm-100">
						<input type="password" class="form-control" id="pwd2">
					</div>
				</div>
				<br>
				<div class="mb-3 row">
					<label for="place" class="col-sm-10 col-form-label">상호명</label>
					<div class="col-sm-100">
						<input type="text" required class="form-control" id="nickname" name="nickName">
					</div>
				</div>
				<div class="mb-3 row">
					<label for="place" class="col-sm-10 col-form-label">대표자명</label>
					<div class="col-sm-100">
						<input type="text" required class="form-control" id="ceo" name="ceo">
					</div>
				</div>
				<br>
				<div class="mb-3 row">
					<label for="address1" class="col-sm-10 col-form-label">주소</label>
					<div class="col-sm-100">
						<input type="text" required class="form-control" id="address1" name="address_1">
					</div>
				</div>
				<br>
				<div class="mb-3 row">
					<label for="address2" class="col-sm-10 col-form-label">상세주소</label>
					<div class="col-sm-100">
						<input type="text" required class="form-control" id="address2" name="address_2">
					</div>
				</div>
				<br>
				<div class="mb-3 row">
					<label for="staticTel" class="col-sm-10 col-form-label">연락처</label>
					<div class="col-sm-100">
						<input type="text" required class="form-control" id="tel"name="tel">
					</div>
				</div>
				<br>
				<div class="mb-3 row">
					<label for="busReg" class="col-sm-10 col-form-label">사업자등록증</label>
					<div class="col-sm-100">
						<input type="file" class="form-control" id="file" name="upfile" required>
						<input type="hidden" value="E200" name="auth">
						<input type="hidden" value="1" name="state">
					</div>
				</div>

				<button type="submit" class="btn btn-info" id="subBtn">회원가입</button>
			</div>
		</div>
	</form>


</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

window.onload = function(){
    document.getElementById("address1").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address1").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

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
	
	
/* 	function frmSub() {
		let pwd = $("#pwd1").val();
		let pwd2 = $("#pwd2").val();
		if(pwd != pwd2){
			alert("비밀번호를 확인해주세요.");
			$("#pwd2").focus();
		}else{
			if($("#emailDupCk").val() != "Y"){
				alert("중복확인을 해주세요.");
			}else{
				var data = $("#joinForm").serialize();
				console.log(data);
				$.ajax({
					url:"/member/memberJoin",
					type : 'POST',
					enctype: 'multipart/form-data',
					processData: false,
					contentType: false,
					data:data,
					success: function(data){
						if(data == "Y"){
							alert("회원가입이 완료되었습니다.");
							location.href="/member/guestLogin.do"
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
</html>