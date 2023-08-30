<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 시설 목록</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.table{font-size:15px; margin-top:20px;}
.table th, .table td{text-align: center; vertical-align: middle;}
.table tbody tr:hover {
   cursor:pointer;
   background-color:lightgray;
}
</style>
<link rel="stylesheet" href="../../resources/css/modalStyle.css">
<script src="../../resources/js/modal.js"></script>
<script src="../../resources/js/pwdEdit.js"></script>
<script>
   function gogymDetail(id){
      location.href ="/host/host_gym?gym_id="+id
   }
</script>
<body>
<jsp:include page="../left_navbar.jsp"></jsp:include>
   <div class="host_div">
      <h1>내 시설 목록</h1>
      <div>
		<input type="button" class="btn btn-primary" value="시설등록" onclick="location.href = '/host/gymInsert'">
      </div>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">NO</th>
            <th scope="col">시설명</th>
            <th scope="col">종목</th>
            <th scope="col">연락처</th>
            <th scope="col">주소</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
           <c:forEach items="${list}" var="list">
              <tr onclick="gogymDetail(${list.id});">
               <th scope="row">${list.id}</th>
               <td>${list.name}</td>
               <td>${list.type}</td>
               <td>${list.tel}</td>
               <td>${list.address_1} ${list.address_2}</td>
             	<td>
             		<button id="show" class="btn btn-success" onclick="modalshow();">리뷰</button>
             	</td>
             </tr>
          </c:forEach>
        </tbody>
      </table>
      
      <div class="background">
			<div class="window">
				<div class="popup">
					<div
						style="float: right; display: inline-block; font-size: 10px; padding: 0">
						<button id="close" onclick="modalclose();">X</button>
					</div>
					<h3>리뷰관리</h3>
					<div class="top_navbar">

						<div class="search_div">
							<form id="searchForm" action="/search" method="GET">
								<div class="input-group mb-3">
									<input type="text" name="keyword" class="form-control"
										aria-label="Text input with dropdown button"> <input
										type="submit" class="btn btn-primary" value="검색"
										style="width: 20%;">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
      	</div>
   </div>
</body>
</html>