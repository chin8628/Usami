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

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="rand"><%= java.lang.Math.round(java.lang.Math.random() * 4) + 1 %></c:set>

    <style>
        html, body {
            background-image: url('${pageContext.request.contextPath}/asset/img/background/background-${rand}.jpg');
            background-size: cover;
            background-position: center;
        }
    </style>

    <title>Usami | Marketplace of Creative</title>
</head>
<body>
    <div class="container col-sm-8 col-sm-offset-2">
