<%@page import="model.Profiles"%>
<%@page import="model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<% User user = (User) request.getAttribute("user"); 
   Profiles profile = (Profiles) request.getAttribute("profile"); %>

<div class="page-header">
    <h1>MyProfile</h1>
</div>

<div class="panel panel-default">
    <div class="panel-body row" id="profile">
        <div class="col-sm-3 text-center">
            <span class="thumbnail">
                <img src="${SITE_URL}/asset/img/avatar-img/<%= profile.getUrl_image() %>" class="img-responsive">
            </span>
            <p><form action="${SITE_URL}/Follow/?id=${sessionScope.user.getUsername()}&ownid=<%= user.getUsername() %>" method="POST">
                <button class="btn <%= request.getAttribute("btn-follow") %> btn-sm <%= request.getAttribute("btn-show") %>" type="submit"><%= request.getAttribute("btn-follow-text") %></button>
                </form></p>
        </div>
        <div class="col-sm-9" id="description">
            <h3><%= user.getUsername() %></h3>
            <p><%= profile.getFirst_name() %> <%= profile.getLast_name() %></p>
            <p><%= user.getEmail() %></p>
            <a href="${SITE_URL}/ViewFollow/?id=<%= user.getUsername() %>">
                <h4><%= request.getAttribute("countFollowing") %></h4>
                <small>Following</small>
            </a>
            <a href="${SITE_URL}/ViewFollow/?id=<%= user.getUsername() %>">
                <h4><%= request.getAttribute("countFollower") %></h4>
                <small>Follower</small>
            </a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="panel-default panel">
            <div class="panel-heading">Overview</div>
            <div class="panel-body">
                <canvas id="myChart" height="100"></canvas>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>Income</strong> <small>Last 30 days</small></p>
                <h3>$102.85</h3>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>Visited</strong> <small>Last 30 days</small></p>
                <h3>39,304 <small>visted</small></h3>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <p><strong>Favorited</strong> <small>Last 30 days</small></p>
                <h3>3,032 <small>times</small></h3>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading"><h2>Arts</h2></div>
    <div class="panel-body" id="profile">
        <div class="col-sm-12">
            <div class="col-sm-3 image-art">
                <a  href="${SITE_URL}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${SITE_URL}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${SITE_URL}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${SITE_URL}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${SITE_URL}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<script>
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
</script>

<jsp:include page="templates/footer.jsp" />
