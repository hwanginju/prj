<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게스트 회원관리</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.table{font-size:15px; margin-top:20px;}
.table th, .table td{text-align: center;}
.table tbody tr:hover {
	cursor:pointer;
	background-color:lightgray;
}
</style>
<script>
	function goGuest_info(id){
		location.href = "/admin/guestInfo?id="+id
	}
</script>
<body>
<jsp:include page="../admin_navbar.jsp"></jsp:include>
	<div class="host_div">
		<h1>게스트 목록</h1>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">유저번호</th>
		      <th scope="col">이메일</th>
		      <th scope="col">연락처</th>
		      <th scope="col">닉네임</th>
		      <th scope="col">가입일자</th>
		      <th scope="col">상태</th>
		    </tr>
		  </thead>
		  <tbody>
		     <c:forEach var="member" items="${guestList}">
		        <tr onclick="goGuest_info(${member.id});">
		         <th scope="row">${member.id}</th>
		         <td>${member.email}</td>
		         <td>${member.tel}</td>
		         <td>${member.nickName}</td>
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
</body>
</html>