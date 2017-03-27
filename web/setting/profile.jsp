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
                    <div class="form-group">
                        <label for="name">Username</label>
                        <input type="text" class="form-control" id="Username">
                    </div>
                    <div class="form-group">
                        <label for="name">First Name</label>
                        <input type="text" class="form-control" id="firstname">
                    </div>
                    <div class="form-group">
                        <label for="name">Last Name</label>
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
