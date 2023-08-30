/**
 * 
 */
 
function pwdEdit(id){
 	var pwd = $("#pwd").val();
	var pwdChk = $("#pwdChk").val();
	
	if(pwd != pwdChk){
		alert("비밀번호가 일치하지않습니다.");
		$("#pwdChk").focus();
	}else{
		$.ajax({
			url:"/member/memberPwdEdit",
			type:"post",
			data:{id, pwd},
			success: function(data){
				if(data == "Y"){
					alert("수정했습니다.");
					modalclose();
				}else{
					alert("수정에 실패했습니다.");
				}
			}
		})
	}
}
 
 