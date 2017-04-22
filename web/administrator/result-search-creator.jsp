<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/header.jsp" />

<div class="page-header">
    <h1>Result search user</h1>
</div>

<div class="panel-default panel">
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="table">
                <thead>
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-1"></th>
                        <th>Creator</th>
                        <th>Coin</th>
                        <th class="col-sm-1">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${requestScope.allUser}">
                    <tr>
                        <td>${user.getUsername()}</td>
                        <td>
                            <a href="${SITE_URL}/ViewProfile/?id=${user.getUsername()}">
                                <img src="${SITE_URL}/asset/img/avatar-img/${user.getProfile().getUrl_image()}" class="img-responsive avatar-art">
                            </a>
                        </td>
                        <td><a href="${SITE_URL}/ViewProfile/?id=${user.getUsername()}">${user.getProfile().getFullname()}</a></td>
                        <td>${user.getCoin()}</td>
                        <td class="text-center">
                            <button
                                class="btn btn-default btn-sm"
                                data-toggle="modal"
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

<div class="modal fade" tabindex="-1" role="dialog" id="modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>Edit Profile</h4>
            </div>
            <div class="modal-body">
                <form method="post" enctype="multipart/form-data" action="${SITE_URL}/EditProfile">
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <span class="thumbnail">
                              <img src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}" class="img-responsive">
                            </span>
                        </div>
                        <div class="col-sm-9">
                            <label for="avatar">Avatar Image</label>
                            <input type="file" class="form-control" id="avatar" name="avatar">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" disabled="disabled" value="${sessionScope.profile.username}">
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" class="form-control" id="firstname" name="firstname" value="${sessionScope.profile.first_name}">
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" class="form-control" id="lastname" name="lastname" value="${sessionScope.profile.last_name}">
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}">
                    </div>

                    <div class="form-group">
                        <label for="password">***Old-Password</label>
                        <input type="password" class="form-control" id="old-password" placeholder="Old-Password" name="old-password">
                    </div>
                    <div class="form-group">
                        <label for="re-password">New-Password</label>
                        <input type="password" class="form-control" id="new-password" placeholder="New-type Password" name="new-password">
                    </div>
                    <div class="form-group">
                        <label for="re-password">Re-Password</label>
                        <input type="password" class="form-control" id="re-password" placeholder="Re-type Password" name="re-password">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">Delete Account</button>
                <button type="button" class="btn btn-primary">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    /* Manage table */
    $(document).ready(function(){
        $('#table').DataTable();
    });
</script>

<jsp:include page="../templates/footer.jsp" />
