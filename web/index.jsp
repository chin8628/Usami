<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Art"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<% ArrayList<Art> popArt = (ArrayList<Art>) request.getAttribute("popArt");%>
<% ArrayList<Art> folArt = (ArrayList<Art>) request.getAttribute("folArt");%>

<div class="col-sm-2">
    <div class="panel panel-default">
        <div class="panel-body text-center">
            <div class="row">
                <div class="col-sm-12 col-xs-5">
                    <img src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}" class="img-responsive thumbnail">
                </div>
                <div class="col-sm-12 col-xs-7">
                    <p>
                        <strong>${sessionScope.profile.getFirst_name()} ${sessionScope.profile.getLast_name()}</strong>
                    </p>
                    <p><span class="label label-default">Standard creator</span></p>
                    <p><span class="label label-warning">Premium creator</span></p>
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
                <% for(int i=0;i < popArt.size();i++){ %>
                <div class="col-md-3 col-sm-4 col-xs-6 grid-item image-art">
                    <a  href="${SITE_URL}/View/?id=<%=popArt.get(i).getId()%>" target="blank" class="thumbnail-2 text-center">
                        <img src="${SITE_URL}/asset/img/art/<%=popArt.get(i).getUrl()%>" class="img-responsive center-block">
                        <div class="title">
                            <strong> <%= popArt.get(i).getTitle() %> </strong>
                        </div>
                    </a>
                </div>
                <%}%>
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
                <% for(int i=0;i < folArt.size();i++){ %>
                <div class="col-md-3 col-sm-4 col-xs-6 grid-item image-art">
                    <a  href="${SITE_URL}/View/?id=<%=folArt.get(i).getId()%>" target="blank" class="thumbnail-2 text-center">
                        <img src="${SITE_URL}/asset/img/art/<%=folArt.get(i).getUrl()%>" class="img-responsive center-block">
                        <div class="title">
                            <strong> <%= folArt.get(i).getTitle() %> </strong>
                        </div>
                    </a>
                </div>
                <%}%>
            </div>
            <div class="col-sm-12 text-right">
                <a href="${SITE_URL}/Gallery/?art=following">>> View more</a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.grid').isotope({
            itemSelector: '.grid-item',
            percentPosition: true,
            masonry: {
                columnWidth: '.grid-sizer'
            }
        })
    });
</script>

<jsp:include page="templates/footer.jsp" />
