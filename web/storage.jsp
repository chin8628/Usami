<%@page import="model.User"%>
<%@ page import="model.Art" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% User user = (User) request.getSession().getAttribute("user"); %>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1>My Storage</h1>
    </div>
    <c:if test="${requestScope.allArt != null}">
        <div class="grid">
            <div class="grid-sizer col-md-3 col-sm-4 col-xs-12"></div>
            <c:forEach var="art" items="${requestScope.allArt}">
                <div class="col-md-3 col-sm-4 col-xs-12 image-storage grid-item">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="nav nav-pills">
                                <a href="${SITE_URL}/View/?id=${art.getId()}">
                                    <p>
                                        <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive center-block image-art-thumbnail">
                                    </p>
                                    <div class="title">
                                        <p><strong>${art.getTitle()}</strong></p>
                                    </div>
                                </a>
                                <div class="price">
                                    <p>${art.getPrice()} coin</p>
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
            </c:forEach>
        </div>
    </c:if>
</div>

<div class="col-sm-12">
    <div class="page-header">
        <h1>My Purchase</h1>
    </div>
    <c:if test="${requestScope.allPur != null}">
        <div class="grid">
            <div class="grid-sizer col-md-3 col-sm-4 col-xs-12"></div>
            <c:forEach var="art" items="${requestScope.allPur}">
                <div class="col-md-3 col-sm-4 col-xs-12 image-storage grid-item">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="nav nav-pills">
                                <a href="${SITE_URL}/View/?id=${art.getId()}">
                                    <p>
                                        <img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="image-art-thumbnail img-responsive center-block">
                                    </p>
                                    <div class="title">
                                        <p><strong>${art.getTitle()}</strong></p>
                                    </div>
                                </a>
                                    <form action="${SITE_URL}/Download/?id=${art.getId()}&mode=o" method="POST">
                                        <button class="btn btn-success col-sm-12 btn-xs">Download original</button>
                                    </form>
                                    <form action="${SITE_URL}/Download/?id=${art.getId()}&mode=r" method="POST">
                                            <button class="btn btn-success col-sm-12 btn-xs">Download 1080p</button>
                                    </form>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>

<c:if test="${requestScope.allArt != null}">
    <c:forEach var="art" items="${requestScope.allArt}">
        <div class="modal fade" id="${art.getId()}-modal" tabindex="-1" role="dialog" aria-labelledby="${art.getId()}-modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form method="post" action="${SITE_URL}/EditArt">
                        <input type="hidden"  value="${art.getId()}" name="id">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="editModalLabel">Edit</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" class="form-control" name="title" placeholder="Art's name" value="${art.getTitle()}">
                            </div>
                            <div class="form-group">
                                <label for="desciption">Description</label>
                                <textarea class="form-control" name="desc" placeholder="Please tell us about your brilliant art!">${art.getDesc()}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="tags">Tags (Seperate each tag by comma)</label>
                                <input type="tags" class="form-control" id="${art.getId()}-tags" name="tags" value="${art.getAllTag()}">
                            </div>
                            <% if(user.getU_type().equals("PRM")) { %>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="${art.getId()}-sell" name="sell"> Do you want to sell this art?
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <div class="input-group">
                                    <span class="input-group-addon">Coin</span>
                                    <input type="number" class="form-control" id="${art.getId()}-price" name="price" aria-label="Amount (to the nearest dollar)" value="${art.getProduct().getPrice()}" disabled>
                                </div>
                            </div>
                                <% } %>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" form="del-form" name="id2" value="${art.getId()}">DELETE</button>
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                    <form method="post" action="${SITE_URL}/DeleteArt/" id="del-form">
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

<script>
    $(document).ready(function() {
        <c:if test="${requestScope.allArt != null}">
            <c:forEach var="art" items="${requestScope.allArt}">
                $('#${art.getId()}-tags').tagsInput({
                    'width': "auto",
                    'height': "auto",
                    'delimiter': [',']
                });

                $('#${art.getId()}-sell').click(function(event) {
                    if ($(this).is(':checked') === true) {
                        $('#${art.getId()}-price').prop( "disabled", false );
                    } else {
                        $('#${art.getId()}-price').prop( "disabled", true ).val(null);
                    }
                });
            </c:forEach>
        </c:if>
    });

    $(window).on("load", function() {
        $('.grid').isotope({
            itemSelector: '.grid-item',
            percentPosition: true,
            masonry: {
                columnWidth: '.grid-sizer'
            }
        });
    });
</script>

<jsp:include page="templates/footer.jsp" />
