<%@page import="java.util.ArrayList"%>
<%@ page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loại sản phẩm dành cho Pet</title>
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
        	response.sendRedirect("/admin/login");
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
               <!-- dashboard inner -->
                <div class="midde_cont">
                <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Loại sản phẩm</h2>
                           </div>
                        </div>
                     </div>
                    <a href="/admin/category_givepet/add">Thêm loại sản phẩm</a>                                   
                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Mã Loại</th>
                        <th class="data">Tên Loại</th>             
                        <th class="data" width="75px">Tùy Chọn</th>

                    </tr>
                    <c:forEach items="${cates_givepet}" var="c" varStatus="loop">
                    	<tr class="data">
	                        <td class="data" width="30px">${loop.index + 1}</td>
	                        <td class="data">${c.catergoty_givepetid}</td>
	                        <td class="data">${c.categorynameGivepet}</td>
	                        <td class="data" width="90px">
	                    <center>
	                        <a href="/admin/update_category_givepet/${c.catergoty_givepetid}/${c.categorynameGivepet}">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
	                        <a href="/admin/manager_category_givepet/delete/${c.catergoty_givepetid}">Xóa</a>
	                    </center>
	                    </td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
          </div>
         </div>
       </div>
            <div class="clear"></div> 

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
