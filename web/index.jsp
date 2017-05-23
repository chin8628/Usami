<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-2">
    <div class="panel panel-default">
        <div class="panel-body text-center">
            <div class="row">
                <div class="col-sm-12 col-xs-5">
                    <div class="col-xs-12 thumbnail">
                        <img src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}" class="img-responsive avatar-img">
                    </div>
                </div>
                <div class="col-sm-12 col-xs-7">
                    <p>
                        <strong>${sessionScope.profile.getFirst_name()} ${sessionScope.profile.getLast_name()}</strong>
                    </p>

                    <c:choose>
                        <c:when test="${sessionScope.user.getU_type() == 'STD'}">
                            <p><span class="label label-default">Standard creator</span></p>
                        </c:when>
                        <c:when test="${sessionScope.user.getU_type() == 'ADM'}">
                            <p><span class="label label-primary">Administrator</span></p>
                        </c:when>
                        <c:otherwise>
                            <p><span class="label label-warning">Premium creator</span></p>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-12 col-xs-6">
                        <a href="${SITE_URL}/ViewFollow/?id=${sessionScope.user.getUsername()}">
                            <small>Follower</small>
                            <h4>${requestScope.countFollower}</h4>
                        </a>
                    </div>
                    <div class="col-sm-12 col-xs-6">
                        <a href="${SITE_URL}/ViewFollow/?id=${sessionScope.user.getUsername()}">
                            <small>Following</small>
                            <h4>${requestScope.countFollowing}</h4>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <div class="row hidden-xs" id="ads" >
            <div class="col-sm-12">
                <c:if test="${sessionScope.user.getU_type().equals('STD')}">
                    <img src="${SITE_URL}/asset/img/ads1.gif" class="img-responsive" style="margin-bottom:5px;">
                    <img src="${SITE_URL}/asset/img/ads2.jpg" class="img-responsive" style="margin-bottom:5px;">
                    <img src="${SITE_URL}/asset/img/ads3.jpg" class="img-responsive" style="margin-bottom:5px;">
                    <img src="${SITE_URL}/asset/img/ads4.jpg" class="img-responsive" style="margin-bottom:5px;">
                    <img src="${SITE_URL}/asset/img/ads5.jpg" class="img-responsive" style="margin-bottom:5px;">
                    <img src="${SITE_URL}/asset/img/ads6.jpg" class="img-responsive" style="margin-bottom:5px;">
                    <img src="${SITE_URL}/asset/img/ads7.jpg" class="img-responsive" style="margin-bottom:5px;">
                </c:if>
            </div>
        </div>
    </div>




<div class="col-sm-10">
    <!--Recommend For You-->
    <div class="panel panel-default">
        <div class="panel-heading"><h3>Recommended For You</h3></div>
        <div class="panel-body">
            <div class="grid">
                <div class="grid-sizer col-md-3 col-sm-4 col-xs-6"></div>
                <c:forEach var="art" items="${requestScope.artRecommend}">
                    <div class="col-md-3 col-sm-4 col-xs-6 grid-item image-art">
                    <a  href="${SITE_URL}/View/?id=${art.getId()}" target="blank" class="thumbnail text-center">
                        <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive">
                        <div class="title">
                            <strong>${art.getTitle()}</strong>
                        </div>
                    </a>
                    </div>
                </c:forEach>
            </div>
            <div class="col-sm-12 text-right">
                <a href="${SITE_URL}/Gallery/?art=recommend">>> View more</a>
            </div>
        </div>
    </div>

    <!--Random Art-->
    <div class="panel panel-default">
        <div class="panel-heading"><h3>Random Art</h3></div>
        <div class="panel-body">
            <div class="grid">
                <div class="grid-sizer col-md-3 col-sm-4 col-xs-6"></div>
                <c:forEach var="art" items="${requestScope.artRandom}">
                    <div class="col-md-3 col-sm-4 col-xs-6 grid-item image-art">
                        <a  href="${SITE_URL}/View/?id=${art.getId()}" target="blank" class="thumbnail text-center">
                            <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive">
                            <div class="title">
                                <strong>${art.getTitle()}</strong>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!--    Popular Art     -->
    <div class="panel panel-default">
        <div class="panel-heading"><h3>Popular Art</h3></div>
        <div class="panel-body">
            <div class="grid">
                <div class="grid-sizer col-md-3 col-sm-4 col-xs-6"></div>
                
                <c:forEach var="pArt" items="${requestScope.popArt}">
                    <div class="col-md-3 col-sm-4 col-xs-6 grid-item image-art">
                        <a  href="${SITE_URL}/View/?id=${pArt.getId()}" target="blank" class="thumbnail-2 text-center">
                            <img src="${SITE_URL}/asset/img/art/${pArt.getUrl()}" class="img-responsive center-block">
                            <div class="title">
                                <strong> ${pArt.getTitle()} </strong>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                
            </div>
            <div class="col-sm-12 text-right">
                <a href="${SITE_URL}/Gallery/?art=popular">>> View more</a>
            </div>
        </div>
    </div>

    <!--    Following Art       -->
    <div class="panel panel-default">
        <div class="panel-heading"><h3>New Work: Following</h3></div>
        <div class="panel-body">
            <div class="grid">
                <div class="grid-sizer col-md-3 col-sm-4 col-xs-6"></div>
                
                <c:forEach var="fArt" items="${requestScope.folArt}">
                    <div class="col-md-3 col-sm-4 col-xs-6 grid-item image-art">
                        <a  href="${SITE_URL}/View/?id=${fArt.getId()}" target="blank" class="thumbnail-2 text-center">
                            <img src="${SITE_URL}/asset/img/art/${fArt.getUrl()}" class="img-responsive center-block">
                            <div class="title">
                                <strong> ${fArt.getTitle()} </strong>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                
            </div>
            <div class="col-sm-12 text-right">
                <a href="${SITE_URL}/Gallery/?art=following">>> View more</a>
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
</script>

<jsp:include page="templates/footer.jsp" />
