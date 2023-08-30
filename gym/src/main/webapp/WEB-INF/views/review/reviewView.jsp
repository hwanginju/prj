<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.col {
	padding: 25px;
}

#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform fieldset input[type=radio] {
	display: none;
}

#myform fieldset label {
	font-size: 3em!important;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform fieldset label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform fieldset label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform fieldset input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 100px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

.btn_div {
	margin-top: 15px;
}

.btn_div .btn {
	font-size: 15px;
	width: 100px;
	height: 35px;
}
</style>

<script>
const rating_input = document.querySelector('.rating input');
const rating_star = document.querySelector('.rating_star');

// 별점 드래그 할 때
rating_input.addEventListener('input', () => {
  rating_star.style.width = `${rating_input.value * 10}%`
});

function frmSub(){
	cf = confirm("수정하시겠습니까?");
	
	if(cf){
		return true;
	}else{
		return false;
	}
}

</script>
<body>
	<jsp:include page="../top_navbar.jsp"></jsp:include>
	<div class="container" style="padding-top: 50px">
		<h1 style="text-align: left;">리뷰수정</h1>
		<div class="col" style="display: inline-block;">
			<img id="gymImg" src="../../resources/image_gym/${gymInfo.img}"
				style="width: 400px; height: auto;" />
		</div>
		<div class="col" style="display: inline-block; height: 200px;">
			<label>시설명</label>
			<p>${gymInfo.name}</p>
			<span>${gymInfo.info}</span>
		</div>
		<div>
			<label>공간은 어떠셨나요?</label> <br>
			<form class="mb-3" name="myform" id="myform" action="/review/reviewUpdate" method="POST" onsubmit="return frmSub()">
				<input type="hidden" name="id" value="${reviewInfo.id}">
				<fieldset>
					<span class="text-bold"> 별점을 선택해주세요</span>
					<input type="radio" name="point" value="5" id="rate1" <c:if test="${reviewInfo.point == 5}">checked</c:if>>
					<label for="rate1">★</label>
					<input type="radio" name="point" value="4" id="rate2" <c:if test="${reviewInfo.point == 4}">checked</c:if>>
					<label for="rate2">★</label>
					<input type="radio" name="point" value="3" id="rate3" <c:if test="${reviewInfo.point == 3}">checked</c:if>>
					<label for="rate3">★</label>
					<input type="radio" name="point" value="2" id="rate4" <c:if test="${reviewInfo.point == 2}">checked</c:if>>
					<label for="rate4">★</label>
					<input type="radio" name="point" value="1" id="rate5" <c:if test="${reviewInfo.point == 1}">checked</c:if>>
					<label for="rate5">★</label>
				</fieldset>
				<div>
					<textarea class="col-auto form-control" id="reviewContents"
						placeholder="이용후기를 남겨주세요." name="content">${reviewInfo.content}</textarea>
				</div>
				<div class="btn_div">
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>