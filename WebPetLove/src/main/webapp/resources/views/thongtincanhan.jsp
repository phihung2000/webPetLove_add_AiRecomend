<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.webpetlove.ph.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thông Tin Cá Nhân</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/resources/css/header.css" rel="stylesheet" type="text/css"
	media="all" />

<link href="/resources/css/ThongTincaNhan.css" rel="stylesheet"
	type="text/css" media="all">
<script src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/jquery-ui.css">
<script type="text/javascript"
	src="/resources/js/bootstrap-3.1.1.min.js"></script>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link href="/resources/css/animate.min.css" rel="stylesheet">
<script src="/resources/js/wow.min.js"></script>
<script>
            new WOW().init();
        </script>
</head>
<body>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	    if (user == null) {
	    	user = new User();
	    	response.sendRedirect("/shop/homepage");
	    }
	%>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
		type="text/javascript"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="new-collections">
		<div class="container bootstrap snippets bootdey">
			<div class="panel-body inf-content">
				<div class="row">
					<div class="col-md-4">
						<img alt=""  title=""
							class="img-circle img-thumbnail isTooltip"
							src="https://bootdey.com/img/Content/avatar/avatar7.png"
							data-original-title="Usuario">
						<ul title="Ratings" class="list-inline ratings text-center">
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
						</ul>
						<p class="username_inf">${user.userName}</p>
							<p class="chinhsua_inf">
									<a class="button-33" type="submit" href="/shop/update_infomation">Chỉnh Sửa</a>
							</p>
					</div>
					<div class="col-md-6">
						<strong>Thông Tin cá nhân </strong><br>
						<div class="table-responsive">
						
							<table class="table table-user-information">
								<tbody>
									<tr>
										
										<td><strong> <span
												class="glyphicon glyphicon-user  text-primary"></span> Họ Và Tên 
										</strong></td>
										<td class="text-primary">${user.userName}</td>
									</tr>
									<tr>
										<td>
										<strong> <span
												class="glyphicon glyphicon-earphone text-primary"></span>
												Số Điện Thoại
										</strong></td>
										<td class="text-primary">${user.phone}</td>
									</tr>
									
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-cloud text-primary"></span>
												Giới Tính
										</strong></td>
											
												<td class="text-primary">
												<c:set var = "gioitinh" scope = "session" value = "${user.gioitinh}"/>
													<c:choose>
														<c:when test ="${gioitinh >= 1}">
															Nam
														</c:when>
														<c:when test ="${gioitinh <= 0}">
															Nữ
														</c:when>
													</c:choose>
												</td>	
									</tr>
									
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-bookmark text-primary"></span>
												Loại Thú Cưng Yêu Thích
										</strong></td>
										<td class="text-primary">${user.petlove}</td>
									</tr>


									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-eye-open text-primary"></span>
												Khách Hàng
										</strong></td>
										<td class="text-primary">
											<c:set var = "KH" scope = "session" value = "${user.loaikh}"/>
													<c:choose>
														<c:when test ="${KH >= 2}">
															khách VIP
														</c:when>
														<c:when test ="${KH == 1}">
															Khách hành tiềm năng
														</c:when>
														<c:when test ="${KH == 0}">
															Khách hàng Vãng lai
														</c:when>
													</c:choose>
										</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-envelope text-primary"></span>
												Email
										</strong></td>
										<td class="text-primary">${user.userEmail}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-calendar text-primary"></span>
												Ngày Sinh
										</strong></td>
										<td class="text-primary">${user.ngaysinh}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-calendar text-primary"></span>
												Địa Chỉ
										</strong></td>
										<td class="text-primary">${user.diachi}</td>
									</tr>
								</tbody>
							</table>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>