<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gymDetail</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/css/review.css">
</head>
<style>
.col{
padding:20px;
}

.resv_btn{
width: 100%;
margin-top: 20px;
height: 40px;
font-size:15px;
}

.gymInfo_div, .map_div{
min-height: 200px;
}
label{
	margin-bottom: 10px;
	font-weight:bold;
	
}

</style>
<body>
<jsp:include page="../top_navbar.jsp"></jsp:include>
<form id="frm">
   <div class="container" style="padding-top:50px">
      <h2 style="text-align: left;">${view.name}</h2>
      <div class="row" style="padding-top:20px;">
         <div class="col col-sm-8">
         	<div style="height:400px; width:100%;">
	            <img src="../../resources/image_gym/${view.img}" style="max-height: 100%; width:auto;">
         	</div>
            <div class="col gymInfo_div">
               <label>공간소개</label>
               <p>${view.info }</p>
            </div>
            <div class="col map_div">
            	<label>주소</label>
            	<p>${view.address_1} ${view.address_2}</p>
            	<div id="map" style="width:100%;height:400px;"></div>
            </div>
            <div class="col review_div">
            	<label>리뷰</label>
            	<c:forEach items="${reivewList}" var="list">
            		<ul class="list-group">
		               <li class="list-group-item">
			               <div>
			               		<fieldset>
									<input type="radio" class="pointstar" name="point${list.id}" 
										<c:if test='${list.point == 5}'>
											checked
										</c:if>
									value="5" id="rate${list.id}1"onclick="return false;">
									<label for="rate${list.id}1">★</label>
									<input type="radio" class="pointstar" name="point${list.id}" 
										<c:if test='${list.point == 4}'>
											checked
										</c:if>
									value="4" id="rate${list.id}2"onclick="return false;">
									<label for="rate${list.id}2">★</label>
									<input type="radio" class="pointstar" name="point${list.id}" 
										<c:if test='${list.point == 3}'>
											checked
										</c:if>
									value="3" id="rate${list.id}3"onclick="return false;">
									<label for="rate${list.id}3">★</label>
									<input type="radio" class="pointstar" name="point${list.id}" 
										<c:if test='${list.point == 2}'>
											checked
										</c:if>
									value="2" id="rate${list.id}4" onclick="return false;">
									<label for="rate${list.id}4">★</label>
									<input type="radio" class="pointstar" name="point${list.id}" 
										<c:if test='${list.point == 1}'>
											checked
										</c:if>
									value="1" id="rate${list.id}5" onclick="return false;">
									<label for="rate${list.id}5">★</label>
								</fieldset>
								<span style="float: right;">${list.created_at}</span>
			               </div>
			               <div>
			               		<p>${list.content}</p>
			               </div>
		               </li>
		            </ul>
            	</c:forEach>
            </div>
         </div>
            
         <div class="col col-sm-4">
            <div style="border:1px solid gray;padding:10px;">
               <label>
                  주소
               </label>
               <p>${view.address_1} ${view.address_2}</p>
            </div>
            
            <div style="border:1px solid gray; padding:10px;margin-top:10px">
               <label>
                  공간유형
               </label>
               <p>${view.type}</p>
               
               <label>
                  수용인원
               </label>
               <p>${view.people_num} 명</p>
            </div>
            <div style="border:1px solid gray; padding:10px;margin-top:10px">
               <label>
                  영업시간
               </label>
               <p>${view.open_time} ~ ${view.close_time }</p>
               <label>
                  가격
               </label>
               <p><fmt:formatNumber value="${view.price }" pattern="#,###"/> 원</p>
            </div>
            
            <input type="button" value="예약하기" onclick="goResv(${view.id});" class="resv_btn btn btn-primary">
         
         </div>
      </div>
   </div>
</form>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f79e34bbbce07d0949388a4a86f46f0"></script>
<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(${view.y_geo}, ${view.x_geo}), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	});
	
	marker.setMap(map);
	

	function goResv(id){
	   if(<%=session.getAttribute("id")%> != null){
	      location.href = '/resv/resvDo?gym_id='+id;
	   }else{
	      alert("로그인이 필요합니다.");
	   }
	}
</script>
</html>