<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.webpetlove.ph.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Quản trị</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
</head>
<body>

<nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="/resources/images_admin/layout_img/user_img.jpg" alt="#" /></div>
                        <div class="user_info">
                           <h6>${useradmin.userName}</h6>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                 <h4 class="tieude"><a href="/admin/home">Administrator</a></h4>
                  <ul class="list-unstyled components">
                     <li class="active">
                        <a href="/admin/manager_category" data-toggle="collapse" aria-expanded="false"><i class="fa fa-dashboard yellow_color"></i> <span>Loại SP</span></a>
                     </li>
                     <li >
                        <a href="/admin/manager_category_givepet" data-toggle="collapse" aria-expanded="false"><i class="fa fa-dashboard yellow_color"></i> <span>Loại SP Cho Pet</span></a>
                     </li>
                     <li><a href="/admin/manager_product"><i class="fa fa-clock-o orange_color"></i> <span>Sản Phẩm</span></a></li>
                     <li>
                        <a href="/admin/manager_bill" data-toggle="collapse" aria-expanded="false" ><i class="fa fa-diamond purple_color"></i> <span>Hóa Đơn</span></a>
                     </li>
                     <li><a href="/admin/chart"><i class="fa fa-table purple_color2"></i> <span>Thống Kê</span></a></li>
                     
                  </ul>
               </div>
            </nav>
</body>
</html>