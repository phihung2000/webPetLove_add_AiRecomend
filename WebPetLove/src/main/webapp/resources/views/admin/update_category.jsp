<%@page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật Loại</title>
<link rel="icon" href="/resources/images_admin/fevicon.png"
	type="image/png" />
<link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css_admin/style.css" />
<link rel="stylesheet" href="/resources/css_admin/responsive.css" />
<link rel="stylesheet" href="/resources/css_admin/colors.css" />
<link rel="stylesheet" href="/resources/css_admin/bootstrap-select.css" />
<link rel="stylesheet" href="/resources/css_admin/perfect-scrollbar.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css_admin/custom.css" />
<link href="/resources//css/mos-style.css" rel='stylesheet'
	type='text/css' />

</head>
<body>

	<%
	User users = (User) session.getAttribute("useradmin");
	if (users == null) {
		response.sendRedirect("/admin/login");
	}

	String error = "";
	if (request.getParameter("error") != null) {
		error = (String) request.getParameter("error");
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
									<h2>Cập nhật Loại sản phẩm</h2>
								</div>
							</div>
						</div>
						<form action="/admin/manager_category" method="post">
							<table width="95%">
								<tr>
									<td style="float: right"><b>Tên Loại:</b></td>
									<td><input type="text" class="sedang"
										value="${cate.categoryName}" name="cateName" /> <%=error%></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="hidden" name="command" value="update">
										<input type="hidden" name="id" value="${cate.categoryID}">
										<input type="submit" class="button" value="Lưu dữ liệu">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>


</body>
</html>

