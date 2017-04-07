<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-3">
    <div class="panel panel-default">
        <div class="panel-body text-center">
            <div class="thumbnail">
                <img src="${SITE_URL}/asset/img/avatar-img/${sessionScope.user.url_image}" class="img-responsive">
            </div>
            <p><span class="label label-default">Standard User</span></p>
            <p><strong>${sessionScope.user.first_name} ${sessionScope.user.last_name}</strong></p>
            <a href="${SITE_URL}/follow.jsp">
                <small>Follower</small>
                <h4>21</h4>
                <small>Following</small>
                <h4>203</h4>
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
        <div class="panel-heading"><h3>New Work: Following</h3></div>
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
</div>

<jsp:include page="templates/footer.jsp" />
