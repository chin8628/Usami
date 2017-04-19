<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="SITE_URL" value="${pageContext.request.contextPath}" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="${SITE_URL}/asset/img/favicon.ico">
    <link rel="stylesheet" href="${SITE_URL}/asset/css/normalize.css">
    <link rel="stylesheet" href="${SITE_URL}/asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="${SITE_URL}/asset/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${SITE_URL}/asset/css/jquery.tagsinput.min.css">
    <link rel="stylesheet" href="${SITE_URL}/asset/css/style.css">

    <script src="${SITE_URL}/asset/js/jquery-3.2.0.min.js"></script>
    <script src="${SITE_URL}/asset/js/bootstrap.min.js"></script>
    <script src="${SITE_URL}/asset/js/jquery.dataTables.min.js"></script>
    <script src="${SITE_URL}/asset/js/dataTables.bootstrap.min.js"></script>
    <script src="${SITE_URL}/asset/js/Chart.min.js"></script>
    <script src="${SITE_URL}/asset/js/jquery.tagsinput.min.js"></script>
    <script src="${SITE_URL}/asset/js/script.js"></script>

    <title>Usami | Marketplace of Creative</title>
</head>
<body>
    <div id="main-body">
        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container-fluid col-sm-10 col-sm-offset-1">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${SITE_URL}/Index">Usami</a>
                </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${SITE_URL}/Market">Market</a></li>
                    <li><a href="${SITE_URL}/upload.jsp">Upload</a></li>
                    <li><a href="${SITE_URL}/Tag">Tags</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${SITE_URL}/administrator/index.jsp">Admin</a></li>
                    <li><a href="${SITE_URL}/cart.jsp">Cart</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            ${sessionScope.user.username}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${SITE_URL}/ViewProfile/?id=${sessionScope.user.getUsername()}">MyProfile</a></li>
                            <li><a href="${SITE_URL}/Storage">MyStorage</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${SITE_URL}/setting/profile.jsp">Edit profile</a></li>
                            <li><a href="${SITE_URL}/Pocket">Pocket</a></li>
                            <li><a href="${SITE_URL}/history.jsp">History</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${SITE_URL}/Logout">Sign Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div class="container col-sm-8 col-sm-offset-2">
