<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/img/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css">

    <script src="${pageContext.request.contextPath}/asset/js/jquery-3.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/bootstrap.min.js"></script>

    <title>Usami | Marketplace of Creative</title>
</head>
<body>
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}">Usami</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/market.jsp">Market</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Setting <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/setting/profile.jsp">Edit profile</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/profile.jsp">Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/non-auth/auth.jsp">Sign Out</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div class="container col-sm-8 col-sm-offset-2">
