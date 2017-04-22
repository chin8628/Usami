<%@page import="model.Art"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/header.jsp" />
<div class="page-header">
    <h1>Result search art</h1>
</div>

<div class="panel-default panel">
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="table">
                <thead>
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-sm-2"></th>
                        <th>Art</th>
                        <th>Creator</th>
                        <th>Upload Date</th>
                        <th class="col-sm-1">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="art" items="${requestScope.allArt}">
                    <tr>
                        <td>${art.getId()}</td>
                        <td>
                            <a href="${SITE_URL}/View/?id=${art.getId()}">
                                <img src="${SITE_URL}/asset/img/art/${art.getId()}.jpg" class="img-responsive image-art">
                            </a>
                        </td>
                        <td><a href="${SITE_URL}/View/?id=${art.getId()}">${art.getTitle()}</a></td>
                        <td><a href="${SITE_URL}/ViewProfile/?id=${art.getUserId()}">${art.getFullname()}</a></td>
                        <td>${art.getUpload_date()}</td>
                        <td class="text-center">
                            <button
                                class="btn btn-default btn-sm"
                                data-toggle="modal"
                                data-target="#${art.getId()}-modal"
                                data-site-url="${SITE_URL}"
                                data-art-id="${art.getId()}"
                                data-art-title="${art.getTitle()}"
                                data-art-desc="${art.getDesc()}"
                                data-target="#modal">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
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
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="${art.getId()}-sell" name="sell"> Do you want to sell this art?
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <div class="input-group">
                                    <span class="input-group-addon">$</span>
                                    <input type="number" class="form-control" id="${art.getId()}-price" name="price" aria-label="Amount (to the nearest dollar)" value="${art.getProduct().getPrice()}" disabled>
                                </div>
                            </div>
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
    /* Manage table */
    $(document).ready(function(){
        $('#table').DataTable();
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
</script>

<jsp:include page="../templates/footer.jsp" />
