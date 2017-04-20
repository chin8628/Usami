<%@ page import="model.Art"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="templates/header.jsp" />

<div class="row">
    <div class="col-sm-12">
        <div class="page-header">
            <h1>Marketplace</h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-3">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a href="#">Art</a></li>
                    <li role="presentation"><a href="#">Special</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="col-sm-9">
        <c:if test="${requestScope.allArt != null}">
            <c:forEach var="art" items="${requestScope.allArt}">
                <div class="col-sm-4 image-product">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="nav nav-pills">
                                <a href="${SITE_URL}/View/?id=${art.getId()}">
                                    <p>
                                        <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive center-block">
                                    </p>
                                    <div class="title">
                                        <p>
                                            <strong>${art.getTitle()}</strong>
                                        </p>
                                    </div>
                                </a>
                                <a href="${SITE_URL}/ViewProfile/?id=${art.getUserId()}">
                                    <p>${art.getFullname()}</p>
                                </a>
                                <div class="price">
                                    <c:if test="${!art.getPrice().equals('free')}">
                                        <p>${art.getPrice()} <small>coin</small></p>
                                    </c:if>
                                    <c:if test="${art.getPrice().equals('free')}">
                                        <p><h5>Free</h5></p>
                                    </c:if>
                                    
                                </div>
                                <c:if test="${!sessionScope.user.getUsername().equals(art.getUserId())}">
                                    <c:if test="${!art.getPrice().equals('free') }">
                                    <c:if test="${art.checkPur(sessionScope.user.getUsername())}">
                                            <button class="btn btn-primary btn-sm col-sm-12" disabled="">Purchased</button>
                                    </c:if>
                                            
                                    <c:if test="${!art.checkPur(sessionScope.user.getUsername())}">
                                        <c:if test="${ art.isInCart(cart) }">
                                            <form action="${SITE_URL}/RemoveFromCart/?id=${art.getId()}&origin=${SITE_URL}/Market" method="POST" >
                                            <button class="btn btn-danger btn-sm col-sm-12">Remove from cart</button>
                                        </form>
                                        </c:if>
                                        <c:if test="${ !art.isInCart(cart) }">
                                        <form action="${SITE_URL}/AddToCart/?id=${art.getId()}&origin=${SITE_URL}/Market" method="POST" >
                                            <button class="btn btn-success btn-sm col-sm-12">Add to cart</button>
                                        </form>
                                        </c:if>
                                    </c:if>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.user.getUsername().equals(art.getUserId())}">
                                        <button class="btn btn-default btn-sm col-sm-12" disabled="">This is your art</button>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
