<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.top_navbar{width:100%;text-align: center;}
.top_navbar .logo_div{
   width: 11%;
   display: inline-block;
}
.top_navbar .logo_div img{
width:100%
}
.top_navbar .logo_div img:hover{
cursor:pointer
}
.top_navbar .search_div{
width:65%;
padding-left:5%;
display:inline-block;
}
.top_navbar .search_div .btn{
font-size:12px;
}
.top_navbar .login_div{
width:10%;
display: inline-block;
padding: 0 0 0 5%;
}

.top_navbar .login_div .btn{
width: 100%;
height: 35px;
}
.top_navbar .login_div #loginBtn{
display:none
}

.top_navbar .login_div #logoutBtn{
display:none
}

</style>

<script>
var userEmail = '<%=(String)session.getAttribute("email")%>';
var userAuth = '<%=(String)session.getAttribute("auth")%>';
var userId = '<%=session.getAttribute("id")%>';
console.log(userId);
$(function(){
	if(userEmail == "null"){
		$('#loginBtn').css('display','inline-block')
	}else if(userEmail != "null"){
		$('#logoutBtn').css('display','inline-block')
	}
})

function goMyInfo(){
	location.href="/member/guestInfo";
}

</script>

<body>

<div class="top_navbar">
   <div class="logo_div">
      <img src="../../resources/image/KakaoTalk_20230526_171948217.png" onclick="location.href='/'">
   </div>
   
	<div class="search_div">
   		<form id="searchForm" action="/search" method="GET">
	      <div class="input-group mb-3">
	        <input type="text" name="keyword" class="form-control" aria-label="Text input with dropdown button" placeholder="지역명 또는 공간명을 입력하세요.">
	      	<input type="submit" class="btn btn-primary" value="검색" style="width: 10%;">
	      </div>
   		</form>
	 </div>
   
   
   <div class="login_div">
      <input id="loginBtn" class="btn btn-outline-primary" type="button" value="로그인" onclick="location.href='/member/guestLogin.do'">
      
		<div class="btn-group" id="logoutBtn">
		  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="width:65px;">
		      My  
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" onclick="goMyInfo();">내 정보</a></li>
		    <li><a class="dropdown-item" href="/resv/resvList">내 예약</a></li>
		    <li><a class="dropdown-item" href="/review/myReviewList">내 리뷰</a></li>
		    <li><hr class="dropdown-divider"></li>
		    <li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
		  </ul>
		</div>
   </div>
   
</div>

</body>
</html>