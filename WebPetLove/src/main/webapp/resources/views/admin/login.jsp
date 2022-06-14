<%@page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="/resources/css/mos-style.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Login</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="icon" href="/resources/images_admin/fevicon.png" type="image/png" />
      <link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
      <link rel="stylesheet" href="/resources/css_admin/style.css" />
      <link rel="stylesheet" href="/resources/css_admin/responsive.css" />
      <link rel="stylesheet" href="/resources/css_admin/colors.css" />
      <link rel="stylesheet" href="/resources/css_admin/bootstrap-select.css" />
      <link rel="stylesheet" href="/resources/css_admin/perfect-scrollbar.css" />
      <link href="/resources/css/ThongTincaNhan.css" rel="stylesheet"
	type="text/css" media="all">
<script src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/jquery-ui.css">
<script type="text/javascript"
	src="/resources/js/bootstrap-3.1.1.min.js"></script>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link href="/resources/css/animate.min.css" rel="stylesheet">
    </head>
<body class="inner_page login">
        <%
            User user = new User();
            if (session.getAttribute("useradmin") != null) {
                user = (User) session.getAttribute("useradmin");

            } else {
                user.setUserEmail("");
            }
        %>

<!--         <div id="header">
            <div class="inHeaderLogin"></div>
        </div> -->

 <%--        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form method="POST" action="/admin/login">
                    <%if (session.getAttribute("error") != null) {%>         
                    <div>                            
                        <p style="color:red"><%=session.getAttribute("error")%></p>         
                    </div>                               
                    <%}%>
                    <div>
                        <input type="email" placeholder="Email " name="email" required >
                        <input type="password" placeholder="Mật Khẩu" name="password" required >                            
                    </div>
                    <input type="hidden" value="login" name="command"> 
                    <input type="submit" value="Đăng Nhập">
                </form>
                
                
                
            </div>
        </div> --%>
      <div class="full_container">
         <div class="container">
            <div class="center verticle_center full_height">
               <div class="login_section">
                  <div class="logo_login">
                     <div class="center">
                        <img width="210" src="/resources/images_admin/logo/logo.png" alt="#" />
                     </div>
                  </div>
                  <div class="login_form">
                     <form  method="POST" action="/admin/login">
		                     <%if (session.getAttribute("error") != null) {%>         
		                    <div>                            
		                        <p style="color:red"><%=session.getAttribute("error")%></p>
		                        <%session.removeAttribute("error"); %>         
		                    </div>                               
		                    <%}%>
                        <fieldset>
                           <div class="field">
                              <label class="label_field">Tài Khoản</label>
                              <input type="email" name="email" placeholder="E-mail" required />
                           </div>
                           <div class="field">
                              <label class="label_field">Password</label>
                              <input type="password" name="password" placeholder="Password" required />
                           </div>
                           <div class="field">
                              <label class="label_field hidden">hidden label</label>
                              <label class="form-check-label"><input type="checkbox" class="form-check-input"> Remember Me</label>
                              <a class="forgot" href="">Forgotten Password?</a>
                           </div>
                           <div class="field margin_0">
                           		<input type="hidden" value="login" name="command"> 
                   			 	<input class="button-33" type="submit" value="Đăng Nhập">
                           </div>
                        </fieldset>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="js/animate.js"></script>
      <!-- select country -->
      <script src="js/bootstrap-select.js"></script>
      <!-- nice scrollbar -->
      <script src="js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
    </body>
</html>