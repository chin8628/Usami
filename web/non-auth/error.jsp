<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header-non-auth.jsp" />

<style>
    html, body {
        height: 100%;
        width: 100%;
        background-color: #f5f5f5;
    }
</style>

<div class="jumbotron" style="margin-top: 5vh;">
  <h1>Something went wrong!</h1>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel, quod!</p>
  <p><a class="btn btn-success btn-lg" href="${SITE_URL}" role="button">Back to home</a></p>
</div>

<jsp:include page="../templates/footer.jsp" />
