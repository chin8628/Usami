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
                        <p><img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive"></p>
                        <div class="title">
                            <p><strong>${art.getTitle()}</strong></p>
                        </div>
                    </a>
                    <div class="price">
                        <p>${art.getPrice()}</p>
                    </div>
                    <button
                        data-toggle="modal"
                        data-target="#${art.getId()}-modal"
                        data-site-url="${SITE_URL}"
                        data-art-id="${art.getId()}"
                        data-art-title="${art.getTitle()}"
                        data-art-desc="${art.getDesc()}"
                        class="btn btn-success col-sm-12 btn-xs">
                        EDIT
                    </button>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-sm-3 image-storage">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-pills">
                    <a href="${SITE_URL}/View/?id=${art.getId()}">
                        <p><img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive"></p>
                        <div class="title">
                            <p><strong>${art.getTitle()}</strong></p>
                        </div>
                    </a>
                    <div class="price">
                        <p>${art.getPrice()}</p>
                    </div>
                    <button
                        data-toggle="modal"
                        data-target="#${art.getId()}-modal"
                        data-site-url="${SITE_URL}"
                        data-art-id="${art.getId()}"
                        data-art-title="${art.getTitle()}"
                        data-art-desc="${art.getDesc()}"
                        class="btn btn-success col-sm-12 btn-xs">
                        EDIT
                    </button>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
