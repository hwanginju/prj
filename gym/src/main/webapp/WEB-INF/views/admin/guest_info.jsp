<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.memberInfo_div{
margin:auto;
width:60%;
padding: 50px 0 ;
}
.memberInfo_div div{
padding:15px 5px;
}
.memberInfo_div .sub_div .btn{
height:35px;
font-size:15px;
}
</style>
<link rel="stylesheet" href="../../resources/css/modalStyle.css">
<script src="../../resources/js/modal.js"></script>
<script src="../../resources/js/pwdEdit.js"></script>
<script type="text/javascript">

function frmSub(){
	var data = $("#frm").serialize();
	var rtn;
	rtn = confirm("정보를 수정하시겠습니까?");
	
	if(rtn){
		$.ajax({
			type:"POST",
			url:"/member/guestInfoEdit",
			data:data, 
			success: function(result){
				if(result == "Y"){
					alert ("수정되었습니다.");
				}else{
					alert("수정이 실패했습니다.");
				}
					location.href = "/admin/guestInfo?id="+${guestInfo.id};
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
	            "id" : ${guestInfo.id}
	         },success:function(data){
	        	 if(data == "Y"){
	        		 alert('회원탈퇴에 성공했습니다.');
	        		 location.href = "/admin/guestList";
	        	 }else{
	        		 alert("회원탈퇴에 실패하셨습니다.");
	        		 location.href = "/admin/guestList";
	        	 }
	         }
	      })
	   }
}
</script>
<body>
<jsp:include page="../admin_navbar.jsp"></jsp:include>

<div class="memberInfo_div host_div">
	<h1>게스트 정보</h1>
	<button id="show" class="btn btn-danger" onclick="modalshow();">비밀번호 수정</button>
	<form id= "frm">
	  <div class="col-md-12">
	    <label for="inputAddress" class="form-label">이메일</label>
	    <input type="text" class="form-control" id="email" name="email" readonly value="${guestInfo.email}">
	  </div>
	  <div class="col-md-12">
	    <label for="inputAddress" class="form-label">닉네임</label>
	    <input type="text" class="form-control" id="nickname" name="nickName" value="${guestInfo.nickName}">
	  </div>
	  <div class="col-md-12">
	    <label for="inputAddress" class="form-label">연락처</label>
	    <input type="text" class="form-control" id="tel" name="tel"value="${guestInfo.tel}">
	  </div>
	  <div class="col-md-12 sub_div">
	  	<button type="button" class="btn btn-danger" style="float:right; margin-left:10px;" onclick="del();">회원탈퇴</button>
	    <button type="button" class="btn btn-primary" style="float:right" onclick="frmSub();">정보수정</button>
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
				<button id="sub" onclick ="pwdEdit(${guestInfo.id});">수정</button>	    	
	    	</div>
	    </div>
	  </div>
	</div>
  
</div>


</body>
</html>