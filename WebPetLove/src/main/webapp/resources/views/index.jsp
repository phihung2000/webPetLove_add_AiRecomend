<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.webpetlove.ph.model.Cart"%>
<%@ page import="com.webpetlove.ph.entity.User"%>
<%@ page import="com.webpetlove.ph.entity.Product"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<title>PET LOVE</title>
        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/header.css" rel="stylesheet" type="text/css" media="all" />
         <script src="/resources/js/jquery.min.js"></script> 
         <script src="/resources/js/bootstrap-notify.min.js"></script> 
       <script type="text/javascript" src="/resources/js/bootstrap-3.1.1.min.js"></script> 
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/resources/css/jquery.countdown.css" />
        <link href="/resources/css/animate.min.css" rel="stylesheet"> 
        <script src="/resources/js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
    </head>
    <body>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

        %>
        <jsp:include page="header.jsp"></jsp:include>
       <%--  <jsp:include page="banner.jsp"></jsp:include> --%>
            <!-- collections -->
            <div class="new-collections">
                <div class="container">
                    <h3 class="animated wow zoomIn" data-wow-delay=".5s">Sản Phẩm</h3>
                    <p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
                    <div class="new-collections-grids">
                        <div class="col-md-6 new-collections-grid">
                            <div class="new-collections-grid-sub-grids">
                            <c:forEach items="${products}" var="p">
                            	<div class="new-collections-grid1-sub">
                                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                                    <div class="new-collections-grid1-image">
                                        <a href="/shop/single/${p.productID}" class="product-image">
                                            <img style="height: 226px" src="${p.productImage}" alt=" " class="img-responsive" />
                                        </a>
                                        <div class="new-collections-grid1-image-pos">
                                            <a href="/shop/single/${p.productID}">Xem chi tiết</a>
                                        </div>
                                        <div class="new-collections-grid1-right">
                                            <div class="rating">
                                                <div class="rating-left">
                                                    <img src="/resources/images/2.png" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="rating-left">
                                                    <img src="/resources/images/2.png" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="rating-left">
                                                    <img src="/resources/images/2.png" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="rating-left">
                                                    <img src="/resources/images/2.png" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="rating-left">
                                                    <img src="/resources/images/2.png" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="clearfix"> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h4 style="font-size:16px">
                                    	<a href="single/${p.productID}">${p.productName}</a>
                                    </h4>                                    
                                    <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                                        <p>
                                        	<i></i> <span class="item_price"><fmt:formatNumber value="${p.productPrice}" type="currency" currencySymbol=""/> VNĐ</span>
                                        	<a class="item_add" style="cursor:pointer" onclick="addItem(${p.productID})">Thêm Vào Giỏ Hàng </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>

                        <div class="clearfix"> </div>
                    </div>
                </div>

                <div class="clearfix"> </div>
            </div>
        </div>
    <jsp:include page="footer.jsp"></jsp:include>     

</body>
</html>
