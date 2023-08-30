<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.col .div_c {
   display: inline-block;
   width: 40%;
}

.divC{
    padding: 5px;
    margin-top:5px;
}
.divD{
   width:49%;
   display:inline-block;
   vertical-align: top;
}
.divB {
   width: 49%;
   display: inline-block;
   vertical-align: top;
}
#resv_time{
	width: 39%;
    height: 30px;
    font-size: 15px;
}
.text-red{
	color:red;
	font-size:12px;
}
.btn_resv_time{
	background:lightblue!important;
	border:1px solid white!important;
}
.btn_checked{
	background:pink!important;
	border:1px solid!important;
}
#resv_time{
	text-align:right;
}
#resv_time_2{
	text-align:left;
}
.div_time{
	width: 50px!important;
    min-width: 30px!important;
	border:none;
}

#priceText{
	display:block;
	border:none;
	font-size:25px;
	color:navy;
	float: right;
	text-align:right;
	outline:none;
	padding-bottom: 20px;
	width:100%;
	font-weight:bold;
}

</style>
<title>예약</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
var work_hr = new Array();
for(i=${view.open_time}; i<= ${view.close_time}; i++){
	work_hr.push(i);
}
   //DatePicker 초기화 함수
   function initDatePicker() {
	   var today = new Date();
	   var year = today.getFullYear();
	   var month = ('0'+(today.getMonth() + 1)).slice(-2);
	   var day = ('0'+today.getDate()).slice(-2);
	   
	   var dateString = year + '-'+month+'-'+day;
	   
      flatpickr("#datepicker", {
         dateFormat : "Y-m-d", // 날짜 형식 설정
         minDate : dateString
      // 기타 설정 옵션들을 추가로 설정할 수 있습니다.
      });
   }
   
	var start = 0;
	var end = 0;
   function resv_checked(i){
	   if($("#datepicker").val() != ''){
		   if(start == 0 ){
			   start = i;
			   end = i;
				   if($('#label_'+i).hasClass('btn_checked')){
					   $('#label_'+i).removeClass('btn_checked')
				   }else{
					   $('#label_'+i).addClass('btn_checked')
				   }
		   }else if(start == i && end == i){
			   start =0;
			   end =0;
			   $('#label_'+i).removeClass('btn_checked');
		   }else{
				$('.btn_resv_time').removeClass('btn_checked')
			   if(start > i){
				   start = i;
			   }else{
				   end = i;
			   }
				for(s=start; s<=end; s++){
					if($("#resv_time_"+s).prop("disabled")){
						alert('예약가능한 시간이 아닙니다.');
						$('.btn_resv_time').removeClass('btn_checked');
						start = 0;
						end = 0;
						break;
					}else{
						$('#label_'+s).addClass('btn_checked')
					}
				}
		   }
		   var startNum = start.toString();
		   var endNum = end.toString();
		   var priceNum = (end-start+1)*${view.price};
		   $('#price').val(priceNum);
		   $('#priceText').val(priceNum.toLocaleString()+' 원');
		   $('#resv_time').val(start.toString().padStart(2, '0')+':00');
		   if(end == 0){
			   $('#resv_time_2').val(endNum.padStart(2, '0').padStart(2, '0')+':00');
		   }else{
			   $('#resv_time_2').val(endNum.padStart(2, '0').padStart(2, '0')+':59');
		   }
		   $('input[name=resv_time_2]').val(end+1);
		   $('input[name=resv_time]').val(start);
		   console.log('start = '+start+' end = '+end);
	   }else{
		   alert("날짜를 선택해주세요.");
	   }
   }
   
   function dateChange(){
	   $('.btn-check').prop("disabled", false);
	   var date = $("#datepicker").val();
	   var gym_id = $("#gym_id").val();
	   $.ajax({
		    url:"/resv/resv_timeChk",
		    type:"POST",
		    data:{
		      	"resv_date": date,
		      	"gym_id": gym_id
		      },
		    success: function(data){
		      	if(data.length != 0){
		      		for(i=0; i<data.length; i++){
		      			for(s=data[i].resv_time; s<data[i].resv_time_2; s++){
		      				$("#resv_time_"+s).prop("disabled", true);
		      			}
		      		}
		      	}
		    }
		})
   }

   // 페이지 로드 시 DatePicker 초기화
   window.addEventListener("DOMContentLoaded", initDatePicker);
   
   //결제하기
function frmSub(){
      var resv_date = $("#datepicker").val();
      var resv_time = $('input[name="resv_time"]').val();
      if(resv_time == 0){
    	  alert("예약시간을 선택해주세요.");
      }else{
    	  $("#myform").submit();
      }
      /* var resv_time = $("#resv_time").val();
      var gym_id = $("#gym_id").val();
      
      $.ajax({
    	  url:"/resv/resv_dateChk",
    	  type:"POST",
    	  data:{
    		  resv_date,
    		  resv_time,
    		  gym_id
    	  },
    	  success: function(data){
    		  console.log(data)
    		  if(data == "Y"){
    			  var cf = confirm("예약하시겠습니까?");
    			  if(cf){
    				  $("#myform").submit();
    			  }else{
    				  return false;
    			  }
    		  }else{
    			  alert("예약이 불가능한 시간입니다.");
    			  $("#resv_time").focus();
    			  return false;
    		  }
    	  }, error:function(err){
    		  console.log(err);
    	  }
      }) */
}
</script>
</head>
<body>
   <jsp:include page="../top_navbar.jsp"></jsp:include>
   <div class="divA container" style="width: 100%; height: 100%; text-align:center">
   <h1 style="padding-left: 20px; font: bold; text-align:left">예약하기</h1>
      <div class="divB" style="width: 49%; display: inline-block;">
         <div class="divC"
            style="width: 100%; border: 1px solid black; height: 100%;">
            <div class="divD">
               <img src="../../resources/image_gym/${view.img}" style="width: 100%;">
            </div>
            <div class="divD">
               <p style="font-size: 14px;">공간명 : ${view.name}</p>
               <p style="font-size: 14px;">${view.info}</p>
            </div>
         </div>
         <div class="divC"
            style="width: 100%; border: 1px solid black; height: 100%;">
            <div class="div_c">
               <p style="font-size: 14px;">예약자 정보</p>
               <p style="font-size: 14px;">이름 : ${guestInfo.nickName}</p>
               <p style="font-size: 14px;">연락처 : ${guestInfo.tel}</p>
               <p style="font-size: 14px;">이메일 : ${guestInfo.email}</p>
            </div>
         </div>
         <div class="divC"
            style="width: 100%; border: 1px solid black; height: 100%;">
            <p style="font-size: 14px;">대표자 : ${hostInfo.ceo}</p>
            <p style="font-size: 14px;">연락처 : ${hostInfo.tel}</p>
            <p>주소 : ${hostInfo.address_1 } ${hostInfo.address_2 }</p>
         </div>

      </div>
      <div class="divB" style="width: 49%; display: inline-block;">
      	<form name="myform" id="myform" action="/resv/resvInsert" method="POST">
            <div class="divC" style="width: 100%; border: 1px solid black; height: 100%;">
               <input type="hidden" name="gym_id" value="${view.id}" id="gym_id">
               <input type="hidden" name="price" value="${view.price}" id="price">
               <input type="hidden" name="user_id" value="${guestInfo.id}">
               <span>예약날짜 :</span> <input type="text" id="datepicker" name="resv_date" onchange="dateChange();" placeholder="날짜 선택" readonly><br>
               <span>예약시간 : </span>
               <input type="text" class="div_time" readonly id="resv_time"> ~ <input type="text" class="div_time" readonly id="resv_time_2">
               <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group me-2" role="group" aria-label="First group" style="overflow-x: auto;">
				  	<c:forEach var="i" begin="${view.open_time}" end="${view.close_time}">
				  		<fmt:formatNumber var ="time" minIntegerDigits="2" value="${i}" type="number"/>
					    <input type="checkbox" class="btn-check" id="resv_time_${i}" value="${i}">
						<label class="btn btn_resv_time" id="label_${i}" for="resv_time_${i}" onclick="resv_checked(${i});">${time}</label>
					</c:forEach>
				  </div>
				</div>
				<input type="hidden" name="resv_time" required>
				<input type="hidden" name="resv_time_2" required>
				<fmt:formatNumber var ="open" minIntegerDigits="2" value="${view.open_time}" type="number"/>
				<fmt:formatNumber var ="close" minIntegerDigits="2" value="${view.close_time}" type="number"/>
               <span class="text-red">운영시간 ${open}시 ~ ${close}시</span>
               <p>최대인원 : ${view.people_num} 명</p>
            </div>
            <div class="divC" style="width: 100%; border: 1px solid black; height: 100%; text-align:right;">
               <p style="font-size: 14px;">시간당 이용금액 : <fmt:formatNumber value="${view.price}" pattern="#,###"/> 원</p>
               <p style="font-size:20px;font-weight:bold;">총 결제금액</p>
               <input type="text" readonly id="priceText">
               <input type="button" value="예약하기" class="btn btn-primary" onclick="frmSub();">
            </div>
      	</form>
      </div>
   </div>
</body>
</html>