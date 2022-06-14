<%@page import="com.webpetlove.ph.entity.User"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loại sản phẩm</title>
       <link href="/resources/css/mos-style.css" rel='stylesheet' type='text/css' />
              <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
<link rel="icon" href="/resources/images_admin/fevicon.png"
	type="image/png" />
<link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css_admin/style.css" />
<link rel="stylesheet" href="/resources/css_admin/responsive.css" />
<link rel="stylesheet" href="/resources/css_admin/colors.css" />
<link rel="stylesheet" href="/resources/css_admin/bootstrap-select.css" />
<link rel="stylesheet" href="/resources/css_admin/perfect-scrollbar.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css_admin/custom.css" />
    </head>
    <body>

        <%
            User users = (User) session.getAttribute("useradmin");
            if (users == null) {
                response.sendRedirect("/shop/admin/login");
            }
            
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
        %>
<div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <jsp:include page="sidebar.jsp"></jsp:include>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <jsp:include page="header.jsp"></jsp:include>
               <!-- end topbar -->
                <div id="rightContent">
                    <h3>Thông tin </h3>
                    <form action="/admin/manager_category_givepet" method="post">
                        <table width="95%">
                            <tr>
                                <td style="float: right"><b>Tên Loại:</b></td>
                                <td><input type="text" class="sedang" name="cateName"><%=error%></td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="insert">
                                <input type="hidden" name="id" value="">
                                <input type="submit" class="button" value="Lưu dữ liệu">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
	</div>
</div>
    </body>
</html>