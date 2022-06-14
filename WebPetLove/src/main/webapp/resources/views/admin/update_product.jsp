<%@page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm sản phẩm</title>
<link href="/resources/css/mos-style.css" rel='stylesheet'
	type='text/css' />
<link href="/resources/css/ThongTincaNhan.css" rel="stylesheet"
	type="text/css" media="all">
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
<script src="/resources/js/jquery.min.js"></script>
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
									<h2>Cập nhật Thông tin sản phẩm</h2>
								</div>
							</div>
						</div>
						<form action="/admin/product/manager_product" method="post"
							accept-charset="utf8">
							<table width="95%">
								<tr>
									<td><b>Tên sản phẩm</b> <input type="hidden"
										class="prodId" name="prodId" value="${product.productID}" /></td>
									<td><input type="text" class="sedang prodName"
										name="prodName" value="${product.productName}" /> <%=error%>
									</td>
								</tr>

								<tr>
									<td><b>Giá bán</b></td>
									<td><input type="text" class="textfield sedang price"
										name="gia" value="${product.productPrice.longValue()}"
										id="extra7" name="extra7" onkeypress="return isNumber(event)" />
										<%=error%></td>
								</tr>
								<tr>
									<td><b>Giá nhập</b></td>
									<td><input type="text" class="textfield sedang buy"
										name="buy" value="${product.productBuy.longValue()}"
										id="extra7" name="extra7" onkeypress="return isNumber(event)" />
										<%=error%></td>
								</tr>
								<tr>
									<td><b>Số lượng</b></td>
									<td><input type="text" class="textfield sedang quantity"
										name="quantity" value="${product.productQuantity}" id="extra7"
										name="extra7" onkeypress="return isNumber(event)" /> <%=error%>
									</td>
								</tr>
								<tr>
									<td><b>Nhà cung cấp</b></td>
									<td><input type="text" class="sedang provider"
										name="provider" value="${product.productProvider}" /> <%=error%>
									</td>
								</tr>
								<tr>
									<td><b>Loại sản phẩm</b></td>
									<td><select name="cateId" class="cateId" id ="cateId">
											<%-- <c:forEach items="${cates}" var="c">
		                                    	<option value="${cate.categoryID}">${cate.categoryName} </option>
		                                    </c:forEach> --%>
											<option value="${cate.categoryID}">
												${cate.categoryName}</option>
									</select></td>
								</tr>

								<tr>
									<td><b>Mô tả sản phẩm</b></td>
									<td><textarea class="form-textarea" id="noiDung"
											name="descrip">
                                   ${product.productDescription}
                                </textarea></td>
								</tr>
								<tr>
									<td><b>Hình ảnh</b></td>
									<td><input type="file" id="productImg" name="hinhanh"
										value="${product.productImage}" /> <%=error%></td>
								</tr>

								<tr>
									<td></td>
									<td><input type="hidden" name="command" class="command"
										value="update"> <input class="button button-33"
										value="Lưu dữ liệu" onclick="postFormData()">
									<!-- type="submit" --></td>
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
				<script>
		function postData(img) {
			var body = {
					command: $('.command').val(),
					image: img,
					descrip: $('#noiDung').val(),
					cateId: $('.cateId').val(),
					price: $('.price').val(),
					prodName: $('.prodName').val(),
					prodId: $('.prodId').val(),
					buy: $('.buy').val(),
					quantity: $('.quantity').val(),
					provider: $('.provider').val()
			};
			
			$.ajax({
					url : "/admin/product/manager_product",
					type : "POST",
					contentType : "application/json",
					dataType:"json",
					data : JSON.stringify(body),
					async : false,
					success : function(result) {
						window.location.href = result.url;
					},
					error : function(jqXHR, status, errorThrown) {
					}
			});
		};
		
		function postFormData() {
			var form = new FormData();
			var file = $('#productImg')[0].files[0];
			
			if (file.name){
				form.append('hinhanh',file, file.name);
			}
				$.ajax({
					url : "/admin/product/file",
					type : "POST",
					data : form,
					processData : false,
					contentType : false,
					async : false,
					success : function(result) {
						postData(result);
					},
					error : function(jqXHR, status, errorThrown) {
					}
				});
		};
		
		function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		};
		/* $("#cateId").on('click',function(){

			<c:forEach items="${cates}" var="c">
        	<option value="${cate.categoryID}">${cate.categoryName} </option>
        	</c:forEach>
		}); */
	</script>
</body>
</html>
