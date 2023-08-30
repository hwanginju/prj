<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<style>
.card_div{
width: 90%;
margin: 0 5% 0 5%;
}
.card{
display: inline-flex;
width: 26%;
margin: 1.5%;
vertical-align: top;
}
.image_div:hover, .card_div .card:hover{
	cursor:pointer;
}
.card-img-top{
max-width:100%;
height:auto;
}
 #txt-info {
      display: -webkit-box;
      display: -ms-flexbox;
      display: box;
      margin-top:1px;
      height:45px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:2
  }
  #txt-address{
  		display: -webkit-box;
      display: -ms-flexbox;
      display: box;
      margin-top:1px;
      height:25px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:1
  }
</style>
<script type="text/javascript">
function gymDetailView(id){
	$('#id').val(id);
	
	var f= $("#frm");
	f.attr("action", "/view");
	f.attr("method", "POST");
	f.submit();
	
}
</script>
<body>
<jsp:include page="../top_navbar.jsp"></jsp:include>

<div style="padding-top:50px">
	<form id="frm">
   		<input type="hidden" value="" name="id" id="id">
	   <div class="card_div">
	   <h1>검색</h1>
	   <c:if test="${not empty search}">
		   <c:forEach items="${search}" var="search">
		      <div class="card" onclick="gymDetailView(${search.id});">
		      	<div style="height: 250px;overflow: hidden;">
			        <img src="../../resources/image_gym/${search.img}" class="card-img-top" alt="...">
		      	</div>
		        <div class="card-body">
		          <h5 class="card-title">${search.name}</h5>
		          <p class="card-text" id="txt-info">${search.info}</p>
		          <p class="card-text" id="txt-address">${search.address_1} ${search.address_2}</p>
		        </div>
		      </div>
		    </c:forEach>
	   </c:if>
	   <c:if test="${not empty searchGym}">
		   <c:forEach items="${searchGym}" var="search">
		      <div class="card" onclick="gymDetailView(${search.id});">
			      <div style="height: 250px;overflow: hidden;">
			        <img src="../../resources/image_gym/${search.img}" class="card-img-top" alt="...">
			      </div>
		        <div class="card-body">
		          <h5 class="card-title">${search.name}</h5>
		          <p class="card-text" id="txt-info">${search.info}</p>
		          <p class="card-text" id="txt-address">${search.address_1} ${search.address_2}</p>
		        </div>
		      </div>
		    </c:forEach>
	   </c:if>
	      
	   </div>
   </form>
</div>



</body>
</html>