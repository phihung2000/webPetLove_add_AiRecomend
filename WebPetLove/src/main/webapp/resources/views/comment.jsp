<%@page import="java.util.ArrayList"%>
<%@page import="com.webpetlove.ph.model.Cart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="/resources/css/comment.css" rel="stylesheet">
</head>
<body>
	<div class="be-comment-block">
	<%--  --%>
	<c:choose>
		<c:when test="${not empty sumcmt}">
			<c:forEach items="${sumcmt}" var="cmts" varStatus="loop">
				<h1 class="comments-title" id="Sumcomments">
					Bình Luận(<span>${cmts.sumcomments}</span>)
				</h1>
			</c:forEach>
		</c:when>
		<c:when test="${empty sumcmt}">
			<h1 class="comments-title" id="Sumcomments">Bình Luận(0)</h1>
		</c:when>
	</c:choose>
		<div class="be-comment">
			<c:choose>
				<c:when test="${empty comments}">
					<div class="be-img-comment commentfirst">
						<p>Hãy là người đầu tiên bình luận về sản phẩm này.</p>
					</div>
				</c:when>
				<c:when test="${not empty comments}">
					<c:forEach items="${comments}" var="cmt" varStatus="loop">
						<div class="be-img-comment">
							<a href="blog-detail-2.html"> <img
								src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""
								class="be-ava-comment">
							</a>
						</div>
						<div class="be-comment-content">

							<span class="be-comment-name"> <a
								href="blog-detail-2.html">${cmt.commentname}</a>
							</span> <span class="be-comment-time"> <i class="fa fa-clock-o"></i>
								May 27, 2015 at 3:14am
							</span>
							<p class="be-comment-text">${cmt.comment_text}</p>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>

		</div>
		<form class="form-block" action="/user/comment" method="post">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<div class="form-group fl_icon">
						<div class="icon">
							<i class="fa fa-user"></i>
						</div>
						<input class="form-input" type="text" name="name"
							placeholder="Your name" required>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 fl_icon">
					<div class="form-group fl_icon">
						<div class="icon">
							<i class="fa fa-envelope-o"></i>
						</div>
						<input class="form-input" type="text" name="email"
							placeholder="Your email" required>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="form-group">
						<textarea class="form-input" required="" name="text"
							placeholder="Your text"></textarea>
					</div>
				</div>
				<div class="luu">
					<input type="hidden" name="command" value="comment"> <input
						type="hidden" name="id" value="${product.productID}"> <input
						type="hidden" name="userid" value="${user.id}"> <input
						type="submit" class="button-33 comment" value="gửi">
				</div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>