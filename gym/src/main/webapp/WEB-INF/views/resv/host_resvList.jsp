<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
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
.nav-item{cursor:pointer;}
.table{font-size:15px; margin-top:20px;}
.table th, .table td{text-align: center;}
</style>

<script>
function viewGymResv(id){
	if(id == 0){
		$(".table > tbody > tr").show();
	}else{
		$(".table > tbody > tr").hide();
		$('.tr_'+id).show();
	}
}
</script>
<body>
<jsp:include page="../left_navbar.jsp"></jsp:include>
   <div class="host_div">
      <h1>예약현황</h1>
		<ul class="nav nav-tabs">
		  <li class="nav-item" onclick="viewGymResv(0);">
		    <a class="nav-link active" id="list1">전체</a>
		  </li>
		  <c:forEach items="${gymList}" var="gym">
		  	<li class="nav-item" onclick="viewGymResv(${gym.id});">
		    	<a class="nav-link active" id="list1">${gym.name}</a>
		  	</li>
		  </c:forEach>
		</ul>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">NO</th>
            <th scope="col">시설명</th>
            <th scope="col">예약자명</th>
            <th scope="col">연락처</th>
            <th scope="col">예약일/시간</th>
            <th scope="col">결제금액</th>
            <th scope="col">예약현황</th>
          </tr>
        </thead>
        <tbody>
           <c:forEach var="list" items="${list}">
              <tr class="tr_${list.gym_id }">
               <th scope="row">${list.id}</th>
               <td>${list.gym_name }</td>
               <td>${list.nickname}</td>
               <td>${list.tel}</td>
               <td>${list.resv_date} / <fmt:formatNumber minIntegerDigits="2" value="${list.resv_time}" type="number"/>시 ~ <fmt:formatNumber minIntegerDigits="2" value="${list.resv_time_2}" type="number"/>시</td>
               <td><fmt:formatNumber value="${list.price}" pattern="#,###"/>원</td>
               <td>
                   <c:if test="${list.state eq 0}">
                        <span class="span_cancel">예약취소</span>
                     </c:if>
                     <c:if test="${list.state eq 1}">
                        <span class="span_resv">예약완료</span>
                  	</c:if>
                  	<c:if test ="${list.state eq 2 }">
                  		<span class="span_done">사용완료</span>	
                  	</c:if>
               </td>
             </tr>
          </c:forEach>
        </tbody>
      </table>
   </div>
</body>
</html>