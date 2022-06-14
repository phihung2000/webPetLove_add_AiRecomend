<%@page import="java.util.ArrayList"%>
<%@page  import="com.webpetlove.ph.model.Cart" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sản Phẩm Cho Pet</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/header.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="/resources/js/jquery.min.js"></script>
        <script src="/resources/js/bootstrap-notify.min.js"></script>
        <!-- //js -->
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
            $(document).ready(function() {
            	$('.active').removeClass('active');
            	$('.product').addClass('active');
            });
            function addItem(id){
        		$.ajax({
    				url : "/cart/plus/"+id,
    				type : "GET",
    				async : false,
    				success : function(result) {
    					generateNotify(result.message);
    					updateCart(result);
    				},
    				error : function(jqXHR, status, errorThrown) {
    					generateNotify(errorThrown);
    				}
    				});
        	}
        	function subItem(id){
        		$.ajax({
    				url : "/cart/sub/"+id,
    				type : "GET",
    				async : false,
    				success : function(result) {
    					generateNotify(result.message);
    					updateCart(result);
    				},
    				error : function(jqXHR, status, errorThrown) {
    					generateNotify(errorThrown);
    				}
    				});
        	}
        	function removeItem(id){
        		$.ajax({
    				url : "/cart/plus/"+id,
    				type : "GET",
    				async : false,
    				success : function(result) {
    					generateNotify(result.message);
    					updateCart(result);
    				},
    				error : function(jqXHR, status, errorThrown) {
    					generateNotify(errorThrown);
    				}
    				});
        	}
        	
        	function updateCart(data) {
        		$(".simpleCart_total").text(data.price);
        		$(".simpleCart_quantity").text(data.quantity);
        	}
        	
        	function generateNotify(mess) {
        			$.notify({
      			      title: '<strong>Thông báo: </strong>',
      			      icon: 'glyphicon glyphicon-star',
      			      message: mess
      			    },{
      			      type: 'info',
      			      animate: {
      					    enter: 'animated fadeInDown',
      			        	exit: 'animated fadeOutUp'
      			      },
      			      placement: {
      			        from: "top",
      			        align: "right"
      			      },
      			      newest_on_top: true,
      			      offset: 40,
      			      spacing: 10,
      			      z_index: 1031,
      			    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
      				'<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
      				'<span data-notify="icon"></span> ' +
      				'<span data-notify="title">{1}</span> ' +
      				'<span data-notify="message">{2}</span>' +
      				'<div class="progress" data-notify="progressbar">' +
      					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
      				'</div>' +
      				'<a href="{3}" target="{4}" data-notify="url"></a>' +
      			'</div>'
      			    });
        		}
        </script>
        <!-- //animation-effect -->

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
            <div class="products">
                <div class="container">
                    <div class="col-md-4 products-left">
                        <div class="filter-price animated wow slideInUp" data-wow-delay=".5s">
                            <h3>Lọc Theo Giá</h3>
                            <ul class="dropdown-menu1">
                                <li><a href="">								               
                                        <div id="slider-range"></div>							
                                        <input type="text" id="amount" style="border: 0" />
                                    </a></li>	
                            </ul>
                            <script type='text/javascript'>//<![CDATA[ 
                                $(window).load(function () {
            	                        $("#slider-range").slider({
            	                            range: true,
            	                            min: 500000,
            	                            max: 2000000,
            	                            values: [700000, 1500000],
            	                            slide: function (event, ui) {
            	                                $("#amount").val( ui.values[0] + " VNĐ - " + ui.values[1] + " VNĐ");
            	                            }
            	                        });
            	                        $("#amount").val($("#slider-range").slider("values", 0) + " VNĐ - " + $("#slider-range").slider("values", 1) + " VNĐ");
                                });
                            </script>
                            <script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
                            <!---->
                        </div>
                        <div class="categories animated wow slideInUp" data-wow-delay=".5s">
                            <h3>Sản Phẩm</h3>
                            <ul class="cate">
                            	<c:forEach items="${category_givepet}" var="c">
                                     <li>
                                          <a href="${c.catergoty_givepetid}">${c.categorynameGivepet} </a>
                                     </li>
                                </c:forEach>
                        </ul>
                    </div>                   
                </div>
                <div class="col-md-8 products-right">
                    <div class="products-right-grid">
                        <div class="products-right-grids animated wow slideInRight" data-wow-delay=".5s">
                            <div class="clearfix"> </div>
                        </div>
                        <div class="products-right-grids-position animated wow slideInRight" data-wow-delay=".5s">
                            <img src="/resources/images/white.jpg" alt=" " class="img-responsive" />
                            <div class="products-right-grids-position1">
                                <h4>Hàng Mới 2017</h4>
	                            </div>
                        </div>
                    </div>
                    <div class="products-right-grids-bottom">
                        <div class="col-md-6 new-collections-grid">
                            <div class="new-collections-grid-sub-grids">
                                <c:choose>
                                	<c:when test="${not empty productsGivepet}">
                                		<c:forEach items="${productsGivepet}" var="p">
                                <div class="new-collections-grid1-sub" style="width: 30%;">
                                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp animated" data-wow-delay=".5s">
                                        <div class="new-collections-grid1-image" style="width: 190.99px">
                                            <a href="/shop/single/${p.productGivePetID}" class="product-image">
                                                <img style="width: 190.99px" src="${p.productGivePetImage}" alt=" " class="img-responsive" />
                                            </a>
                                            <div class="new-collections-grid1-image-pos">
                                                <a href="/shop/Single/${p.productGivePetID}" >Xem Nhanh</a>
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
                                        <h4 style="font-size:16px"><a href="/shop/single/${p.productGivePetID}" >${p.productGivePetName}</a></h4>

                                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                                            <p><i></i> <span class="item_price" style="white-space: nowrap"><fmt:formatNumber value="${p.productGivePetPrice}" type="currency" currencySymbol=""/> VNĐ</span>
                                            <a class="item_add" style="cursor:pointer" onclick="addItem(${p.productGivePetID})">Thêm Vào Giỏ Hàng </a></p>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<div>
                                			<h3>Sản phẩm đang được cập nhật.Xin vui lòng quay lại sau</h3>
                                			
                                		</div>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
