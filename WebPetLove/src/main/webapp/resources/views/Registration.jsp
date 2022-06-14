<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
<title>Đăng Ký</title>
<!--Made with love by Mutiullah Samim -->
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="styles.css">
<link href="/resources/css/Login2.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" media="all" />
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
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Đăng Ký</h3>
					<div class="d-flex justify-content-end social_icon">
						<span><i class="fab fa-facebook-square"></i></span> <span><i
							class="fab fa-google-plus-square"></i></span> <span><i
							class="fab fa-twitter-square"></i></span>
					</div>
				</div>
				<%
				if (session.getAttribute("error") != null) {
				%>
				<div class="errorLogin">
					<p style="color: red"><%=session.getAttribute("error")%></p>
					<%
					session.removeAttribute("error");
					%>
				</div>
				<%
				}
				%>
				<div>
					<div class="card-body">
						<form data-wow-delay=".5s" action="/user/insert" method="POST">
							<div class="radio_gender">
								<div class="left_gender">
									<p class="gender">Giới Tính:</p>
								</div>
								<div class="Right_gender">
									<div class="radio_button1">
										<input type="radio" id="gender" class="radio_sex" name="sex" value="1" required="required">   
										<label for="html" class="gender">Nam</label>
									</div>
									<div class="radio_button1">
										<input type="radio" id="gender2" class="radio_sex" name="sex" value="0" required="required">   
										<label for="css" class="gender">Nữ</label>
									</div>
								</div>
								 
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="name" placeholder="name" name="name" id="name"
									class="form-control" required="required">
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-at"></i></span>
								</div>
								<input type="email" class="form-control" placeholder="Email"
									name="email" required>

							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-phone"></i></span>
								</div>
								<!-- 						<input type="email" class="form-control" placeholder="Email" name="email" required> -->
								<input type="text" id="phone" class="form-control"
									placeholder="Nhập số điện thoại" name="phone"
									oninput="checkphone(this)" required="required">
								<script language='javascript' type='text/javascript'>
									function checkphone(input) {
										var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;
										var phone = document
												.getElementById("phone").value;
										if (regExp.test(phone))
											input.setCustomValidity('');
										/* alert('SĐT hợp lệ!');  */
										else
											input
													.setCustomValidity('Số điện thoại không hợp lệ');
										/* alert('SĐT không hợp lệ!');  */
									}
								</script>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-map"></i></span>
								</div>
								<input type="text" id="phone" class="form-control" placeholder="Nhập địa chỉ" name="adress" required="required">
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<!-- 						<input type="email" class="form-control" placeholder="Email" name="email" required> -->
								<input type="password" placeholder="Mật khẩu"
									class="form-control" id="pwd" name="password"
									required="required">

							</div>


							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<!-- 						<input type="password" class="form-control" placeholder="Mật Khẩu" name="password" required> -->
								<input type="password" placeholder="Nhập lại mật khẩu"
									class="form-control" id="repwd" oninput="check(this)"
									required="required">
								<script language='javascript' type='text/javascript'>
									function check(input) {
										if (input.value != document
												.getElementById('pwd').value) {
											input
													.setCustomValidity('Mật khẩu nhập lại không đúng');
										} else {
											input.setCustomValidity('');
										}
									}
								</script>
							</div>
							<div class="row align-items-center remember">
								<!-- 						<input type="checkbox">Nhớ lựa chọn của tôi -->
							</div>
							<div class="form-group">
								<input type="hidden" value="insert"
									class="btn float-right login_btn" name="command"> <input
									type="submit" value="Đăng Ký" class="btn float-right login_btn">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>