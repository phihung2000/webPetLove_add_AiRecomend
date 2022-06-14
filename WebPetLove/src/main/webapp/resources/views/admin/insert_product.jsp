<%@page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
        <link href="/resources/css/mos-style.css" rel='stylesheet' type='text/css' />
              <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
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

                <div id="rightContent">
                    <h3>Thông tin sản phẩm</h3>
                    <form action="/shop/ManagerProductServlet" method="post" >
                        <table width="95%">
                            <tr>
                                <td>
                                    <b>Tên sản phẩm</b>
                                </td>
                                <td>
                                    <input type="text" class="sedang prodName" name="tensanpham">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <b>Giá bán</b>
                                </td>
                                <td>
                                    <!-- <input type="text" class="sedang price" name="gia"> -->
                                    <input type="text" class="textfield sedang price" name="gia" value="" id="extra7" name="extra7" onkeypress="return isNumber(event)" />
                                </td>
                            </tr>
							<tr>
                            <td>
                                <b>Giá nhập</b>
                            </td>
                            <td>
                            <input type="text" class="textfield sedang buy" name="buy" value="${product.productBuy.longValue()}" id="extra7" name="extra7" onkeypress="return isNumber(event)" />
                                <%=error%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Số lượng</b>
                            </td>
                            <td>
                            <input type="text" class="textfield sedang quantity" name="quantity" value="${product.productQuantity}" id="extra7" name="extra7" onkeypress="return isNumber(event)" />
                                <%=error%>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                    <b>Nhà cung cấp</b>
                                </td>
                                <td>
                                    <input type="text" class="sedang provider" name="provider" value="${product.productProvider}" />
                                <%=error%>
                            </td> 
                        </tr>
                            <tr>
                                <td>
                                    <b>Loại sản phẩm</b>
                                </td>
                                <td>
                                	<div>
                                	<input type="radio" id="rd" name="fav_language" onclick="check(this.value)" value="1">
									  <label for="html">Loại PET</label>
									  <input type="radio" id="rd" name="fav_language" onclick="check(this.value)" value="0">
									  <label for="css">Loại sản cho pet</label>
									</div>
                                    <select name="category_id" class="cateId1" id="cateId1" onchange="update(1)">
                                    <c:forEach items="${cates}" var="c">
                                    	<option value="${c.categoryID}">${c.categoryName}</option>
                                    </c:forEach>              
                                </select>
                                <select name="category_id" class="cateId2" id="cateId2" onchange="update(2)">
                                	<c:forEach items="${cates_givepet}" var="c">
                                    	<option value="${c.catergoty_givepetid}">${c.categorynameGivepet}</option>
                                    </c:forEach>
                                </select>
                              <!--   // type="hidden" -->
                                <input  type="hidden" class="cateId" name="cateId" id ="cateId" >
                                <input  type="hidden" class="cateId_givepet" name="cateId" id ="cateId_givepet" >
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <b>Mô tả sản phẩm</b>
                            </td>
                            <td>
                                <textarea class="form-textarea" id="noiDung" name="mota"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Hình ảnh</b>
                            </td>
                            <td>
                                <input type="file" id="productImg" name="hinhanh">
                            </td>
                        </tr>

                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="hidden" class="command" name="command" value="insert">
                                <input class="button" value="Lưu dữ liệu" onclick="postFormData()">
                            </td></tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
			<script>
			
			function isNumber(evt) {
			    evt = (evt) ? evt : window.event;
			    var charCode = (evt.which) ? evt.which : evt.keyCode;
			    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
			        return false;
			    }
			    return true;
			}
			
		function postData(img) {
			var body = {
					command: $('.command').val(),
					image: img,
					descrip: $('#noiDung').val(),
					cateId: $('.cateId').val(),
					catergoty_givepetid:$('.cateId_givepet').val(),
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
		}
		
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
	</script>
	<script type="text/javascript">
		function check(browser) {
			 if(browser == 1)
			{
				 document.getElementById('cateId1').hidden = false;
				 document.getElementById('cateId2').hidden = true;
				
			}
			 if(browser == 0)
				{
					 document.getElementById('cateId1').hidden = true;
					 document.getElementById('cateId2').hidden = false;
				}
		};
	</script>
	<script type="text/javascript">
		function update(id) {
			if(id == 1)
			{
				var select = document.getElementById('cateId1');
				 var option = select.options[select.selectedIndex];
					document.getElementById('cateId').value = option.value;
					document.getElementById('cateId_givepet').value = '';
			}
			else 
			{
				var select = document.getElementById('cateId2');
				 var option = select.options[select.selectedIndex];
				 document.getElementById('cateId').value = '';
					document.getElementById('cateId_givepet').value = option.value;
			}
		};
	</script>
        </div>
	</div>
</div>
</body>
</html>
