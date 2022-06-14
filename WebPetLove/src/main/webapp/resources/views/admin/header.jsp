<%@page import="com.webpetlove.ph.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
        <script src="/resources/js/jquery.min.js"></script>
        <script src="/resources/js/bootstrap-notify.min.js"></script>
        <script type="text/javascript">
        function checkNewBill(){
    		$.ajax({
				url : "/bill/news",
				type : "GET",
				async : false,
				success : function(data) {
					$.each(data, function(idx, obj){
						generateNotify('Khách hàng có sđt: ' + obj + ' vừa đặt hàng.');
					});
				},
				error : function(jqXHR, status, errorThrown) {
					console.log(errorThrown)
				}
				});
    	}
        
        
        function generateNotify(mess) {
			$.notify({
			      title: '<strong>Thông báo: </strong>',
			      icon: 'glyphicon glyphicon-star',
			      message: mess
			    },{
			      type: 'info',
			      animate: {
					    enter: 'animated fadeInDown',
			        	exit: 'animated fadeOutUp'
			      },
			      placement: {
			        from: "top",
			        align: "right"
			      },
			      newest_on_top: true,
			      offset: 40,
			      spacing: 10,
			      z_index: 1031,
			    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
				'<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
				'<span data-notify="icon"></span> ' +
				'<span data-notify="title">{1}</span> ' +
				'<span data-notify="message">{2}</span>' +
				'<div class="progress" data-notify="progressbar">' +
					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
				'</div>' +
				'<a href="{3}" target="{4}" data-notify="url"></a>' +
			'</div>'
			    });
		}        
        $(document).ready(function(){
        	
        	setInterval(function(){ 
        		//generateNotify("test")
        		checkNewBill();
        		}, 15000);
        });
        
        </script>
    </head>
    <body>
   <%
            User user = new User();
            if (session.getAttribute("useradmin") != null) {
                user = (User) session.getAttribute("useradmin");

            } else {
                user.setUserEmail("");
            }
        %>
	<div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                           <a href="index.html"><img class="img-responsive" src="/resources/images_admin/logo/logo.png" alt="#" /></a>
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul>
                                 <li><a href="#"><i class="fa fa-bell-o"></i><span class="badge">2</span></a></li>
                                 <li><a href="#"><i class="fa fa-question-circle"></i></a></li>
                                 <li><a href="#"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a></li>
                                 <li><a href="/admin/logout" class="fa fa-sign-out"></a></li>
                              </ul>
                              <ul class="user_profile_dd">
                                 <li class="">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><img class="img-responsive rounded-circle" src="/resources/images_admin/layout_img/user_img.jpg" alt="#"><span class="name_user">Admin,${useradmin.userName}</span></a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
    </body>
</html>
