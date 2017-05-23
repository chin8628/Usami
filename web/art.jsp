<%@page import="model.User"%>
<%@page import="model.Profiles"%>
<%@page import="model.Art"%>
<%@page import="java.util.*"%>
<%@page import="model.CommentModel"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
    <div class="col-sm-2">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <div class="thumbnail">
                        <img src="${SITE_URL}/asset/img/avatar-img/${requestScope.owner.getUrl_image()}" class="img-responsive avatar-img">
                    </div>
                    <p>
                        <a href="${SITE_URL}/ViewProfile/?id=${requestScope.owner.getUsername()}">
                            ${requestScope.owner.getFirst_name()}  ${requestScope.owner.getLast_name()}
                        </a>
                    </p>

                    <c:choose>
                        <c:when test="${requestScope.ownerArt.getU_type() == 'STD'}">
                            <p><span class="label label-default">Standard creator</span></p>
                        </c:when>
                        <c:otherwise>
                            <p><span class="label label-warning">Premium creator</span></p>
                        </c:otherwise>
                    </c:choose>

                        <!--Follow Button-->
                        <button
                            class='btn ${requestScope.btnFollow} btn-sm ${requestScope.btnShow} btn-follow ${requestScope.btnColor} col-sm-12'
                            type="submit" value="${sessionScope.user.getUsername()},${requestScope.owner.getUsername()},${requestScope.art.getId()}"
                            >${requestScope.btnFollowText}
                        </button>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <c:if test="${requestScope.art.getPrice() != 'free'}">
                        <h3>${requestScope.art.getPrice()} <small>coin</small></h3><br>
                        <c:if test="${!sessionScope.user.getUsername().equals(art.getUserId())}">
                            <c:if test="${art.checkPur(sessionScope.user.getUsername())}">
                                <button class="btn btn-default btn-sm col-sm-12" disabled="">Purchased</button>
                            </c:if>
                            <c:if test="${!art.checkPur(sessionScope.user.getUsername())}">

                                <!--Remove form Cart-->
                                <c:if test="${ art.isInCart(cart) }">
                                    <button class="btn btn-danger btn-sm col-sm-12 cart-btn remove-cart"
                                            value="${art.getId()},${art.getTitle()}">Remove from cart
                                    </button>
                                </c:if>

                                <!--Add to Cart-->
                                <c:if test="${ !art.isInCart(sessionScope.cart) }">
                                    <button class="btn btn-success btn-sm col-sm-12 cart-btn add-cart"
                                            value="${art.getId()},${art.getTitle()}">Add to cart
                                    </button>
                                </c:if>
                            </c:if>
                        </c:if>
                        <c:if test="${sessionScope.user.getUsername().equals(art.getUserId())}">
                            <button class="btn btn-default btn-sm col-sm-12" disabled="">This is your art</button>
                        </c:if>
                    </c:if>
                    
                    <c:if test="${requestScope.art.getPrice() == 'free'}">
                            <h2>Free</h2><br>
                    </c:if>
 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h3>${requestScope.art.getView()}  <small>Views</small></h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <form
                        action="${SITE_URL}/Download/?id=${requestScope.art.getId()}&mode=o"
                        method="POST">
                        <button class='btn btn-primary col-sm-12' ${requestScope.oriEna} type="submit">Download Original</button>
                    </form>
                </div>
                <div class="panel-body text-center">
                    <form
                        action="${SITE_URL}/Download/?id=${requestScope.art.getId()}&mode=r"
                        method="POST">
                        <button class='btn btn-primary col-sm-12' ${requestScope.resEna} type="submit">Download 1080p</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-10">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="page-header">
                        <h2>${requestScope.art.getTitle()}</h2>
                        <h4><small> ${requestScope.art.getUpload_date()} </small></h4>
                    </div>
                </div>

                <div class="col-sm-12">
                    <p>${requestScope.art.getDesc()} </p>
                </div>

                <!--Set Tag-->
                <div class="col-sm-12">
                    <div id="tag-group">
                        <c:forEach var="tag" items="${requestScope.allTag}">
                            <a href="${SITE_URL}/Gallery/?tag=${tag.getTag_id()}">
                                <span class="label label-info tag">
                                    <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> ${tag.getTag_name()}
                                </span>
                            </a>
                        </c:forEach>
                    </div>
                </div>

                <!--View Arts-->
                <div class="col-sm-12">
                    <a href="${SITE_URL}/asset/img/art/${requestScope.art.getUrl()}" target="_blank">
                        <img
                            src="${SITE_URL}/asset/img/art/${requestScope.art.getUrl()}"
                            class="img-responsive center-block"
                            id="single-art">
                    </a>
                </div>

                <!--favorite button-->
                <div class="col-sm-12">
                    <button type="submit" class="btn ${requestScope.btnFav} btn-xs" id="favorite-btn" value="${requestScope.count}">
                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span> ${requestScope.count}
                    </button>
                </div>


                <div class="col-sm-12">
                    <div class="panel panel-default" id="comment-box">
                        <div class="panel-body">
                            <div class="media">
                                <div class="media-left">
                                    <img
                                        class="media-object avatar-img"
                                        src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}">
                                </div>
                                <div class="media-body">
                                    <!--Comment Box-->
                                    <h4 class="media-heading">Comment</h4>
                                    <form action="${SITE_URL}/Comment/?&id=${requestScope.art.getId()}" method="POST">
                                        <textarea name="comment"></textarea>
                                        <button type="submit" class="btn btn-success btn-sm">Send</button>
                                    </form>
                                </div>
                                <hr>
                            </div>

                            <!--All Comment-->

                            <c:if test="${requestScope.allComm != null}">
                                <c:forEach var="comm" items="${requestScope.allComm}">
                                    <div class="media comment-reply">
                                            <div class="media-left">
                                                <img class="media-object image-search" src="${SITE_URL}/asset/img/avatar-img/${comm.getUrl_image()}">
                                            </div>
                                            <div class="media-body">
                                                <p><a href="${SITE_URL}/ViewProfile/?id=${comm.getUsername()}">${comm.getFirst_name()} ${comm.getLast_name()}</a> <small>${comm.getFcomm_date()}</small></p>
                                                <p>${comm.getText()}</p>
                                            </div>
                                            <hr>
                                    </div>
                                </c:forEach>
                            </c:if>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
        // Follow Button
        $('.btn-follow').click(function() {
            text = $(this).val();
            text = text.split(',');
            user_id = text[0];
            own_id = text[1];
            img_id = text[2];
            btn = this;
            if ($(this).hasClass('btn-green')) {

                $.ajax({
                    url: "${SITE_URL}/Follow/?id="+user_id+"&ownid="+own_id+"&imgid="+img_id+"&at=art",
                    success: function(result){
                        $(btn)
                                .removeClass('btn-success btn-green')
                                .addClass('btn-danger btn-red')
                                .text('Unfollow');
                        alertify.success("Followed <strong>"+own_id+"</strong> Already");
                        }
                    });
            }
            else if ($(this).hasClass('btn-red')) {
                $.ajax({
                    url: "${SITE_URL}/Follow/?id="+user_id+"&ownid="+own_id+"&imgid="+img_id+"&at=art",
                    success: function(result){
                        $(btn)
                                .removeClass('btn-danger btn-red')
                                .addClass('btn-success btn-green')
                                .text('Follow');
                        alertify.error("Unfollowed <strong>"+own_id+"</strong> Already");
                    }
                });
            }
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
        
        // Favorite Button
        $('#favorite-btn').click(function() {
            num = $(this).text();
            num = num.replace(/\s/g, '');
            num = parseInt(num);
            btn = this;
            if ($(this).hasClass('btn-success')) {

                $.ajax({
                    url: "${SITE_URL}/Favorite/?&id=${requestScope.art.getId()}",
                    success: function(result){
                        $(btn)
                                .removeClass('btn-success')
                                .addClass('btn-default')
                                .html('<span class="glyphicon glyphicon-star" aria-hidden="true"></span> '+(num-1));
                    }
                });
            }
            else if ($(this).hasClass('btn-default')) {
                $.ajax({
                    url: "${SITE_URL}/Favorite/?&id=${requestScope.art.getId()}",
                    success: function(result){
                        $(btn)
                                .removeClass('btn-default')
                                .addClass('btn-success')
                                .html('<span class="glyphicon glyphicon-star" aria-hidden="true"></span> '+(num+1));
                    }
                });
            }
        });
</script>

<jsp:include page="templates/footer.jsp" />
