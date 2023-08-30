<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설 목록</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.table {
	font-size: 15px;
	margin-top: 20px;
}

.table th, .table td {
	text-align: center;
}

.table tbody tr:hover {
	cursor: pointer;
	background-color: lightgray;
}
</style>
<link rel="stylesheet" href="../../resources/css/modalStyle.css">
<link rel="stylesheet" href="../../resources/css/review.css">
<script src="../../resources/js/modal.js"></script>
<script src="../../resources/js/pwdEdit.js"></script>
<script>
   function gogymDetail(id){
      location.href ="/admin/gymDetail?gym_id="+id
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
	                  $('#ul_'+id).hide();
	               }else{
	                  alert("리뷰삭제에 실패했습니다");
	               }
	            }
	         })
	      }
	   }

   
   function reviewList(gymId){
	   $.ajax({
		   type:"POST",
	   	   url:'/admin/reviewList',
	   	   data:{"id":gymId},
	   	success:function(data){
            $('#reviewList').html('');
            if(data.length == 0){
               let temp = `<p>등록된 리뷰가 없습니다.</p>`
               $('#reviewList').append(temp);
            }
            data.forEach((list, index) =>{
               let temp = 
                  `<ul class="list-group" id="ul_`+list.id+`">
                    <li class="list-group-item">
                       <div>
                          <div>`
                              +`<span style="font-weight:bold;">`+list.nickname+`</span>`
                              +`<span style="float: right;">`+list.created_at+`</span>
                          </div>
                           <fieldset>
                              <input type="radio" class="pointstar point`+list.id+`5" value="5" id="rate1"onclick="return false;">
                              <label for="rate1">★</label>
                              <input type="radio" class="pointstar point`+list.id+`4" value="4" id="rate2"onclick="return false;">
                              <label for="rate2">★</label>
                              <input type="radio" class="pointstar point`+list.id+`3" value="3" id="rate3"onclick="return false;">
                              <label for="rate3">★</label>
                              <input type="radio" class="pointstar point`+list.id+`2" value="2" id="rate4" onclick="return false;">
                              <label for="rate4">★</label>
                              <input type="radio" class="pointstar point`+list.id+`1" value="1" id="rate5" onclick="return false;">
                           <label for="rate5">★</label>
                        </fieldset>
                       <div style="width:80%; display:inline-block">`
                          +`<p>`+list.content+`</p>
                        </div>
                        <div style="width:19%; display:inline-block; float:right; text-align:right">
                              <input type="button" class="btn btn-danger" value="삭제" onclick="reviewDel(`+list.id+`);">
                        </div>
                    </li>
                 </ul>`;
                 $('#reviewList').append(temp);
                 $('.point'+list.id+list.point).prop('checked', true);
            });
            modalshow();
         }

	   	   
	   	   
	   
	   })
   }
   
</script>
<body>
	<jsp:include page="../admin_navbar.jsp"></jsp:include>
	<div class="host_div">
		<h1>시설 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">상호명</th>
					<th scope="col">시설명</th>
					<th scope="col">연락처</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<th scope="row">${list.id}</th>
						<td onclick="gogymDetail(${list.id});">${list.hostname}</td>
						<td onclick="gogymDetail(${list.id});">${list.name}</td>
						<td onclick="gogymDetail(${list.id});">${list.tel}</td>
						<td onclick="gogymDetail(${list.id});">${list.address_1} ${list.address_2}</td>
						<td>
							<button id="show" class="btn btn-success" onclick="reviewList(${list.id});">리뷰</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 리뷰리스트 팝업 -->
      <div class="background">
        <div class="window">
          <div class="popup" style="width: 60%;">
             <div style="float:right; display: inline-block;font-size: 10px;padding:0">
                <button id="close" onclick="modalclose();">X</button>
             </div>
             <h3>리뷰</h3>
             <div id="reviewList" style="overflow-y: scroll;max-height:400px;">
             </div>
          </div>
        </div>
      </div>

	</div>
</body>
</html>