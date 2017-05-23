<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp" />

<div class="panel panel-default">
    <div class="panel-heading">
        <h1 class="page-title">My Profile</h1>
    </div>

    <c:if test="${requestScope.pass != null}">
        <c:choose>
            <c:when test="${requestScope.pass == 'success'}">
                <div class="alert alert-success" role="alert">Update Profile Complete</div>
            </c:when>
            <c:when test="${requestScope.pass == 'incorrect'}">
                <div class="alert alert-danger" role="alert">New-Password and Re-Password not Match!!!!</div>
            </c:when>
            <c:when test="${requestScope.pass == 'notpass'}">
                <div class="alert alert-danger" role="alert">Password Incorrect!!!</div>
            </c:when>
        </c:choose>
    </c:if>

    <div class="panel-body">
        <div class="col-sm-8 col-sm-offset-2">
            <form method="post" enctype="multipart/form-data" action="${SITE_URL}/EditProfile">
                <div class="form-group row">
                    <div class="col-sm-3">
                        <span class="thumbnail">
                          <img src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}" class="img-responsive avatar-img">
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
                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../templates/footer.jsp" />
