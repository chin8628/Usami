<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp" />

<section id="setting_profile">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1 class="page-title">My Profile</h1>
        </div>
        <div class="panel-body">
            <div class="col-sm-8 col-sm-offset-2">
                <form method="post">
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <span class="thumbnail">
                              <img src="${pageContext.request.contextPath}/asset/img/avatar2.jpg" class="img-responsive">
                            </span>
                        </div>
                        <div class="col-sm-9">
                            <label for="avatar">Avatar Image</label>
                            <input type="file" class="form-control" id="avatar">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username">
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" class="form-control" id="firstname">
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" class="form-control" id="lastname">
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="re-password">Re-Password</label>
                        <input type="password" class="form-control" id="re-password" placeholder="Re-type Password">
                    </div>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../templates/footer.jsp" />