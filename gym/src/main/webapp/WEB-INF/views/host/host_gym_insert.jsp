<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설 등록</title>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.wrapper {
   display: flex;
   justify-content: center;
   align-items: center;
   min-height: 100vh;
}

.content {
   font-family: system-ui, serif;
   font-size: 2rem;
   padding: 3rem;
   border-radius: 1rem;
}
.btn{
width:120px;
font-size:15px;
}
</style>
</head>

<body>
   <jsp:include page="../left_navbar.jsp"></jsp:include>
	<div class="host_div">
	   <h1>시설 등록</h1>
	      <div class="wrapper">
	         <div class="content">
	         <form id="gymForm"
			   		  action="/host/host_gym_insert" onsubmit="return frmSub('insert')"
		    method="POST" enctype="multipart/form-data">
	            <div class="mb-3 row">
	               <label for="staticEmail" class="col-sm-10 col-form-label">시설명</label>
	               <div class="col-sm-100">
	                  <input type="text" class="form-control" name="name" 
	                  	style="font-size:15px">
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="address1" class="col-sm-10 col-form-label">주소</label>
	               <div class="col-sm-100">
	                  <input type="text" class="form-control" readonly name="address_1" id="address_kakao" style="font-size:15px">
	                  <input type="hidden" name="x_geo" id="x_geo">
	                  <input type="hidden" name="y_geo" id="y_geo">
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="address1" class="col-sm-10 col-form-label">상세주소</label>
	               <div class="col-sm-100">
	                  <input type="text" class="form-control" name="address_2" style="font-size:15px">
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="address2" class="col-sm-10 col-form-label">공간유형</label>
	               <div class="col-sm-100">
	               	  <div class="form-check form-check-inline">
	                     <input class="form-check-input" type="radio"name="type" 
	                     id="inlineRadio2" value="농구">
	                     <label class="form-check-label" for="inlineRadio2">농구</label>
	                  </div>
	                  <div class="form-check form-check-inline">
	                     <input class="form-check-input" type="radio"name="type" 
	                     id="inlineRadio1" value="배드민턴/테니스">
	                     <label class="form-check-label" for="inlineRadio1">배드민턴/테니스</label>
	                  </div>
	                  <div class="form-check form-check-inline">
	                     <input class="form-check-input" type="radio"name="type" 
	                     id="inlineRadio2" value="탁구">
	                     <label class="form-check-label" for="inlineRadio2">탁구</label>
	                  </div>
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="pno" class="col-sm-10 col-form-label">수용인원</label>
	               <div class="col-sm-100">
	                  <input type="number" style="width:80px;display:inline-block; font-size:15px" class="form-control" id="pno" 
	                  name="people_num">
	                  <span>
		                  명
	                  </span>
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="time" class="col-sm-10 col-form-label">영업시간</label>
	               <div class="col-sm-100">
	                  <input type="number" style="width:80px;display:inline-block; font-size:15px" class="form-control" id="time" 
					 name="open_time">
	                  <span>
		                  시 ~ 
	                  </span>
	                  <input type="number" style="display:inline-block;width:80px; font-size:15px" class="form-control" id="time"
	                  name="close_time">
	                  <span>
		                  시
	                  </span>
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="pprice" class="col-sm-10 col-form-label">가격</label>
	               <div class="col-sm-100">
	                  <input type="text" style="display:inline-block;width:100px; font-size:15px" class="form-control" id="pprice"
	                  name="price">
	                  <span>
		                  원
	                  </span>
	               </div>
	            </div>
	            <div class="mb-3 row">
	               <label for="pinfo" class="col-sm-10 col-form-label">시설 소개</label>
	               <div class="col-sm-100">
	                  <textarea class="form-control" id="pinfo" style="height:100px;font-size:15px" name="info"><c:if test="${not empty host_gym}">${host_gym.info}</c:if></textarea>
	               </div>
	            </div>
	            
		            <div class="mb-3 row">
		               <label for="pinfo" class="col-sm-10 col-form-label">시설 사진</label>
		               <div class="col-sm-100">
				            <input class="form-control" type="file" id="pimage" name="upfile" required>
		               </div>
		            </div>
	            
		        	<input type="submit" class="btn btn-info" value="등록">
			   </form>
	         </div>
	      </div>
	   
	   
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

if(${hostState} != 1){
	alert("관리자의 승인이 필요합니다.");
	location.href = "/member/hostInfo";
}

window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_2]").focus(); //상세입력 포커싱
                
                $.ajax({
					type:"GET",
					url:'https://dapi.kakao.com/v2/local/search/address.json?query=' + encodeURI(document.getElementById("address_kakao").value),
					headers: {
            			Authorization: 'KakaoAK b8c5305ebdced940c8aae0b053be12c2', //KakaoAK 뒤에 위에서 얻은 REST API KEY를 입력
            		},
					success: function(axiosResult){
						const y = axiosResult.documents[0].address.y;
	                	const x = axiosResult.documents[0].address.x;
	                	document.getElementById("y_geo").value = y;
	                	document.getElementById("x_geo").value = x;
					}
				})
                
            }
        }).open();
    });
}

function frmSub(type){
		var cf = confirm("시설을 등록하시겠습니까?");
		
		if(cf){
			return true;
		}else{
			return false;
		}
}

</script>



</html>