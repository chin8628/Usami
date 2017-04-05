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
                <form method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username">
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password">
                    </div>
                    <div class="form-group">
                        <label for="re-password">Re-Password</label>
                        <input type="password" class="form-control" id="re-password">
                    </div>
                    <button type="submit" class="btn btn-default">Sign Up</button>
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

<jsp:include page="../templates/footer.jsp" />
