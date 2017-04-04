<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header-non-auth.jsp" />

<div class="container col-sm-12" style="margin-top: 5vh;">
    <div class="col-sm-12 opacity-9">
        <div class="panel panel-default">
            <div class="panel-body">
                <h1 class="no-margin-top">Welcome to USAMI.</h1>
                <small>Best of marketplace and community of the world</small>
            </div>
        </div>
    </div>
    <div class="col-sm-6 opacity-9" id="signup">
        <div class="panel panel-default">
            <div class="panel-heading">Sign Up</div>
            <div class="panel-body">
                <form action="${SITE_URL}/SignUp" method="POST">
                    <div class="form-group" id="userInDiv">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="username" id="userIn">
                    </div>
                    <div class="form-group" id="emailInDiv">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" name="email" id="emailIn">
                    </div>
                    <div class="form-group" id="passInDiv">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="passIn">
                    </div>
                    <div class="form-group" id="repassInDiv">
                        <label for="re-password">Re-Password</label>
                        <input type="password" class="form-control" name="re-password" id="repassIn">
                    </div>
                    <button type="submit" class="btn btn-default" id="signUpButton" disabled="disabled">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-6 opacity-9" id="signin">
        <div class="panel panel-default">
            <div class="panel-heading">Sign In</div>
            <div class="panel-body">
                <form>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password">
                    </div>
                    <button type="submit" class="btn btn-default">Sign In</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${SITE_URL}/asset/js/Authenticate.js"></script>
                
<jsp:include page="../templates/footer.jsp" />
