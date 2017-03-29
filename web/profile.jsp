<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="panel panel-default">
    <div class="panel-body row" id="profile">
        <div class="col-sm-3">
            <span class="thumbnail">
                <img src="${pageContext.request.contextPath}/asset/img/avatar2.jpg" class="img-responsive">
            </span>
        </div>
        <div class="col-sm-9" id="description">
            <h3>chin8628</h3>
            <p>Boonyarith Piriyothinkul</p>
            <p>Email: 58070077@kmitl.ac.th</p>
            <a href="${pageContext.request.contextPath}/follow.jsp">
                <h4>21</h4>
                <small>Follower</small>
            </a>
            <a href="${pageContext.request.contextPath}/follow.jsp">
                <h4>293</h4>
                <small>Follower</small>
            </a>
        </div>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="page-title">Arts</h2>
    </div>
    <div class="panel-body" id="profile">
        <div class="col-sm-12">
            <div class="col-sm-3 image-art">
                <a  href="${pageContext.request.contextPath}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${pageContext.request.contextPath}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${pageContext.request.contextPath}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${pageContext.request.contextPath}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>

            <div class="col-sm-3 image-art">
                <a  href="${pageContext.request.contextPath}/art.jsp" target="blank" class="thumbnail text-center">
                    <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">
                    <div class="title">
                        <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
