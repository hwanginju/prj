<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<title>guest_login</title>
</head>
<style>
.mb-3{
   padding:20px;
}
.form-label{
   vertical-align:middle;
}
</style>
<body class="text-center">

   <main class="form-signin w-100 m-auto">
     <form name="host_login_form">
       
       
       <div style="width:40%; margin:auto; padding:100px 0 65px 0">
          <h1 class="h3 mb-3 fw-normal">호스트 로그인</h1>
          <div class="mb-3">
           <label for="formGroupExampleInput" class="form-label">Email</label>
           <input type="text" class="form-control" id="formGroupExampleInput" name="email" placeholder="Email" style="width:70%; float:right">
         </div>
          <div class="mb-3">
           <label for="formGroupExampleInput" class="form-label">Password</label>
           <input type="text" class="form-control" id="formGroupExampleInput" name="pwd" placeholder="Password" style="width:70%; float:right">
         </div>
         <div class="mb-3">
             <button class="w-100 btn btn-lg btn-primary" type="button" style="width:30%; margin-top:20px; float:right;">로그인</button>
         </div>
       </div>
   
       
       
     </form>
   </main>

</body>
</html>