<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>왼쪽 메뉴</title>
<style type="text/css">
.nav_div{
    display: inline-block;
    width: 18%;
}
.nav_div ul {
    list-style-type: none;
    margin: 0;
    padding: 5%;
    background-color: #f1f1f1;
}
.nav_div li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
    line-height:35px;
}
.nav_div li a:hover{
	cursor:pointer
}
.nav_div li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
.nav_div .logo_div img{
width:100%;
padding:0 5% 5% 5%;
}
.host_div{
display:inline-block;
width:80%;
float: right;
padding:5%;
}
</style>

<script>
var userEmail = '<%=session.getAttribute("email")%>';
var auth = '<%=session.getAttribute("auth")%>';
	console.log(userEmail)
	
if(auth != "E200"){
	alert("로그인이 필요한 서비스입니다.");
	location.href = "/member/guestLogin.do"
}
function goGymList(){
	location.href = "/host/mygymList";
}
function goHostIncome(){
	var now = new Date();
	const currentYear = now.getFullYear();
	location.href = "/host/hostIncome?incomeY="+currentYear;
}


</script>
</head>
<body>
	<div class="nav_div">
		<div class="logo_div">
	      <img src="../../resources/image/KakaoTalk_20230526_171948217.png" onclick="location.href='#'">
	   </div>
	   <div>
			<ul>
		      <li><a href="/member/hostInfo">내정보</a></li>
		       <li><a href="/host/hostresvList">예약현황</a></li>
		      <li><a onclick="goHostIncome();">수익현황</a></li>
		      <li><a onclick="goGymList();">시설목록</a></li>
		      <li><a href="/member/logout.do">로그아웃</a></li>
		   	</ul>
	   </div>
	</div>
</body>
</html>