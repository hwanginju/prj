<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게스트 예약관리</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.list-group{
   margin:10px;
}
.list-group-item{
	cursor:pointer
}
.date_div{
   padding:10px 0;
}
.btn_div{
   display: inline-block;
    float: right;
    width: 10%;
}
.btn_div button{
   width: 100%;
    font-size: 15px;
}
.span_cancel{
	color : red;
	font-weight:bold;
	padding-left:10px;
}
.span_done{
	color:gray;
	font-weight:bold;
	padding-left:10px;
}
.span_resv{
	color: blue;
	font-weight:bold;
	padding-left:10px;
}
</style>

<script>
function resv_cancel(id){
   var cf = confirm("예약을 취소하시겠습니까 ?");
   if(cf){
      $.ajax({
         url:"/resv/resvCancel",
         type:"POST",
         data: {"id":id},
         success: function(data){
            if(data == "Y"){
               alert("취소되었습니다.");
               location.href="/resv/resvList";
            }
               
         }
      })
   }
}
function gymDetailView(id){
	location.href = '/gymDetail?id='+id;
}
</script>
<body>
   <jsp:include page="../top_navbar.jsp"></jsp:include>
   <div class="container"style="padding-top:50px">
   <h1>내 예약</h1>
      <div class="row">
         <div class="col-12">
               	<c:if test="${empty list}">
               		<div style="text-align: center;">
	               		<h3>예약내역이 없습니다.</h3>
    					<img src="/resources/image/noData.png">           		
               		</div>
               	</c:if>
               <c:forEach items="${list}" var="list">
                  <ul class="list-group">
                     <li class="list-group-item">
                     <div class="date_div"onclick="gymDetailView(${list.gym_id});">
                        <span style="font-weight:bold;">
                           예약일: ${list.resv_date} / 
                           <fmt:formatNumber var ="time" minIntegerDigits="2" value="${list.resv_time}" type="number"/>
                           <fmt:formatNumber var ="time2" minIntegerDigits="2" value="${list.resv_time_2}" type="number"/>
                           ${time}시 ~ ${time2}시
                        </span>
                        <c:if test="${list.state eq 0}">
	                        <span class="span_cancel">예약취소</span>
	                     </c:if>
	                     <c:if test="${list.state eq 2}">
	                     	<span class="span_done">사용완료</span>
	                     </c:if>
	                     <c:if test="${list.state eq 1}">
	                     	<span class="span_resv">예약완료</span>
	                     </c:if>
                        <span style="float:right">결제일: ${list.pay_date}</span> <br>
                     </div>
                     <div style="display:inline-block; width:80%;"onclick="gymDetailView(${list.gym_id});">
	                     <label>${list.gym_name}</label>
                     </div>
                     <c:if test="${list.state eq 1}">
                     	<c:if test="${list.reviewYN eq 0 && list.resvDone ne 0}">
	                        <div class="btn_div">
	                              <button type="button" class="btn btn-danger"
	                                 onclick="resv_cancel(${list.id});">예약취소</button>
	                        </div>
	                    </c:if>
                     </c:if>
	                     <c:if test="${list.reviewYN eq 0 && list.state eq 2}">
	                        <div class="btn_div">
	                           <button type="button" class="btn btn-primary"
	                              onclick="window.location='/review/reviewWrite?gym_id=${list.gym_id}&resv_id=${list.id}'">리뷰쓰기</button>
	                        </div>
	                     </c:if>
                     
                     
                     </li>
                  </ul>
               </c:forEach>
         </div>
      </div>
   </div>
</body>
</html>