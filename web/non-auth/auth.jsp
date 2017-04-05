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
                    <div class="form-group has-feedback" id="fNameInDiv">
                        <label class="control-label" for="fullname">Full Name</label>
                        <input type="text" class="form-control" name="fullname" id="fNameIn" placeholder="John Doe">
                        <span class="glyphicon glyphicon-user form-control-feedback" id="fnSpan"></span>
                    </div>
                    <div class="form-group has-feedback" id="userInDiv">
                        <label class="control-label" for="username">Username</label>
                        <input type="text" class="form-control" name="username" id="userIn" placeholder="Johnny007">
                        <span class="glyphicon glyphicon-globe form-control-feedback" id="usSpan"></span>
                    </div>
                    <div class="form-group has-feedback" id="emailInDiv">
                        <label class="control-label" for="email">Email address</label>
                        <input type="email" class="form-control" name="email" id="emailIn" placeholder="Johnny_lnwza_007@gmail.com">
                        <span class="glyphicon glyphicon-envelope form-control-feedback" id="emSpan"></span>
                    </div>
                    <div class="form-group has-feedback" id="passInDiv">
                        <label class="control-label" for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="passIn">
                        <span class="glyphicon glyphicon-eye-close form-control-feedback" id="psSpan"></span>
                    </div>
                    <div class="form-group has-feedback" id="repassInDiv">
                        <label class="control-label" for="re-password">Re-Password</label>
                        <input type="password" class="form-control" name="re-password" id="repassIn">
                        <span class="glyphicon glyphicon-eye-close form-control-feedback" id="rpSpan"></span>
                    </div>
                    <button type="submit" class="btn btn-default" id="signUpButton">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-6 opacity-9" id="signin">
        <div class="panel panel-default">
            <div class="panel-heading">Sign In</div>
            <div class="panel-body">
                <form action="${SITE_URL}/Sign_inServlet" method="POST" >
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password">
                    </div>
                    <button type="submit" class="btn btn-default">Sign In</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${SITE_URL}/asset/js/Authenticate.js"></script>
                
<jsp:include page="../templates/footer.jsp" />
