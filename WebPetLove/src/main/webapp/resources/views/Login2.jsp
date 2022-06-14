<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
	<title>Đăng Nhập</title>
   <!--Made with love by Mutiullah Samim -->
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link href="/resources/css/Login2.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
     <%
            User user = new User();
            if (session.getAttribute("user") != null) {
                user = (User) session.getAttribute("user");

            } else {
                user.setUserEmail("");
            }
        %>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Đăng Nhập</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
				<%if (session.getAttribute("error") != null) {%>         
	            <div class="errorLogin">                            
	              <p style="color:red"><%=session.getAttribute("error")%></p>
	              <%session.removeAttribute("error"); %>         
	            </div>                               
	            <%}%>
             <div>
			<div class="card-body">
				<form action="/user/login" method="POST">
				
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="email" class="form-control" placeholder="Email" name="email" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="Mật Khẩu" name="password" required>
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Nhớ lựa chọn của tôi
					</div>
					<div class="form-group">
						<input type="hidden" value="login" class="btn float-right login_btn" name="command">
						<input type="submit" value="Đăng Nhập" class="btn float-right login_btn" name ="login">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Bạn không có tài khoản?<a href="/shop/Register">Đăng Ký</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Bạn không nhớ mật khẩu</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>