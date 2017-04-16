<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1>Tag name</h1>
    </div>
    <div class="col-sm-3 image-storage">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-pills">
                    <a href="${SITE_URL}/View/?id=${art.getId()}">
                        <p><img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive"></p>
                    </a>
                    <div class="title">
                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                            <p><strong>Art's name</strong></p>
                        </a>
                        <a href="${SITE_URL}/ViewProfile/?id=admin">
                            <p>Artist's name</p>
                        </a>
                    </div>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-sm-3 image-storage">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-pills">
                    <a href="${SITE_URL}/View/?id=${art.getId()}">
                        <p><img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive"></p>
                    </a>
                    <div class="title">
                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                            <p><strong>Art's name</strong></p>
                        </a>
                        <a href="${SITE_URL}/ViewProfile/?id=admin">
                            <p>Artist's name</p>
                        </a>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
