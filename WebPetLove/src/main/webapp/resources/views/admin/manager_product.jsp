<%@ page import="com.webpetlove.ph.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>
		<link rel="icon" href="/resources/images_admin/fevicon.png" type="image/png" />
       <link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
      <link rel="stylesheet" href="/resources/css_admin/style.css" />
      <link rel="stylesheet" href="/resources/css_admin/responsive.css" />
      <link rel="stylesheet" href="/resources/css_admin/colors.css" />
      <link rel="stylesheet" href="/resources/css_admin/bootstrap-select.css" />
      <link rel="stylesheet" href="/resources/css_admin/perfect-scrollbar.css" />
      <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="/resources/css_admin/custom.css" />
        <link href="/resources/css/mos-style.css" rel='stylesheet' type='text/css' />
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
                              <h2>Quản lý sản phẩm</h2>
                           </div>
                        </div>
                     </div>
                    <a href="/admin/product/add">Thêm Sản Phẩm</a>                                
                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Tên sản phẩm</th>
                        <th class="data">Hình ảnh</th>
                        <th class="data">Giá bán</th>
                        <th class="data">Giá nhập</th>
                        <th class="data">Số lượng</th>
                        <th class="data" width="80px">NCC</th>    
                        <th class="data">Mô tả </th>
                        <th class="data" width="75px">Tùy Chọn</th>

                    </tr>
                    <c:forEach items="${productlists.pageList}" var="p" varStatus="loop">
                    	<tr class="data">
	                        <td class="data" width="30px" style="text-align: center">${loop.index + 1}</td>
	                        <td class="data"> ${p.productName}</td>
	                        <td class="data"><img style="text-align: center" witdh="50px" height="50px" src="${p.productImage}" /></td>
	                        <td class="data"> <fmt:formatNumber value="${p.productPrice}" type="currency" currencySymbol=""/> VNĐ</td>
	                        <td class="data"> <fmt:formatNumber value="${p.productBuy}" type="currency" currencySymbol=""/> VNĐ</td>
	                        <td class="data"> ${p.productQuantity}</td>
	                        <td class="data"> ${p.productProvider}</td>
	                        <td class="data"> ${p.productDescription}</td>   
	                        <td class="data" width="90px">
			                    <center>
			                        <a href="/admin/product/update_product/${p.productID}">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			                        <a href="/admin/product/delete/${p.productID}">Xóa</a>
			                    </center>
		                    </td>
	                    </tr>
                    </c:forEach>
                </table>
                <c:choose>
						<%-- Show Prev as link if not on first page --%>
						<c:when test="${productlists.firstPage}">
							<span>Prev</span>
						</c:when>
						<c:otherwise>
							<c:url value="/admin/manager_product/prev" var="url" />
							<a href='<c:out value="${url}" />'>Prev</a>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${productlists.pageCount}" step="1"
						varStatus="tagStatus">
						<c:choose>
							<%-- In PagedListHolder page count starts from 0 --%>
							<c:when test="${(productlists.page + 1) == tagStatus.index}">
								<span>${tagStatus.index}</span>
							</c:when>
							<c:otherwise>
								<c:url value="/admin/manager_product/${tagStatus.index}" var="url" />
								<a href='<c:out value="${url}" />'>${tagStatus.index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<%-- Show Next as link if not on last page --%>
						<c:when test="${productlists.lastPage}">
							<span>Next</span>
						</c:when>
						<c:otherwise>
							<c:url value="/admin/manager_product/next" var="url" />
							<a href='<c:out value="${url}" />'>Next</a>
						</c:otherwise>
					</c:choose>
            </div>
            <div class="clear"></div> 

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
