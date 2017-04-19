<%@page import="model.Art"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<% ArrayList<Art> popArt = (ArrayList<Art>) request.getAttribute("popArt");%>
<% ArrayList<Art> folArt = (ArrayList<Art>) request.getAttribute("folArt");%>

<div class="col-sm-3">
    <div class="panel panel-default">
        <div class="panel-body text-center">
            <div class="thumbnail">
                <img src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}" class="img-responsive">
            </div>
            <p><span class="label label-default">Standard User</span></p>
            <p><strong>${sessionScope.profile.getFirst_name()} ${sessionScope.profile.getLast_name()}</strong></p>
            <a href="${SITE_URL}/ViewFollow/?id=${sessionScope.user.getUsername()}">
                <small>Follower</small>
                <h4>${requestScope.countFollower}</h4>
                <small>Following</small>
                <h4>${requestScope.countFollowing}</h4>
            </a>
        </div>
    </div>
</div>

<div class="col-sm-9">
    <div class="panel panel-default">
        <div class="panel-heading"><h3>Recommended For You</h3></div>
        <div class="panel-body">
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
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading"><h3>Popular Art</h3></div>
        <div class="panel-body">
            <div class="col-sm-12">
                <% for(int i=0;i < popArt.size();i++){ %>
                <% if(i % 4 == 0) {%><div class="row"><% } %>
                <div class="col-sm-3 image-art">
                    <a  href="${SITE_URL}/View/?id=<%=popArt.get(i).getId()%>" target="blank" class="thumbnail text-center">
                        <img src="${SITE_URL}/asset/img/art/<%=popArt.get(i).getUrl()%>" class="img-responsive">
                        <div class="title">
                            <strong> <%= popArt.get(i).getTitle() %> </strong>
                        </div>
                    </a>
                </div>
                <% if(i % 4 == 3) {%></div><% } %>
                <%}%>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading"><h3>New Work: Following</h3></div>
        <div class="panel-body">
            <div class="col-sm-12">
                <% for(int i=0;i < folArt.size();i++){ %>
                <% if(i % 4 == 0) {%><div class="row"><% } %>
                <div class="col-sm-3 image-art">
                    <a  href="${SITE_URL}/View/?id=<%=folArt.get(i).getId()%>" target="blank" class="thumbnail text-center">
                        <img src="${SITE_URL}/asset/img/art/<%=folArt.get(i).getUrl()%>" class="img-responsive">
                        <div class="title">
                            <strong> <%= folArt.get(i).getTitle() %> </strong>
                        </div>
                    </a>
                </div>
                <% if(i % 4 == 3) {%></div><% } %>
                <%}%>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
