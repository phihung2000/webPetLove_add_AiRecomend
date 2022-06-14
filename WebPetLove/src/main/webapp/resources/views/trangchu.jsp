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
        <!-- Thêm ruồi -->
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
		<script src='https://cdn.staticaly.com/gh/dautoblogger/bootstrap/master/ruoi-bo-blog.js' type='text/javascript'></script>
		<!-- Hết ruồi -->
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
			<jsp:include page="Hot.jsp"></jsp:include>
            </div>
        </div>
        <div class="new-collections">
                <div class="container">     
			<jsp:include page="khuyenmai.jsp"></jsp:include>
            </div>
        </div>
    <jsp:include page="footer.jsp"></jsp:include>     

</body>
</html>
