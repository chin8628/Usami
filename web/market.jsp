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
    <div class="col-sm-2">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked" role="tablist">
                    <li role="presentation" class="active" id="art-btn">
                        <a href="#art" aria-controls="art" role="tab" data-toggle="pill">Art</a>
                    </li>
                    <li role="presentation" id="special-btn">
                        <a href="#special" aria-controls="special" role="tab" data-toggle="pill">Buy Premium</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="tab-content">
        <div class="col-sm-10 tab-pane active" id="art" role="tabpanel">
            <div class="grid">
                <c:if test="${requestScope.allArt != null}">
                    <div class="grid-sizer col-md-3 col-sm-4 col-xs-12"></div>
                    <c:forEach var="art" items="${requestScope.allArt}">
                        <div class="col-md-3 col-sm-4 col-xs-12 image-product grid-item">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <ul class="nav nav-pills">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                                            <p>
                                                <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive center-block">
                                            </p>
                                            <div class="title">
                                                <strong>${art.getTitle()}</strong>
                                            </div>
                                        </a>
                                        <a href="${SITE_URL}/ViewProfile/?id=${art.getUserId()}">
                                            <div class="title">
                                                <strong>${art.getFullname()}</strong>
                                            </div>
                                        </a>
                                        <div class="price">
                                            <p>${art.getPrice()} <small>coin</small></p>
                                        </div>
                                        <c:if test="${!sessionScope.user.getUsername().equals(art.getUserId())}">
                                            <c:if test='${!art.getPrice().equals("free")}'>
                                                <c:if test="${art.checkPur(sessionScope.user.getUsername())}">
                                                    <button class="btn btn-default btn-sm col-sm-12" disabled="">Purchased</button>
                                            </c:if>
                                            <c:if test="${!art.checkPur(sessionScope.user.getUsername())}">
                                                <c:if test="${ art.isInCart(cart) }">
                                                    <button class="btn btn-danger btn-sm col-sm-12 cart-btn remove-cart"
                                                            value="${art.getId()},${art.getTitle()}">
                                                        Remove from cart
                                                    </button>
                                                </c:if>
                                                <c:if test="${ !art.isInCart(sessionScope.cart) }">
                                                    <button
                                                        class="btn btn-success btn-sm col-sm-12 cart-btn add-cart"
                                                        value="${art.getId()},${art.getTitle()}">
                                                        Add to cart
                                                    </button>
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

        <!--Special-->
        <div class="col-sm-10 tab-pane" id="special" role="tabpanel">
            <div class="grid">
                <c:if test="${requestScope.allPrm != null}">
                    <div class="grid-sizer col-md-3 col-sm-4 col-xs-12"></div>
                    <c:forEach var="art" items="${requestScope.allPrm}">
                        <div class="col-md-3 col-sm-4 col-xs-12 image-product grid-item">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <ul class="nav nav-pills">
                                        <a href="#">
                                            <p>
                                                <img src="${SITE_URL}/asset/img/${art.getProduct_id()}.png" class="img-responsive center-block">
                                            </p>
                                            <div class="title">
                                                <strong>${art.getName()}</strong>
                                            </div>
                                        </a>
                                        <div class="price">
                                            <p id="price">${art.getPrice()} <small>coin</small></p>
                                        </div>

                                        <!--Buy Premium-->
                                        <button class="btn btn-success btn-sm col-sm-12" id="buy" value="${art.getProduct_id()},${art.getName()},${sessionScope.user.getCoin()},${art.getPrice()}">Buy</button>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    $(window).on("load", function() {
        $('.grid').isotope({
            itemSelector: '.grid-item',
            percentPosition: true,
            masonry: {
                columnWidth: '.grid-sizer'
            }
        });
    });

    $(document).ready(function() {

        $('#art-btn, #special-btn').click(function(event) {
            $(this).ready(function($) {
                $('.grid').isotope();
            });
        });

        // Cart Button
        $('.cart-btn').click(function() {
            text = $(this).val();
            text = text.split(',');
            id = text[0];
            title = text[1];
            btn = this;
            if ($(this).hasClass('add-cart')) {

                $.ajax({
                    url: "${SITE_URL}/AddToCart/?id="+id+"&origin=${SITE_URL}/Market",
                    success: function(result){
                        if ($.trim(result) === "ok") {
                            $(btn).removeClass( "btn-success" ).addClass("btn-danger").text('Remove from cart').removeClass('add-cart').addClass('remove-cart');
                            alertify.success("Added <strong>"+title+"</strong> to <strong>cart</strong>");

                        }
                    }
                });
            }
            else if ($(this).hasClass('remove-cart')) {
                $.ajax({
                    url: "${SITE_URL}/RemoveFromCart/?id="+id+"&origin=${SITE_URL}/Market",
                    success: function(result){
                        if ($.trim(result) === "ok") {
                            $(btn).removeClass( "btn-danger" ).addClass("btn-success").text('Add to cart').removeClass('remove-cart').addClass('add-cart');
                            alertify.error("Removed <strong>"+title+"</strong> from <strong>cart</strong>");

                        }
                    }
                });
            }
        });

        // Buy Button
        $("#buy").click(function() {
            text = $(this).val().split(',');
            pro_id = text[0];
            title = text[1];
            coin = parseInt(text[2]);
            price = parseInt(text[3]);

            alertify.confirm("<h3><strong>"+title+"</strong></h3>\n\
                <img src=\"${SITE_URL}/asset/img/"+pro_id+".png\" class=\"img-responsive center-block\"> \n\
                <h4>Premium Privilage </h4> \n\
                - Permission to sell your art on the marketplace. <br> \n\
                - Download free art at the original size. <br> \n\
                - Ads-free browsing", function () {

                if ("${sessionScope.user.getU_type()}" === "ADM") {
                    alertify.delay(3000).error("Access Denied (Administrator)");
                    $.ajax({
                        url: "#",
                        success: function(){
                        }
                    });
                }
                else {
                    if (coin >= price) {
                        alertify.success("Purchase Successful");
                        $.ajax({
                            url: "${SITE_URL}/BuyPremium/?id="+pro_id,
                            success: function(){
                                setTimeout(function() {
                                    location.reload();
                                }, 1000);
                            }
                        });
                    } else {
                        alertify.delay(3000).error("Your money is not enough to purchase. Please add more money to your <a href=\"${SITE_URL}/Pocket\">Pocket.</a>");
                        $.ajax({
                            url: "#",
                            success: function(){
                            }
                        });
                    }
                }


            }, function() {
                alertify.error("Purchase Cancled");
            });

        });
    });
</script>



<jsp:include page="templates/footer.jsp" />
