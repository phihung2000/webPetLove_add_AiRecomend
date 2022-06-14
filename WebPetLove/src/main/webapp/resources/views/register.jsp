<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/header.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="/resources/js/jquery.min.js"></script>
        <!-- //js -->
        <link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
        <!-- for bootstrap working -->
        <script type="text/javascript" src="/resources/js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- animation-effect -->
        <link href="/resources/css/animate.min.css" rel="stylesheet"> 
        <script src="/resources/js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
        <!-- //animation-effect -->
    </head>
    <body>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"  type="text/javascript"></script>   
        <script type="text/javascript">
            $(document).ready(function ()
            {
                var x_timer;
                $("#email").keyup(function (e)
                {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function ()
                    {
                        check_username_ajax(user_name);
                    }, 1000);
                });
                function check_username_ajax(username)
                {
                    $("#user-result").html('<img src="img/ajax-loader.gif" />');
                    $.post('CheckEmailServlet', {'username': username}, function (data)
                    {
                        $("#user-result").html(data);
                    });
                }
            });
        </script> 
        <jsp:include page="header.jsp"></jsp:include>
            <!-- breadcrumbs -->
            <div class="breadcrumbs">
                <div class="container">
                    <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                        <li><a href="/shop/homepage"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Trang Chủ</a></li>
                        <li class="active">Đăng Ký</li>
                    </ol>
                </div>
            </div>
            <!-- //breadcrumbs -->
            <!-- register -->
            <div class="register">
                <div class="container">
                    <h3 class="animated wow zoomIn" data-wow-delay=".5s">ĐĂNG KÝ THÀNH VIÊN </h3>
                    <p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
                    <div class="login-form-grids">
                        <form class="animated wow slideInUp form-regis" data-wow-delay=".5s"  action="/user/insert" method="POST" >
                        <%if (session.getAttribute("error") != null) {%>         
                        <div>                            
                            <p style="color:red"><%=session.getAttribute("error")%></p>  
                            <%session.removeAttribute("error"); %>       
                        </div>                               
                        <%}%>
                            <input type="name" placeholder="name"  name="name" id="name" class="name" required="required" >
                            <input type="email" placeholder="Email" required="required"  name="email" id="email" class="email">
                            <input type="password" placeholder="Mật khẩu" class="pwd" id="pwd" name="password" required="required"  >
                            <input type="password" placeholder="Nhập lại mật khẩu" class="repwd" id="repwd"  oninput="check(this)" required="required" >
                             <script language='javascript' type='text/javascript'>
							    function check(input) {
							        if (input.value != document.getElementById('pwd').value) {
							            input.setCustomValidity('Mật khẩu nhập lại không đúng');
							        } else {
							            input.setCustomValidity('');
							        }
							    }
							</script>
                            <input type="text" id="phone"  placeholder="Nhập số điện thoại"  name="phone" oninput="checkphone(this)" required="required"  >
                            <script language='javascript' type='text/javascript'>
                            	function checkphone(input){
                            		var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;
                            		  var phone = document.getElementById("phone").value;
                            		  if (regExp.test(phone)) 
                            			   input.setCustomValidity('');
                            			  /* alert('SĐT hợp lệ!');  */
                            		    else 
                            		   input.setCustomValidity('Số điện thoại không hợp lệ'); 
                            		  	/* alert('SĐT không hợp lệ!');  */
                            		}
							</script>
                            <div class="register-check-box">
                                <div class="check">
                                </div>
                            </div>
                            <input type="hidden" value="insert" name="command">
                             <!-- <button type="submit" class="info" onclick="validatePhone()">Đăng Ký</button> -->
                            <input type="submit" class="info" value="Đăng Ký" />
                        </form>
                    </div>
                    <div class="register-home animated wow slideInUp" data-wow-delay=".5s">
                        <a href="/shop/homepage">Trang Chủ</a>
                    </div>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
