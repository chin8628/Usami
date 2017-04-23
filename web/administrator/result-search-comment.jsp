<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/header.jsp" />

<div class="page-header">
    <h1>Result search comment</h1>
</div>

<div class="panel-default panel">
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="table">
                <thead>
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-1">Art</th>
                        <th>User</th>
                        <th>Comment</th>
                        <th>Comment Date</th>
                        <th class="col-sm-1">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="comm" items="${requestScope.allComm}">
                    <tr>
                        <td>${comm.getImage_id()}</td>
                        <td>
                            <a href="${SITE_URL}/View/?id=${comm.getImage_id()}">
                                <img src="${SITE_URL}/asset/img/art/${comm.getImage_id()}.jpg" class="img-responsive avatar-art">
                            </a>
                        </td>
                        <td><a href="${SITE_URL}/ViewProfile/?id=${comm.getUsername()}">${comm.getUsername()}</a></td>
                        <td>${comm.getText()}</td>
                        <td>${comm.getComm_date()}</td>
                        <td class="text-center">
                            <button
                                class="btn btn-default btn-sm"
                                data-toggle="modal"
                                data-target="#${comm.getId()}-modal"
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
<c:forEach var="comm" items="${requestScope.allComm}">
<div class="modal fade" tabindex="-1" role="dialog" id="${comm.getId()}-modal" aria-labelledby="${comm.getId()}-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Update comment</h4>
            </div>
            <div class="modal-body">
                <form method="post" id="update-comm-${comm.getId()}" action="${SITE_URL}/AdminEditComment/">
                    <input type="hidden" value="${key}" name="key">
                    <input type="hidden" value="${mode}" name="mode">
                    <div class="form-group">
                        <label for="comment">Comment</label>
                        <input type="texte" value="${comm.getUsername()}" name="username">
                        <input type="hidden" value="${comm.getImage_id()}" name="image_id">
                        <input type="hidden" value="${comm.getComm_date().getTime()}" name="comm_date">
                        <textarea class="form-control" rows="7" id="comment" name="text">${comm.getText()}</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger">Delete</button>
                <button type="submit" class="btn btn-default" form="update-comm-${comm.getId()}">Update</button>
            </div>
        </div>
    </div>
</div>
</c:forEach>
<script>
    /* Manage table */
    $(document).ready(function(){
        $('#table').DataTable();
    });
</script>

<jsp:include page="../templates/footer.jsp" />
