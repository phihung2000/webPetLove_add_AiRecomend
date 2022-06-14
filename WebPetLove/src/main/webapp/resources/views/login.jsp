<%@ page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng Nhập</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->

        <!-- js -->
        <script src="/resources/js/jquery.min.js"></script>
        <!-- //js -->
        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
       <link href="/resources/css/header.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
        <!-- for bootstrap working -->
        <script type="text/javascript" src="/resources/js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- animation-effect -->
        <link href="/resources/css/animate.min.css" rel="stylesheet"> 
        <script src="/resources/js/wow.min.js"></script>
        <script>
new WOW().init();
        </script>
        <!-- //animation-effect -->

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
        <jsp:include page="header.jsp"></jsp:include>
            <div class="login">
                <div class="container" style="padding: 10px">
                    <h3 class="animated wow zoomIn" id="dangnhap" data-wow-delay=".5s">Đăng Nhập</h3>
                    <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                        <form action="/user/login" method="POST">
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
                        <input type="submit" value="Đăng Nhập" name ="login">
                    </form>
                </div>
                <h4 class="animated wow slideInUp" data-wow-delay=".5s">Người Mới</h4>
                <p class="animated wow slideInUp" data-wow-delay=".5s">
                    <a href="register">Đăng Ký</a> hoặc đi đến
                    <a href="homepage">Trang Chủ
                        <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                    </a>
                </p>
            </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
