<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수수료</title>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.nav-link:hover{
cursor:pointer;
}
</style>
</head>
<body>
   <jsp:include page="../admin_navbar.jsp"></jsp:include>
   
   <div class="host_div">
      <h1>수수료</h1>
      <div class="wrapper">
         <div class="content">
            <div id="bar_years">
               <ul class="nav nav-tabs">
                  <c:forEach items="${feeYear}" var="yearsList">
                     <li class="nav-item">
                        <a class="nav-link" id="year${yearsList.incomeY}"
                        onclick="location.href='/admin/fee?incomeY=${yearsList.incomeY}'">
                           ${yearsList.incomeY}년 / 총 <fmt:formatNumber value="${yearsList.income}" pattern="#,###"/>원
                        </a>
                        </li>
                  </c:forEach>
               </ul>
            </div>
            <canvas id="bar-chart" width="80%"></canvas>
         </div>
      </div>
   <div>
      <h2>호스트별 수수료 현황</h2>
      <table class=table border="1">
         <thead>
            <tr>
               <th scope="col">NO</th>
               <th scope="col">상호명</th>
               <th scope="col">수수료</th>
               <th scope="col">예약건수</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach items="${feeList}" var="list">
            <tr>
               <th scope="row">${list.host_id}</th>
               <td>${list.nickname}</td>
               <td><fmt:formatNumber value="${list.income}" pattern="#,###"/>원</td>
               <td>${list.cnt }</td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
   </div>
</div>
   
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>

$(function(){
   
   document.querySelector('#year'+${list[0].incomeY}).className ="nav-link active";
   
   var month = [];
   var income = [];
   for(i=1; i<13; i++){
      month.push(i+'월');
      income.push(0);
   }
   <c:forEach items="${list}" var="list">
      for(i=1; i<=month.length; i++){
         if(${list.incomeM} == i){
            console.log(${list.incomeM});
            income[i-1]=(Number('${list.income}'));
         }
      }
   </c:forEach>
   
      console.log(month , income);
   //Bar chart
   new Chart(document.getElementById("bar-chart"), {
       type: 'bar',
       data: {
         labels: month,
         datasets: [
           {
             label: "월 수수료 (원)",
             backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850",'#ff69b4','#7b68ee','#ff8c00','#008b8b', '#ff77ff','#800080','#483d8b'],
             data: income
           }
         ]
       },
       options: {
         legend: { display: false },
         title: {
           display: true,
           text: '월 수수료'
         }
       }
   })
});

</script>

</html>