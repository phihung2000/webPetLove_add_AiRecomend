
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.webpetlove.ph.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link rel="icon" href="/resources/images_admin/fevicon.png" type="image/png" />
       <link rel="stylesheet" href="/resources/css_admin/bootstrap.min.css" />
      <link rel="stylesheet" href="/resources/css_admin/style.css" />
      <link rel="stylesheet" href="/resources/css_admin/responsive.css" />
      <link rel="stylesheet" href="/resources/css_admin/colors.css" />
      <link rel="stylesheet" href="/resources/css_admin/bootstrap-select.css" />
      <link rel="stylesheet" href="/resources/css_admin/perfect-scrollbar.css" />
      <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="/resources/css_admin/custom.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biểu đồ, thống kê</title>

        <link href="/resources/css/mos-style.css" rel='stylesheet' type='text/css' />

        <!-- load Google AJAX API -->
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
            <c:forEach var="item" items="${datas}">['${item.name}',${item.value}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê danh mục sản phẩm',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart'));
                chart.draw(data, options);
            }
            </script>

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
                <div class="midde_cont">
                <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Loại sản phẩm</h2>
                           </div>
                        </div>
                     </div>

                    <table class="data">

                        <div id="chart"></div>

                    </table>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
	</div>
	</div>
</div>
    </body>
</html>

