<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.nav-link:hover{
cursor:pointer;
}
</style>
<body>
	<jsp:include page="../left_navbar.jsp"></jsp:include>
	
	<div class="host_div">
		<h1>수익</h1>
		<div class="wrapper">
		   <div class="content">
				<div id="bar_years">
					<ul class="nav nav-tabs">
						<c:forEach items="${incomeYears}" var="yearsList">
						  <li class="nav-item">
						    <a class="nav-link" id="year${yearsList.incomeY}" 
						    onclick="location.href = '/host/hostIncome?incomeY=${yearsList.incomeY}'">
						    	${yearsList.incomeY}년 / 총 <fmt:formatNumber value="${yearsList.income}" pattern="#,###"/>원
						    </a>
						  </li>
						</c:forEach>
					</ul>
				</div>		   
		       <canvas id="bar-chart" width="80%"></canvas>
		   </div>
		</div>
	</div>
	
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>

$(function(){
	
	document.querySelector('#year'+${income[0].incomeY}).className ="nav-link active";
	
	var month = [];
	var income = [];
	for(i=1; i<13; i++){
		month.push(i+'월');
		income.push(0);
	}
	<c:forEach items="${income}" var="list">
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
	          label: "월 수익 (원)",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850",'#ff69b4','#7b68ee','#ff8c00','#008b8b', '#ff77ff','#800080','#483d8b'],
	          data: income
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: '월 수익'
	      }
	    }
	})
});

</script>

</html>