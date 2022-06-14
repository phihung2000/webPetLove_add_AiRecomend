<%@page import="java.util.ArrayList"%>
<%@page import="com.webpetlove.ph.model.Cart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="/resources/css/SlidersImage.css" rel="stylesheet">
	
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css'>
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
	<!-- <script src="/resources/js/jquery.min.js"></script> -->
	<script src="/resources/js/jquery.magnific-popup.js"></script>
	<script src="/resources/js/owl.carousel.js"></script>
</head>
<body>
	<div class="owl-carousel">
		<c:forEach items="${List_product_recomend}" var="cmd">
		<div class="item" >
			<p class="name_sp">${cmd.productName}</p>
			<a class="popup-text" href="/shop/single/${cmd.productID}"  onclick="myFunction(${cmd.productID})">
			 <img class="image_AI" src="${cmd.productImage}">
			</a>
			<span class="price_sp"><fmt:formatNumber
							value="${cmd.productPrice}" type="currency" currencySymbol="" />
						VNĐ</span>
		</div>
		</c:forEach>
	</div>
	<script>
			function myFunction(a) {
			  window.open("/shop/single/"+a);
			}
			</script>
	<script type="text/javascript">
		$('.owl-carousel').owlCarousel({
			autoplay : true,
			autoplayTimeout : 5000,
			autoplayHoverPause : true,
			loop : true,
			margin : 50,
			responsiveClass : true,
			nav : true,
			loop : true,
			stagePadding : 100,
			responsive : {
				0 : {
					items : 1
				},
				568 : {
					items : 2
				},
				600 : {
					items : 3
				},
				1000 : {
					items : 3
				}
			}
		})
		$(document).ready(function() {
			$('.popup-youtube').magnificPopup({
				disableOn : 320,
				type : 'iframe',
				mainClass : 'mfp-fade',
				removalDelay : 160,
				preloader : false,
				fixedContentPos : true
			});
		});
		$('.item').magnificPopup({
			delegate : 'a',
		});
	</script>
</body>
</html>