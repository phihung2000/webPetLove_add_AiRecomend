<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.webpetlove.ph.model.Cart"%>
<%@ page import="com.webpetlove.ph.entity.User"%>
<%@ page import="com.webpetlove.ph.entity.Product"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3 class="animated wow zoomIn" data-wow-delay=".5s">Bạn Có Thể Thích</h3>
                    <p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
                    <div class="new-collections-grids">
                        <div class="col-md-6 new-collections-grid">
                            <div class="new-collections-grid-sub-grids">
                            <c:forEach items="${products}" var="p">
                            	<div class="new-collections-grid1-sub">
                                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                                    <div class="new-collections-grid1-image">
                                        <a href="single/${p.productID}" class="product-image">
                                            <img style="height: 226px" src="${p.productImage}" alt=" " class="img-responsive" />
                                        </a> 
                                        <div class="new-collections-grid1-image-pos">
                                            <a href="single/${p.productID}">Xem chi tiết</a>
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
                                    	<a href="">${p.productName}</a>
                                    </h4>                                    
                                    <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                                         <p>
                                        	<i></i> <span class="item_price"><fmt:formatNumber value="${p.productPrice}" type="currency" currencySymbol=""/> VNĐ</span>
                                        	<a class="item_add" style="cursor:pointer" onclick="addItem(${p.productID})">Thêm Vào Giỏ Hàng <img src="/resources/images/bag.png" alt="" id="icon_shopping" /></a>
                                        </p> 
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>

                        <div class="clearfix"> </div>
                    </div>
                </div>
</body>
</html>