<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<title>guest_login</title>
</head>
<style>


.mb-3{
   padding:20px;
}
.form-label{
   vertical-align:middle;
}
.join_div{
	padding: 20px 20px 0 0;
	float:right;
	font-size:14px;
}
.join_div a{
	font-weight:bold
}
.join_div a:hover{
	cursor:pointer;
	color:blue
}
</style>
<body class="text-center">
<jsp:include page="../top_navbar.jsp"></jsp:include>

   <main class="form-signin w-100 m-auto">
     <form name="form1" id = "form1">
       
       
       <div style="width:40%; margin:auto; padding:100px 0 65px 0">
          <h1 class="h3 mb-3 fw-normal" style="font-weight:bold!important;">로그인</h1>
          <div class="mb-3">
           <label for="formGroupExampleInput" class="form-label">Email</label>
           <input type="text" class="form-control" id="formGroupExampleInput" id = "userid" name="userid" placeholder="Email" style="width:70%; float:right">
         </div>
          <div class="mb-3">
           <label for="formGroupExampleInput" class="form-label">Password</label>
           <input type="password" required class="form-control" id="formGroupExampleInput" id ="passwd" name="passwd" placeholder="Password" style="width:70%; float:right">
         </div>
         <div class="mb-3">
             <button class="w-100 btn btn-lg btn-primary" type="submit" style="line-height: 25px; margin-top:20px; float:right;" id= "btnLogin">로그인</button>
         </div>
         <div class="mb-3 join_div">
         	<a href="/member/joinOption">Need an account? Sign up now!</a>
         </div>
       </div>
       
       
     </form>
   </main>

</body>
<script>
    
    //로그인버튼 눌렀을 때 작동하는 함수
$(function() {
	$("#btnLogin").click(function() {
        //userid, passwd 값을 받아온다
		var userid = $("#userid").val();
		var passwd = $("#passwd").val(); 
        
        //아이디 비밀번호 입력 안했을때 경고창 출력하는 부분
		if (userid == "") {
			alert("아이디를 입력하세요");
			$("#userid").focus(); //입력포커스 이동

			return; //함수 종료
		}
		if (passwd == "") {
			alert("비밀번호를 입력하세요");
			$("#passwd").focus();
			return;
		}
		/* $.ajax({
			type:'post',
			url:'/member/login_check.do',
			async:true,
			headers:{
				"Content-Type" : "application/json",
			    "X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',       // 데이터 타입 (html, xml, json, text 등등)
		    data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
		      "userid" : userid,
		      "passwd" : passwd
		    }),
		    success : function(result) { // 결과 성공 콜백함수
		        console.log(result);
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		    }
		}) */
        
		//폼 내부의 데이터를 전송할 주소
		document.form1.action = "/member/login_check.do";
		document.form1.method = "post";
		document.form1.submit(); //제출
	});
});

</script>


</html>