<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div class="col-sm-4 image-product">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-pills">
                        <a href="${pageContext.request.contextPath}/art.jsp">
                            <p>
                                <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="
                                img-responsive">
                            </p>
                            <div class="title">
                                <p>
                                    <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                                </p>
                            </div>
                        </a>
                        <div class="price">
                            <p>$5.3</p>
                        </div>
                        <button class="btn btn-success btn-sm col-sm-12">ADD TO CART</button>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-4 image-product">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-pills">
                        <a href="${pageContext.request.contextPath}/art.jsp">
                            <p>
                                <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="
                                img-responsive">
                            </p>
                            <div class="title">
                                <p>
                                    <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                                </p>
                            </div>
                        </a>
                        <div class="price">
                            <p>$5.3</p>
                        </div>
                        <button class="btn btn-success btn-sm col-sm-12">ADD TO CART</button>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-4 image-product">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-pills">
                        <a href="${pageContext.request.contextPath}/art.jsp">
                            <p>
                                <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="
                                img-responsive">
                            </p>
                            <div class="title">
                                <p>
                                    <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                                </p>
                            </div>
                        </a>
                        <div class="price">
                            <p>$5.3</p>
                        </div>
                        <button class="btn btn-success btn-sm col-sm-12">ADD TO CART</button>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-sm-4 image-product">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-pills">
                        <a href="${pageContext.request.contextPath}/art.jsp">
                            <p>
                                <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">
                            </p>
                            <div class="title">
                                <p>
                                    <strong>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</strong>
                                </p>
                            </div>
                        </a>
                        <div class="price">
                            <p>$5.3</p>
                        </div>
                        <button class="btn btn-success btn-sm col-sm-12">ADD TO CART</button>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="templates/footer.jsp" />
