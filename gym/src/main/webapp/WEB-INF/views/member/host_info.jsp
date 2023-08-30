<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.host_div{
margin:auto;
}
.host_div div{
padding:15px 5px;
}
.host_div .sub_div .btn{
height:35px;
font-size:15px;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../../resources/css/modalStyle.css">
<script src="../../resources/js/modal.js"></script>
<script src="../../resources/js/pwdEdit.js"></script>
<script type="text/javascript">
function frmSub(){
	var cf = confirm("정보를 수정하시겠습니까?");
	if(cf){
		var data = $("#hostInfoForm").serialize();
		$.ajax({
			url:"/member/hostInfoEdit",
			type:"POST",
			data:data,
			success: function(data){
				if(data == "Y"){
					alert("수정되었습니다");
				}else{
					alert("수정이 실패했습니다.");
				}
				location.href = "/member/hostInfo";
			}
		})
	}
}

function del(){
	   var cf = confirm("회원 탈퇴 하시겠습니까?");
	   if(cf){
	      $.ajax({
	         url:"/member/member_delete",
	         method:"POST",
	         data:{
	            "id" : ${hostInfo.id}
	         },success:function(data){
	        	 if(data == "Y"){
	        		 alert('안녕히가세요.');
	        		 location.href = "/";
	        	 }else{
	        		 alert("회원탈퇴에 실패하셨습니다.");
	        		 location.href = "/member/hostInfo"
	        	 }
	         }
	      })
	   }
}

window.onload = function(){
    document.getElementById("address_1").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        console.log('address');
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_1").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
<body>
<jsp:include page="../left_navbar.jsp"></jsp:include>
<div class="host_div">
	<h1>내 정보</h1>
	<button id="show" class="btn btn-danger" onclick="modalshow();">비밀번호 수정</button>
	<form id="hostInfoForm">
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">이메일</label>
		    <input type="text" class="form-control" id="email" readonly value="${hostInfo.email }">
		  </div>
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">상호명</label>
		    <input type="text" class="form-control" readonly id="nickname"name="nickName"value="${hostInfo.nickName }">
		  </div>
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">대표자</label>
		    <input type="text" class="form-control" readonly id="ceo"name="ceo"value="${hostInfo.ceo }">
		  </div>
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">주소</label>
		    <input type="text" class="form-control" id="address_1" name="address_1" value="${hostInfo.address_1 }">
		  </div>
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">상세주소</label>
		    <input type="text" class="form-control" id="address_2" name="address_2"value="${hostInfo.address_2 }">
		  </div>
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">연락처</label>
		    <input type="text" class="form-control" id="tel" name="tel"value="${hostInfo.tel }">
		  </div>
		  
		  <div class="col-md-12">
		    <label for="inputAddress" class="form-label">사업자등록증</label>
		    <div style="width:200px;">
		    	<img src="../../resources/image_businessReg/${hostInfo.businessReg}" style="width: 100%;">
		    </div>
		  </div>
		  
		  <div class="col-md-12 sub_div">
		  	<button type="button" class="btn btn-danger" style="float:right; margin-left:10px;" onclick="del();">회원탈퇴</button>
		    <button type="button" class="btn btn-primary" onclick="frmSub();" style="float:right">정보수정</button>
		  </div>
	</form>
	
	
	<div class="background">
	  <div class="window">
	    <div class="popup">
	    	<div style="float:right; display: inline-block;font-size: 10px;padding:0">
		    	<button id="close" onclick="modalclose();">X</button>
	    	</div>
	    	<h3>비밀번호 수정</h3>
	    	<div>
		    	<label style="width: 110px;">비밀번호</label>
		    	<input type="password" name= "pwd" id="pwd">
	    	</div>
	    	<div>
		    	<label style="width: 110px;">비밀번호 확인</label>
		    	<input type="password" id="pwdChk">
	    	</div>
	    	<div>
				<button id="sub" onclick ="pwdEdit(${hostInfo.id});">수정</button>	    	
	    	</div>
	    </div>
	  </div>
	</div>
  
</div>
</body>
</html>