<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 회원관리</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.table{font-size:15px; margin-top:20px;}
.table th, .table td{text-align: center;}
.table tbody tr:hover {
	cursor:pointer;
	background-color:lightgray;
}
.table_div{
	display:none;
}
.table_div.show{
	display:block;
}
</style>
<script>
function goHost_info(id){
	location.href = "/admin/hostInfo?id="+id;
}

function hostList(state){
	if(state == 1){
		document.querySelector("#list1").className = "nav-link active";
		document.querySelector("#list_1").className = "table_div show";
		document.querySelector("#list2").className ="nav-link";
		document.querySelector("#list_2").className = "table_div";
		document.querySelector("#list0").className ="nav-link";
		document.querySelector("#list_0").className = "table_div";
	}else if(state ==2){
		document.querySelector("#list2").className ="nav-link active";
		document.querySelector("#list_2").className = "table_div show";
		document.querySelector("#list1").className ="nav-link";
		document.querySelector("#list_1").className = "table_div";
		document.querySelector("#list0").className ="nav-link";
		document.querySelector("#list_0").className = "table_div";
	}else{
		document.querySelector("#list0").className ="nav-link active";
		document.querySelector("#list_0").className = "table_div show";
		document.querySelector("#list2").className ="nav-link";
		document.querySelector("#list_2").className = "table_div";
		document.querySelector("#list1").className ="nav-link";
		document.querySelector("#list_1").className = "table_div";
	}
	
}

</script>
<body>
<jsp:include page="../admin_navbar.jsp"></jsp:include>
	<div class="host_div">
		<h1>호스트 목록</h1>
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" id="list1" onclick="hostList(1);">승인완료</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="list2" onclick="hostList(2);">승인대기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="list0" onclick="hostList(0);">승인반려</a>
		  </li>
		</ul>
		<div style="overflow-x: scroll;" id="list_1" class="table_div show">
			<table class="table" style="width:140%">
			  <thead>
			    <tr>
			      <th scope="col">유저번호</th>
			      <th scope="col">상호</th>
			      <th scope="col">대표자</th>
			      <th scope="col">주소</th>
			      <th scope="col">이메일</th>
			      <th scope="col">연락처</th>
			      <th scope="col">가입일자</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			     <c:forEach var="member" items="${hostList}">
			        <tr onclick ="goHost_info(${member.id});">
			         <th scope="row">${member.id}</th>
			         <td>${member.nickName}</td>
			         <td>${member.ceo}</td>
			         <td>${member.address_1} ${member.address_2}</td>
			         <td>${member.email}</td>
			         <td>${member.tel}</td>
			         <td>${member.created_at}</td>
			         <td>
			         	<c:if test='${member.isUse == 1}'>
			         		사용중
			         	</c:if>
			         	<c:if test='${member.isUse == 0}'>
			         		탈퇴
			         	</c:if>
			         </td>
			         
			       </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
		<div style="overflow-x: scroll;"id="list_2" class="table_div">
			<table class="table" style="width:140%">
			  <thead>
			    <tr>
			      <th scope="col">유저번호</th>
			      <th scope="col">상호</th>
			      <th scope="col">대표자</th>
			      <th scope="col">주소</th>
			      <th scope="col">이메일</th>
			      <th scope="col">연락처</th>
			      <th scope="col">가입일자</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			     <c:forEach var="member" items="${hostList_wait}">
			        <tr onclick ="goHost_info(${member.id});">
			         <th scope="row">${member.id}</th>
			         <td>${member.nickName}</td>
			         <td>${member.ceo}</td>
			         <td>${member.address_1} ${member.address_2}</td>
			         <td>${member.email}</td>
			         <td>${member.tel}</td>
			         <td>${member.created_at}</td>
			         <td>
			         	<c:if test='${member.isUse == 1}'>
			         		사용중
			         	</c:if>
			         	<c:if test='${member.isUse == 0}'>
			         		탈퇴
			         	</c:if>
			         </td>
			         
			       </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
		<div style="overflow-x: scroll;"id="list_0" class="table_div">
			<table class="table" style="width:140%">
			  <thead>
			    <tr>
			      <th scope="col">유저번호</th>
			      <th scope="col">상호</th>
			      <th scope="col">대표자</th>
			      <th scope="col">주소</th>
			      <th scope="col">이메일</th>
			      <th scope="col">연락처</th>
			      <th scope="col">가입일자</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			     <c:forEach var="member" items="${hostList_reject}">
			        <tr onclick ="goHost_info(${member.id});">
			         <th scope="row">${member.id}</th>
			         <td>${member.nickName}</td>
			         <td>${member.ceo}</td>
			         <td>${member.address_1} ${member.address_2}</td>
			         <td>${member.email}</td>
			         <td>${member.tel}</td>
			         <td>${member.created_at}</td>
			         <td>
			         	<c:if test='${member.isUse == 1}'>
			         		사용중
			         	</c:if>
			         	<c:if test='${member.isUse == 0}'>
			         		탈퇴
			         	</c:if>
			         </td>
			         
			       </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
		
	</div>
</body>
</html>