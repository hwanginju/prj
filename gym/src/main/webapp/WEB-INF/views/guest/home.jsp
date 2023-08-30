<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쓰리고</title>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.card_div{
width: 90%;
margin: 0 5% 0 5%;
}
.card{
display: inline-flex;
width: 29%;
margin: 1.5%;
vertical-align: top;
}
.image_div{
border-radius: 100%;
width:90%;
background-size: 100%;
background-repeat: no-repeat;
background-position-y: center;
border: 1px solid gray;
margin: auto;
}
.card-img-top{
max-width:100%;
height:auto;
}
.image_div:after{
content: "";
display: block;
padding-bottom: 100%;
}
.image_div:hover, .card_div .card:hover{
cursor:pointer;
}
 #txt-info {
      display: -webkit-box;
      display: -ms-flexbox;
      display: box;
      margin-top:1px;
      height:45px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:2
  }
  #txt-address{
  		display: -webkit-box;
      display: -ms-flexbox;
      display: box;
      margin-top:1px;
      height:25px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:1
  }
</style>
<script>
function gymDetailView(id){
	$('#id').val(id);
	
	var f= $("#frm");
	f.attr("action", "/view");
	f.attr("method", "POST");
	f.submit();
	
}
function searchGym(data){
	location.href = "/searchGym?gym="+data
}


</script>
</head>
<body>
<jsp:include page="../top_navbar.jsp"></jsp:include>
<div>
   <h1 style="text-align: center; margin:30px 0; font-weight:bolder;font-size: 35px;">어떤 공간을 찾고있나요?</h1>
   
   <div class="card_div" style="padding:30px 0 60px">
      <div class="card" style="border:none">
         <div class="image_div" style='background-image:url("../../resources/image/basketball.jpg")' onclick="searchGym('농구');"></div>
      </div>
      
      <div class="card" style="border:none">
         <div class="image_div" style='background-image:url("../../resources/image/tennis.jpg")' onclick="searchGym('배드민턴/테니스');"></div>
      </div>
      
      <div class="card" style="border:none">
         <div class="image_div" style='background-image:url("../../resources/image/pingpong.jpg")' onclick="searchGym('탁구');"></div>
      </div>
   </div>
   
   <hr>
   
   <form id="frm">
   		<input type="hidden" value="" name="id" id="id">
	   <div class="card_div" style="padding: 60px 0;">
		   	<c:forEach items="${list}" var="list">
		      <div class="card" onclick="gymDetailView(${list.id});">
		      <div style="height: 250px;overflow: hidden;">
		        <img src="../../resources/image_gym/${list.img}" class="card-img-top" alt="...">
		      </div>
		        <div class="card-body">
		          <h5 class="card-title">${list.name}</h5>
		          <p class="card-text" id="txt-info">${list.info}</p>
		          <p class="card-text" id="txt-address">${list.address_1} ${list.address_2}</p>
		        </div>
		      </div>
		     </c:forEach>
	   </div>
   </form>
</div>

</body>
</html>