<%@page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản Lý Hóa Đơn</title>
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
<link href="/resources/css/mos-style.css" rel='stylesheet'
	type='text/css' />
</head>
<body>
	<%
	User users = (User) session.getAttribute("useradmin");
	if (users == null) {
		response.sendRedirect("/admin/login");
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
				<div id="rightContent">
					<div class="page_title">
                         <h2>Quản lý hóa đơn</h2>
                    </div>
					
					<a class="button-33" href="/admin/manager_bill">Tất Cả Đơn</a> <a
						class="button-33" href="/admin/bill_Wait">Đơn Chờ xác Nhận</a> <a
						class="button-33" href="/admin/bill_success">Đơn Đã Xác Nhận</a> <a
						class="button-33" href="/admin/bill_delete">Đơn Đã Hủy</a>
					<c:set value="${bills}" var="billPageList" />
					<table class="data">
						<tr class="data">
							<th class="data" width="30px">Mã hóa đơn</th>
							<th class="data">Khách hàng</th>
							<th class="data">SDT khách hàng</th>
							<th class="data">Tổng hóa đơn</th>
							<th class="data">Thanh toán</th>
							<th class="data">Địa chỉ giao hàng</th>
							<th class="data">Ngày mua</th>
							<th class="data">Trạng thái đơn</th>
							<th class="data" width="150px">Tùy chọn</th>
						</tr>
						<c:forEach items="${billPageList.pageList}" var="b">
							<tr class="data">
								<td class="data" width="30px">${b.id}</td>
								<td class="data">${b.userEmail}</td>
								<td class="data">${b.phone}</td>
								<td class="data">${b.total.longValue()}</td>
								<td class="data">${b.payment}</td>
								<td class="data">${b.address}</td>
								<td class="data">${b.date}</td>
								<c:choose>
									<c:when test="${b.status == 1}">
										<td class="data"><span
											style="font-size: 14px; color: #FF9900"> Chờ Xác Nhận</span></td>
									</c:when>
									<c:when test="${b.status == 3}">
										<td class="data"><span
											style="color: green; font-size: 14px"> Đã Xác Nhận</span></td>
									</c:when>
									<c:otherwise>
										<td class="data"><span
											style="font-size: 14px; color: red">Đã Hủy</span></td>
									</c:otherwise>
								</c:choose>
								<td class="data" width="75px">
									<center>
										<a title="hoàn tất" onclick="update(${b.id}, 3)"><span
											style="color: green; font-size: 24px"> &#10004;</span></a> </a>&nbsp;&nbsp;
										<a title="hủy dơn" onclick="update(${b.id}, 2)"><span
											style="font-size: 24px; color: red">&#x3A7;</span></a> </a>&nbsp;&nbsp;
										<a title="xóa đơn" href="/admin/bill/delete/${b.id}"><span
											style="font-size: 24px">&#x26D4;</span></a> </a>&nbsp;&nbsp;
									</center>
								</td>
							</tr>
						</c:forEach>
					</table>
					<!-- <nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item"><a class="page-link" href="#">Trang đầu</a></li>
					    <li class="page-item"><a class="page-link" href="#">Trước</a></li>
					    <li class="page-item"><a class="page-link" href="#">Tiếp</a></li>
					    <li class="page-item"><a class="page-link" href="#">Trang Cuối</a></li>
					  </ul>
					</nav> -->
					<c:choose>
						<%-- Show Prev as link if not on first page --%>
						<c:when test="${billPageList.firstPage}">
							<span>Prev</span>
						</c:when>
						<c:otherwise>
							<c:url value="/admin/manager_bill/prev" var="url" />
							<a href='<c:out value="${url}" />'>Prev</a>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${billPageList.pageCount}" step="1"
						varStatus="tagStatus">
						<c:choose>
							<%-- In PagedListHolder page count starts from 0 --%>
							<c:when test="${(billPageList.page + 1) == tagStatus.index}">
								<span>${tagStatus.index}</span>
							</c:when>
							<c:otherwise>
								<c:url value="/admin/manager_bill/${tagStatus.index}" var="url" />
								<a href='<c:out value="${url}" />'>${tagStatus.index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<%-- Show Next as link if not on last page --%>
						<c:when test="${billPageList.lastPage}">
							<span>Next</span>
						</c:when>
						<c:otherwise>
							<c:url value="/admin/manager_bill/next" var="url" />
							<a href='<c:out value="${url}" />'>Next</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<script type="text/javascript">
			function update(id, stt){
				$.ajax({
					url : "/admin/bill/update/" +id +'/' + stt,
					type : "GET",
					async : false,
					success : function(data) {
						if (data.mess === 'ok'){
							window.location.href = "/admin/manager_bill"
						}
						if (data.mess === 'eq'){
							alert('Số lương sản phẩm không đủ.');
						}
					},
					error : function(jqXHR, status, errorThrown) {
						console.log(errorThrown)
					}
					});
			}
			</script>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>
