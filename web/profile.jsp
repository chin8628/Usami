<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Profiles"%>
<%@page import="model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="page-header">
    <h1>MyProfile</h1>
</div>

<div class="panel panel-default">
    <div class="panel-body row" id="profile">
        <div class="col-xs-4 col-sm-2 text-center">
            <span class="thumbnail">
                <img src="${SITE_URL}/asset/img/avatar-img/${requestScope.profile.getUrl_image()}" class="img-responsive avatar-img">
            </span>
        </div>
        <div class="col-xs-8 col-sm-8" id="description">
            <h3>${requestScope.user.getUsername()}</h3>
            <p>${requestScope.profile.getFirst_name()} ${requestScope.profile.getLast_name()}</p>
            <p>${requestScope.user.getEmail()}</p>
            <a href="${SITE_URL}/ViewFollow/?id=${requestScope.user.getUsername()}">
                <h4>${requestScope.countFollowing}</h4>
                <small>Following</small>
            </a>
            <a href="${SITE_URL}/ViewFollow/?id=${requestScope.user.getUsername()}">
                <h4>${requestScope.countFollower}</h4>
                <small>Follower</small>
            </a>
            <p>
                <c:choose>
                    <c:when test="${requestScope.user.getU_type() == 'STD'}">
                        <p><span class="label label-default">Standard creator</span></p>
                    </c:when>
                    <c:otherwise>
                        <p><span class="label label-warning">Premium creator</span></p>
                    </c:otherwise>
                </c:choose>
                
                <c:if test="${(requestScope.user.getUsername() == sessionScope.user.getUsername()) && sessionScope.user.getU_type() != 'STD'}">
                    <p>Valid until: ${sessionScope.user.getFexp_date()}</p>
                </c:if>

            </p>
            <div class="panel-body tag">
                <c:forEach var="tag" items="${requestScope.allTag}">
                    <a href="${SITE_URL}/Gallery/?tag=${tag.getTag_id()}">
                        <span class="label label-info"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> ${tag.getTag_name()}</span>
                    </a>
                </c:forEach>
            </div>

        </div>
        <div class="col-xs-12 col-sm-2 text-right">
            <button
                class='btn ${requestScope.btnFollow} btn-sm ${requestScope.btnShow} btn-follow ${requestScope.btnColor} col-sm-12'
                type="submit" value="${sessionScope.user.getUsername()},${requestScope.user.getUsername()}"
                >${requestScope.btnFollowText}
            </button>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="panel-default panel hidden-xs">
            <div class="panel-heading">Overview</div>
            <div class="panel-body">
                <canvas id="myChart" height="70"></canvas>
            </div>
        </div>

        <div class="alert alert-warning visible-xs-block" role="alert">
            <b>Oops!</b> This screen is too small to display Overview chart.
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>Income</strong> <small>Last 30 days</small></p>
                <h3>${requestScope.coin} <small>coin</small></h3>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>Visited</strong> <small>All Times</small></p>
                <h3>${requestScope.visited} <small>visted</small></h3>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>Favorited</strong> <small>All Times</small></p>
                <h3>${requestScope.favorited} <small>times</small></h3>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading"><h2>Arts</h2></div>
    <div class="panel-body" id="profile">
        <div class="col-sm-12">
            <div class="grid">
                <div class="grid-sizer col-md-3 col-sm-4 col-xs-6"></div>
                <c:forEach var="art" items="${requestScope.allArt}">
                    <div class="col-md-3 col-sm-4 col-xs-6 image-art grid-item">
                        <a  href="${SITE_URL}/View/?id=${art.getId()}" target="blank" class="thumbnail-2 text-center">
                            <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive center-block">
                            <div class="title">
                                <strong>${art.getTitle()}</strong>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        /* Create chart by Chart.js */
        var ctx = $("#myChart");
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ["1/03/2017", "8/03/2017", "16/03/2017", "24/03/2017", "31/03/2017"],
                datasets: [{
                    label: '# of Purchased (US Dollar)',
                    data: [20, 25, 30, 21, 27],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });

        $('.grid').isotope({
            itemSelector: '.grid-item',
            percentPosition: true,
            masonry: {
                columnWidth: '.grid-sizer'
            }
        })
    });

    // Follow Button
        $('.btn-follow').click(function() {
            text = $(this).val().split(',');
            user_id = text[0];
            own_id = text[1];
            btn = this;
            if ($(this).hasClass('btn-green')) {

                $.ajax({
                    url: "${SITE_URL}/Follow/?id="+user_id+"&ownid="+own_id+"&at=profile",
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
                    url: "${SITE_URL}/Follow/?id="+user_id+"&ownid="+own_id+"&at=profile",
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

</script>

<jsp:include page="templates/footer.jsp" />
