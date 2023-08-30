<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/css/review.css">
<script type="text/javascript">
function goReviewView(id, gym_id){
	location.href = '/review/reviewView?id='+id+'&gym_id='+gym_id;
}
function reviewDel(id){
	conf = confirm("리뷰를 삭제하시겠습니까?");
	if(conf){
		$.ajax({
			url:'/review/reviewDel',
			type:'POST',
			data:{"id":id},
			success:function(data){
				if(data == "Y"){
					alert("리뷰가 삭제되었습니다.");
					location.reload();
				}else{
					alert("리뷰삭제에 실패했습니다");
				}
			}
		})
	}
}
</script>
</head>
<body>
   <jsp:include page="../top_navbar.jsp"></jsp:include>
   <div class="container"style="padding-top:50px">
   <h1>내 리뷰</h1>
      <div class="row">
         <div class="col-12">
            	<c:if test="${empty list}">
               		<div style="text-align: center;">
	               		<h3>작성한 리뷰가 없습니다.</h3>
    					<img src="/resources/image/noData.png">           		
               		</div>
               	</c:if>
            	<c:forEach items="${list}" var="list">
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
			               <div style="width:80%; display:inline-block" onclick="goReviewView(${list.id}, ${list.gym_id});">
								<label>${list.gym_name }</label>
			               		<p>${list.content}</p>
			               </div>
			               <div style="width:19%; display:inline-block; float:right; text-align:right">
			               		<input type="button" class="btn btn-danger" value="삭제" onclick="reviewDel(${list.id});">
			               </div>
		               </li>
		            </ul>
            	</c:forEach>
               
         </div>
      </div>
   </div>
</body>
</html>