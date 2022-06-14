<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.webpetlove.ph.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<title>Chi tiết sản phẩm</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/resources/css/header.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/flexslider.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="/resources/css/ThongTincaNhan.css" rel="stylesheet"
	type="text/css" media="all">
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/jquery-ui.css" rel="stylesheet"
	type="text/css">
<link rel='stylesheet prefetch'
	href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<link href="/resources/css/star-rating.css" media="all" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="/resources/js/bootstrap-3.1.1.min.js"></script>
<script src="/resources/js/wow.min.js"></script>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap-notify.min.js"></script>
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
	<div class="container" style="margin-top: 40px;">
		<ol class="breadcrumb breadcrumb1 animated wow slideInLeft"
			data-wow-delay=".5s">
			<li><a href="/shop/homepage"><span
					class="glyphicon glyphicon-home" aria-hidden="true"></span>Trang
					chủ</a></li>
			<li class="active">Chi tiết sản phẩm</li>
		</ol>
	</div>
	<div class="container" style="padding-top: 20px;">
		<div class="col-md-4 products-left">
			<div class="categories animated wow slideInUp" data-wow-delay=".5s">
				<h3>Sản Phẩm</h3>
				<ul class="cate">
					<c:forEach items="${cates}" var="c">
						<li><a href="product/${c.categoryID}">${c.categoryName} </a>
						</li>
					</c:forEach>

				</ul>
			</div>


		</div>
		<div class="col-md-8 single-right">
			<div class="col-md-5 single-right-left animated wow slideInUp"
				data-wow-delay=".5s">
				<div class="flexslider">
					<ul class="slides">
						<li data-thumb="${product.productImage}">
							<div class="thumb-image">
								<img src="${product.productImage}" data-imagezoom="true"
									class="img-responsive">
							</div>
						</li>
						<li data-thumb="${product.productImage}">
							<div class="thumb-image">
								<img src="${product.productImage}" data-imagezoom="true"
									class="img-responsive">
							</div>
						</li>
						<li data-thumb="${product.productImage}">
							<div class="thumb-image">
								<img src="${product.productImage}" data-imagezoom="true"
									class="img-responsive">
							</div>
						</li>
					</ul>

				</div>
				<div class="rating">
					<span class="rating-num" id="rating-num">5.0</span>
					<div class="rating-stars">
						<span class="fa fa-star checked1 checked"></span> <span
							class="fa fa-star checked2 checked"></span> <span
							class="fa fa-star checked3 checked"></span> <span
							class="fa fa-star checked4 checked"></span> <span
							class="fa fa-star checked5 checked"></span>
					</div>
					<div class="rating-users">
						<i class="icon-user"></i> <span id="sumtotal">0 đánh giá</span>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty RatingStar}">
						<div class="histo">
							<div class="five histo-rate">
								<span class="histo-star"> <i class="active icon-star"></i>
									5
								</span> <span class="bar-block"> <span id="bar-five" class="bar">
										<input type="hidden" value="" id="s5" /> <span id="sao5"></span>&nbsp;
								</span>
								</span>
							</div>

							<div class="four histo-rate">
								<span class="histo-star"> <i class="active icon-star"></i>
									4
								</span> <span class="bar-block"> <span id="bar-four" class="bar">
										<input type="hidden" value="" id="s4" /> <span id="sao4"></span>&nbsp;
								</span>
								</span>
							</div>

							<div class="three histo-rate">
								<span class="histo-star"> <i class="active icon-star"></i>
									3
								</span> <span class="bar-block"> <span id="bar-three"
									class="bar"> <span id="sao3"></span>&nbsp;
								</span>
								</span>
							</div>

							<div class="two histo-rate">
								<span class="histo-star"> <i class="active icon-star"></i>
									2
								</span> <span class="bar-block"> <span id="bar-two" class="bar">
										<span id="sao2"></span>&nbsp;
								</span>
								</span>
							</div>

							<div class="one histo-rate">
								<span class="histo-star"> <i class="active icon-star"></i>
									1
								</span> <span class="bar-block"> <span id="bar-one" class="bar">
										<span id="sao1"></span>&nbsp;
								</span>
								</span>
							</div>
						</div>
					</c:when>
					<c:when test="${not empty RatingStar}">
						<c:forEach items="${RatingStar}" var="rs" varStatus="loop">
							<div class="histo">
								<div class="five histo-rate">
									<span class="histo-star"> <i class="active icon-star"></i>
										5
									</span> <span class="bar-block"> <span id="bar-five"
										class="bar"> <input type="hidden" value="${rs.star5}"
											id="s5" /> <span id="sao5">${rs.star5}</span>&nbsp;
									</span>
									</span>
								</div>

								<div class="four histo-rate">
									<span class="histo-star"> <i class="active icon-star"></i>
										4
									</span> <span class="bar-block"> <span id="bar-four"
										class="bar"> <input type="hidden" value="${rs.star4}"
											id="s4" /> <span id="sao4">${rs.star4}</span>&nbsp;
									</span>
									</span>
								</div>

								<div class="three histo-rate">
									<span class="histo-star"> <i class="active icon-star"></i>
										3
									</span> <span class="bar-block"> <span id="bar-three"
										class="bar"> <span id="sao3">${rs.star3}</span>&nbsp;
									</span>
									</span>
								</div>

								<div class="two histo-rate">
									<span class="histo-star"> <i class="active icon-star"></i>
										2
									</span> <span class="bar-block"> <span id="bar-two" class="bar">
											<span id="sao2">${rs.star2}</span>&nbsp;
									</span>
									</span>
								</div>

								<div class="one histo-rate">
									<span class="histo-star"> <i class="active icon-star"></i>
										1
									</span> <span class="bar-block"> <span id="bar-one" class="bar">
											<span id="sao1">${rs.star1}</span>&nbsp;
									</span>
									</span>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
				<script>
					function roundToTwo(num) {    
					    return +(Math.round(num + "e+1")  + "e-1");
					}
					$(document).ready(function() {
						 
						var sao5 = (document.getElementById("s5").value) ;
						var sao4 = (document.getElementById("s4").value) ;
						var sao3 = (document.getElementById("sao3").innerHTML) ;
						var sao2 = (document.getElementById("sao2").innerHTML) ;
						var sao1 = (document.getElementById("sao1").innerHTML);
						jQuery("#sumtotal").text(sao5);
					  if(sao5=="" && sao4==""&& sao3=="" && sao2=="" && sao1=="")
					{
						  $('.checked').css("color", "orange");
						  jQuery("#sumtotal").text(" 0 đánh giá");
						  $('.bar span').hide();
						  $('#bar-five').animate({
						     width: '100%'}, 1000);
						  $('#bar-four').animate({
						     width: '100%'}, 1000);
						  $('#bar-three').animate({
						     width: '100%'}, 1000);
						  $('#bar-two').animate({
						     width: '100%'}, 1000);
						  $('#bar-one').animate({
						     width: '100%'}, 1000);
						  setTimeout(function() {
						    $('.bar span').fadeIn('slow');
						  }, 1000);
					}
					  else
					{
						  	sao5 =Number(sao5);
							sao4=Number(sao4);
							sao3=Number(sao3);
							sao2=Number(sao2);
							sao1=Number(sao1);
							//tổng số lượt đánh giá sao vd 5 cái 5 sao =5
							var sum = sao5 + sao4 + sao3 + sao2 + sao1;
							//tổng số sao ví dụ 5 cái 5 sao = 25
							var sumsao = sao5*5 + sao4*4 + sao3*3 + sao2*2 + sao1*1;
							//
							var showsao5 = sao5/sum*100+"%";
							var showsao4 = sao4/sum*100+"%";
							var showsao3 = sao3/sum*100+"%";
							var showsao2 = sao2/sum*100+"%";
							var showsao1 = sao1/sum*100+"%";
	
							var avg =roundToTwo(sumsao/sum);
							var avground = Math.round(avg);
							jQuery("#sumtotal").text(sum +" đánh giá");
							jQuery("#rating-num").text(avg);
						  $('.bar span').hide();
						  $('#bar-five').animate({
						     width: showsao5}, 1000);
						  $('#bar-four').animate({
						     width: showsao4}, 1000);
						  $('#bar-three').animate({
						     width: showsao3}, 1000);
						  $('#bar-two').animate({
						     width: showsao2}, 1000);
						  $('#bar-one').animate({
						     width: showsao1}, 1000);
						  setTimeout(function() {
						    $('.bar span').fadeIn('slow');
						  }, 1000);
						  //
						  if(avground==1 || avground==2 || avground==3 || avground==4 || avground==5)
						{
							  $('.checked1').css("color", "orange");
						   if(avground==2 || avground==3 || avground==4 || avground==5)
							{
								  $('.checked2').css("color", "orange");
							   if(avground==3 || avground==4 || avground==5)
								{
									  $('.checked3').css("color", "orange");
									  if(avground==4  || avground==5)
										{
											  $('.checked4').css("color", "orange");
											  if(avground==5)
											  {
												  $('.checked5').css("color", "orange");
											}
										}
									  
								}
							}
						   
						  
							
						}
					}
					});
				</script>
				<!-- flixslider -->
				<script defer src="/resources/js/jquery.flexslider.js"></script>

				<script>
                        // Can also be used with $(document).ready()
                        $(window).load(function () {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>
				<!-- flixslider -->
			</div>
			<div
				class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight"
				data-wow-delay=".5s">
				<h3>${product.productName}</h3>
				<h4>
					<span class="item_price"><fmt:formatNumber
							value="${product.productPrice}" type="currency" currencySymbol="" />
						VNĐ</span>
				</h4>
				<%-- <div class="occasion-cart">
					<a class="item_add" style="cursor: pointer"
						onclick="addItem(${productId})">Thêm vào giỏ hàng </a>
				</div> --%>
				<div class="occasion-cart">
                        <a class="item_add" style="cursor:pointer" onclick="addItem(${productId})">Thêm vào giỏ hàng </a>
                    </div>
				<form class="rating" method="post">
					<div class="ratingstar">
						<input class="star star-5" type="radio" id="star5" name="rating"
							value="5" onclick="postToController();" /> <label
							class="star star-5" for="star5" title="Super !!"></label> <input
							class="star star-4" type="radio" id="star4" name="rating"
							value="4" onclick="postToController();" /> <label
							class="star star-4" for="star4" title="Geil"></label> <input
							class="star star-3" type="radio" id="star3" name="rating"
							value="3" onclick="postToController();" /> <label
							class="star star-3" for="star3" title="Gut"></label> <input
							class="star star-2" type="radio" id="star2" name="rating"
							value="2" onclick="postToController();" /> <label
							class="star star-2" for="star2" title="So gut wie"></label> <input
							class="star star-1" type="radio" id="star1" name="rating"
							value="1" onclick="postToController();" /> <label
							class="star star-1" for="star1" title="Schlecht"></label>
					</div>
				</form>
				<form action="/user/sendratings" method="post">
					<div class="sendanhgia">
						<input type="hidden" id="star" name="start" value="" />
						<p class="ratings">
							<input type="hidden" name="command" value="sendratings">
							<input type="hidden" name="id" value="${user.id}"> <input
								type="hidden" name="productID" value="${product.productID}">
							<input type="submit" class="button-33 danhgia"
								value="gửi đánh giá">
						</p>
					</div>
					<%if (session.getAttribute("error") != null) {%>         
			            <div class="errorLogin">                            
			              <p style="color:red"><%=session.getAttribute("error")%></p>
			              <%session.removeAttribute("error"); %>         
			            </div>                               
		            <%}%>
				</form>
				<div class="description">
					<h5>
						<i>Thông tin</i>
					</h5>
					<p>${product.productDescription}</p>
				</div>

				<div class="color-quality">
					<div class="clearfix">.</div>
				</div>
			</div>
			<div class="fb-comments" style="margin-top: 50px">
			<!-- <div class="fb-comments"> -->
				<div class="text1">
					<Span class="bancothethich">Bạn có thể thích</Span>
				</div>
				<jsp:include page="SlidesImage.jsp"></jsp:include>
			</div>
			<jsp:include page="comment.jsp"></jsp:include>
			<div class="clearfix"> .</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<div id="fb-root"></div>

	<script>
		function postToController() {
		        for (i = 0; i < document.getElementsByName('rating').length; i++) {
		                if(document.getElementsByName('rating')[i].checked == true) {
		                    var ratingValue = document.getElementsByName('rating')[i].value;
		                    break;
		                }
		        }
		        document.getElementById('star').value = ratingValue;
		}
	</script>
	<script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=352114845163521";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

</body>
</html>
