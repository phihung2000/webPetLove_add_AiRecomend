<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chính sách</title>

        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/header.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="/resources/js/jquery.min.js"></script>
        <!-- //js -->
        <!-- for bootstrap working -->
        <script type="text/javascript" src="/resources/js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- timer -->
        <link rel="stylesheet" href="/resources/css/jquery.countdown.css" />
        <!-- //timer -->
        <!-- animation-effect -->
        <link href="/resources/css/animate.min.css" rel="stylesheet"> 
        <script src="/resources/js/wow.min.js"></script>
        <script>
            new WOW().init();
            $(document).ready(function() {
            	$('.active').removeClass('active');
            	$('.policy').addClass('active');
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="container-fluid product">
        <section class="section-thongtinlienhe">
            <div class="thongtinlienhe">
                <h3 class="info_contact">THÔNG TIN LIÊN HỆ</h3>
                <h3 class="text-left text-black-50">Nếu Bạn Ở TP.Thủ Dầu Một</h3>
                	<span class="thanhvien">- Shop Linh Kiện Phi hùng :06 Trần Văn Ơn, Phú Hoà ,TP Thủ Dầu Một,Bình Dương<br></span>
                	<span class="thanhvien">- Nếu bạn có thắc về vấn đề sản phẩm hay muốn tư vấn về sản phẩm thì hãy gọi hottline : 0396476443<br></span>
                	<span class="thanhvien">- Shop hỗ trợ giải đáp thắc mắc 24/7 mọi thắc mắc đều sẽ được giải đáp trong vòng 24h&nbsp;</span>
                <h3 class="text-left text-black-50">Làm sao để trở thành thành viên của shop</h3>
                    <span class="thanhvien">- Bạn phải mua đồ và tích trữ điểm đủ điểm yêu cầu bạn sẽ được trở thành thành viên của Shop<br></span>
                    <span class="thanhvien">- Tích điểm đổi quà<br></span>
                    <span class="thanhvien">- Shop có rất nhiều khuyễn mãi giành cho các thành viên của shop<br></span>
                    <span class="thanhvien">+ Thẻ vip được giảm 40%<br></span>
                    <span class="thanhvien">+ Thẻ thành viên được giảm 20%<br></span>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="text-uppercase section-heading">liên hệ với chúng tôi</h2>
                    <h6 class="section-subheading text-muted" style="color: rgb(150,134,134);">Mọi thắc mắc sẽ được giải đáp trong 24h</h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form id="contactForm" name="contactForm" novalidate="novalidate">
                        <div class="form-row">
                            <div class="col col-md-6">
                                <div class="form-group"><input class="form-control" type="text" id="name" placeholder="Tên của bạn" required=""><small class="form-text text-danger flex-grow-1 help-block lead"></small></div>
                                <div class="form-group"><input class="form-control" type="email" id="email" placeholder="Email của bạn" required=""><small class="form-text text-danger help-block lead"></small></div>
                                <div class="form-group"><input class="form-control" type="tel" id="sdt" placeholder="Số điện thoại" required=""><small class="form-text text-danger help-block lead"></small></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group"><textarea class="form-control" id="message" placeholder="Đóng góp ý kiến" required=""></textarea></div>
                            </div>
                            <div class="col">
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-lg-12 text-center"><button class="btn btn-primary btn-xl text-uppercase" id="sendMessageButton" type="submit">gửi&nbsp;</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
