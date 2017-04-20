<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1 style="display: inline-block">
            #${requestScope.tag.getTag_name()}
            <a class="btn ${requestScope.btnFollow} btn-sm" href="${SITE_URL}/FollowTag/?tag=${requestScope.tag.getTag_id()}">${requestScope.btnFollowText}</a>
        </h1>
    </div>
    
    <c:forEach var="art" items="${requestScope.arts}">
        <div class="col-sm-3 image-storage">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-pills">
                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                            <p><img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive"></p>
                        </a>
                        <div class="title">
                            <a href="${SITE_URL}/View/?id=${art.getId()}">
                                <p><strong>${art.getTitle()}</strong></p>
                            </a>
                            <a href="${SITE_URL}/ViewProfile/?id=${art.getUserId()}">
                                <p>${art.getFullname()}</p>
                            </a>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="templates/footer.jsp" />
