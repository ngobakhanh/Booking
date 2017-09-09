<%-- 
    Document   : layout
    Created on : Jan 6, 2017, 10:28:16 PM
    Author     : Khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<!--[if lt IE 8]><html class="no-js lt-ie8"> <![endif]-->
<html class="no-js">
    <head>
        <title>${title}</title>
        <!-- Import google fonts - Heading first/ text second -->
        <link href='http://fonts.googleapis.com/css?family=Quattrocento+Sans:400,700' rel='stylesheet' type='text/css'>
        <!-- Css files -->
        <!-- Icons -->
        <link href="css/icons.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="css/custom.css" rel="stylesheet" />
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
    </head>
    <body>
        <!-- .page-navbar -->
        <div id="header" class="page-navbar">
            <!-- .navbar-brand -->
            <a href="AdminController" class="navbar-brand hidden-xs hidden-sm p0 m0 ">
                <h2 align="center" class="m0 mt5 color-white  "><span class="glyphicon glyphicon-leaf"></span> ADMIN</h2>

            </a>
            <!-- / navbar-brand -->
            <!-- .no-collapse -->
            <div id="navbar-no-collapse" class="navbar-no-collapse">

                <!-- top right nav -->
                <ul class="nav navbar-nav navbar-right">

                    <li>
                        <div class="input-group input-icon input-large" style="margin-top:7px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                    </li>

                    <li>
                        <a href="UserController">
                            <i class="fa fa-power-off"></i>
                            <span class="sr-only">Logout</span>
                        </a>
                    </li>

                </ul>
                <!-- / top right nav -->
            </div>
            <!-- / collapse -->
        </div>
        <!-- / page-navbar -->
        <!-- #wrapper -->
        <div id="wrapper">
            <!-- .page-sidebar -->
            <aside id="sidebar" class="page-sidebar hidden-md hidden-sm hidden-xs">
                <!-- Start .sidebar-inner -->
                <div class="sidebar-inner">
                    <!-- Start .sidebar-scrollarea -->
                    <div class="sidebar-scrollarea">
                        <!--  .sidebar-panel -->
                        <div class="sidebar-panel">
                            <h5 class="sidebar-panel-title">Profile</h5>
                        </div>
                        <!-- / .sidebar-panel -->
                        <div class="user-info clearfix">
                            <img src="images/avatar.jpg" alt="avatar" class="avatar"/>
                            <!-- <span class="name">SuggeElson</span> -->
                            <span class="name">${admin}</span>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-xs"><i class="l-basic-gear"></i>
                                </button>
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">account <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu right" role="menu">
                                    <li><a href="AdminController?keyword=profile"><i class="fa fa-edit"></i>Profile</a>
                                    </li>
                                    <li><a href="UserController"><i class="fa fa-power-off"></i>Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--  .sidebar-panel -->
                        <div class="sidebar-panel">
                            <h5 class="sidebar-panel-title">Navigation</h5>
                        </div>
                        <!-- / .sidebar-panel -->
                        <!-- .side-nav -->
                        <div class="side-nav">
                            <ul class="nav">
                                <li>
                                    <a href="AdminController"><i class="l-basic-home"></i> <span class="txt">Home</span></a>
                                </li>
                                <li>
                                    <a href="AdminController?keyword=indexuser"><i class="glyphicon glyphicon-user"></i><span class="txt">User</span></a>
                                </li>
                                <li>
                                    <a href="AdminController?keyword=route"><i class="glyphicon glyphicon-road"></i><span class="txt">Route</span></a>
                                </li>
                                <li>
                                    <a href="AdminController?keyword=price"><i class="glyphicon glyphicon-list"></i><span class="txt">Price</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- / side-nav -->
                        <!--  .sidebar-panel -->

                    </div>
                    <!-- End .sidebar-scrollarea -->
                </div>
                <!-- End .sidebar-inner -->
            </aside>
            <!-- / page-sidebar -->

            <!-- .page-content -->
            <div class="page-content sidebar-page  clearfix">
                <div class="page-content-wrapper">
                    <div class="page-content-inner">
                        <jsp:include page="${view}"/>
                    </div>
                </div>
            </div>
            <!-- / page-content -->
            <div class="pull-right">
                <ul class="pagination">
                    <c:if test="${total < 2}">
                        <li class="prev disabled"><a href="#">← Previous</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li class="next disabled"><a href="#">Next → </a></li>
                     </c:if>
                     <c:if test="${total > 1}">
                        <li class="prev"><a href="#">← Previous</a></li>
                            <c:forEach var="page" begin="1" end="${total/10 + 1}">
                                <li class=""><a href="#">1</a></li>
                            </c:forEach>
                        <li class="next"><a href="#">Next → </a></li>
                    </c:if>
                </ul>
            </div>
        </div>
        <!-- / #wrapper -->
        <div id="footer" class="clearfix sidebar-page">
            <!-- Start #footer  -->
            <p class="pull-left">
                Copyrights &copy; 2016
            </p>

        </div>
        <!-- End #footer  -->
        <!-- Back to top -->
        <div id="back-to-top"><a href="#">Back to Top</a>
        </div>
        <!-- Javascripts -->
        <!-- Important javascript libs(put in all pages) -->
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <!-- Bootstrap plugins -->
        <script src="js/bootstrap/bootstrap.js"></script>
        <!-- Core plugins ( not remove ) -->
        <script src="js/libs/modernizr.custom.js"></script>
        <script>

            $(document).ready(function () {
                Insertdatetime();
            });
            function Insertdatetime()
            {
                var d = new Date();
                var date = d.getDate();
                var month = d.getMonth() + 1;
                var year = d.getFullYear();

                $('#d').prepend("<option value='" + date + "'>Ngày " + date + "</option>");
                for (var i = 31; i >= 1; i--)
                {
                    $('#d').prepend("<option value='" + i + "'>Ngày " + i + "</option>");
                }
                $('#m').prepend("<option value='" + month + "'>Tháng " + month + "</option>");
                for (var i = 12; i >= 1; i--) {
                    $('#m').prepend("<option value='" + i + "'>Tháng " + i + "</option>");
                }
                $('#y').prepend("<option value='" + year + "'>Năm " + year + "</option>");
                for (var i = year + 10; i >= year; i--) {
                    $('#y').prepend("<option value='" + i + "'>Năm " + i + "</option>");
                }
            }
            function loadTicket1() {
                window.location.href = 'http://localhost:8080/BookTicket/AdminController?idroute=' + $('#route').val() + '&date=' + $('#d').val() + '&&month=' + $('#m').val() + '&year=' + $('#y').val();
            }
        </script>
        <!-- Handle responsive view functions -->
        <script src="js/jRespond.min.js"></script>

        <script src="js/jquery.dynamic.js?v=5"></script>
        <script src="js/main.js?v=1"></script>
        <script src="js/script.js" type="text/javascript"></script>

    </body>
</html>

