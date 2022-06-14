<%@page import="com.webpetlove.ph.model.BillDto"%>
<%@page import="com.webpetlove.ph.model.Item"%>
<%@page import="java.util.Map"%>
<%@ page import="com.webpetlove.ph.model.Cart"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Love</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps -->
<link href="/resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/resources/css/header.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- js -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap-notify.min.js"></script>
<!-- //js -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/jquery-ui.css">
<!-- for bootstrap working -->
<script type="text/javascript"
	src="/resources/js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- animation-effect -->
<link href="/resources/css/animate.min.css" rel="stylesheet">
<script src="/resources/js/wow.min.js"></script>
<script>
	new WOW().init();
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=352114845163521";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function addItem(id) {
		$.ajax({
			url : "/cart/plus/" + id,
			type : "GET",
			async : false,
			success : function(result) {
				window.location.reload();
			},
			error : function(jqXHR, status, errorThrown) {
				console.log(errorThrown);
			}
		});
	}
	function subItem(id) {
		$.ajax({
			url : "/cart/sub/" + id,
			type : "GET",
			async : false,
			success : function(result) {
				window.location.reload();
			},
			error : function(jqXHR, status, errorThrown) {
				console.log(errorThrown);
			}
		});
	}
	function removeItem(id) {
		$.ajax({
			url : "/cart/remove/" + id,
			type : "GET",
			async : false,
			success : function(result) {
				window.location.reload();
			},
			error : function(jqXHR, status, errorThrown) {
				console.log(errorThrown);
			}
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
	<div class="checkout">
		<div class="container">
			<div class="checkout-right animated wow slideInUp"
				data-wow-delay=".5s">
				<c:choose>
					<c:when test="${not empty bills}">
					
						<table class="timetable_sub">
							<thead>
								<tr>
									<th>STT</th>
									<th>Hình Sản Phẩm</th>
									<th>Số Lượng</th>
									<th>Tên Sản Phẩm</th>
									<th>Đơn Giá</th>
									<th>Ngày Mua</th>
									<th>Trạng Thái</th>
								</tr>
							</thead>
							<c:forEach items="${bills}" var="i" varStatus="loop">
								<tr class="rem1">
									<td class="invert">${loop.index + 1}</td>
									<td class="invert-image" style="width: 25%"><a
										href="single/${i.productId}"> <img src="${i.productImage}"
											alt=" " class="img-responsive" />
									</a></td>
									<td class="invert" style="width: 10%">
										<div class="quantity">
											<div class="quantity-select">
												<div class="entry value" id="valuequantity">
													<span>${i.quantity}</span>
												</div>
											</div>
										</div>
									</td>
									<td class="invert" style="width: 30%">${i.product}</td>
									<td class="invert">${i.price.longValue()}</td>
									<td class="invert">${i.date}</td>
									<td class="invert">
										 <c:choose>
										    <c:when test="${i.status=='3'}">
										       <span class="xacnhan">Đơn Đã Được Xác Nhận </span>
										        <br />
										    </c:when>  
										    <c:when test="${i.status=='1'}">
										       <span class="choxacnhan">Đang Chờ xác Nhận </span>
										        <br />
										    </c:when>  
										    <c:otherwise>
										        <span class="huydon">Đơn Đã Bị Hủy</span>
										        <br />
										    </c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>

					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
