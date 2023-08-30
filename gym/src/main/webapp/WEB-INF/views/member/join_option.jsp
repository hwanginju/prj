<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<style>
.card_div{
	width: 90%;
	margin: 1% 5% 0 5%;
}
.card{
	display: inline-flex;
	width: 30%;
	margin: 1.5%;
}
.image_div{
	border-radius: 100%;
	width:90%;
	background-size: 90%;
	background-repeat: no-repeat;
	background-position: center;
	border: 1px solid gray;
	margin: auto;
}
.image_div:after{
	content: "";
	display: block;
	padding-bottom: 100%;
}
.image_div:hover, .card_div .card:hover{
cursor:pointer;}
</style>
<body>
<jsp:include page="../top_navbar.jsp"></jsp:include>

<div>
	<div class="card_div" style="padding:30px 0 60px">
		<div style="margin:0 15%;width: 90%;">
			<div class="card" style="border:none">
				<div class="image_div" style='background-image:url("../../resources/image/guestimg.png")' onclick="location.href='/member/guestJoin'"></div>
				<span style="text-align:center;font-weight:bold; margin-top:10px;">게스트 회원가입</span>
			</div>
			
			<div class="card" style="border:none">
				<div class="image_div" style='background-image:url("../../resources/image/hostimg.png")' onclick="location.href='/member/hostJoin'"></div>
				<span style="text-align:center;font-weight:bold; margin-top:10px;">호스트 회원가입</span>
			</div>
		</div>
	</div>
</div>



</body>
</html>