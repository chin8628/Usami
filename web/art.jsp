<%@page import="model.User"%>
<%@page import="model.Profiles"%>
<%@page import="model.Art"%>
<%@page import="java.util.*"%>
<%@page import="model.CommentModel"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% Art art = (Art) request.getAttribute("art");%>
<% Profiles owner = (Profiles) request.getAttribute("owner"); %>
<% User user = (User)request.getAttribute("user"); %>

<div class="row">
    <div class="col-sm-3">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <div class="thumbnail">
                        <img src="${SITE_URL}/asset/img/avatar-img/<%=owner.getUrl_image()%>" class="img-responsive">
                    </div>
                    <p>
                        <a href="${SITE_URL}/ViewProfile/?id=<%= owner.getUsername() %>">
                            <%= owner.getFirst_name() + " " + owner.getLast_name() %>
                        </a>
                    </p>
                    <p><span class="label label-default">Standard User</span></p>
                    
                    <form
                        action="${SITE_URL}/Follow/?id=${sessionScope.user.getUsername()}&ownid=<%= owner.getUsername() %>&imgid=<%= art.getId() %>&at=art"
                        method="POST">
                        <button
                            class='btn <%= request.getAttribute("btn-follow") %> btn-sm <%= request.getAttribute("btn-show") %> col-sm-12'
                            type="submit">
                            <%= request.getAttribute("btn-follow-text") %>
                        </button>
                    </form>
                        
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h3><%= art.getPrice()%> <small>coin</small></h3><br>
                    <c:if test="${!sessionScope.user.getUsername().equals(art.getUserId())}">
                                    <c:if test="${art.checkPur(sessionScope.user.getUsername())}">
                                            <button class="btn btn-default btn-sm col-sm-12" disabled="">Purchased</button>
                                    </c:if>
                                    <c:if test="${!art.checkPur(sessionScope.user.getUsername())}">
                                        <c:if test="${ art.isInCart(cart) }">
                                            <form action="${SITE_URL}/RemoveFromCart/?id=${art.getId()}&origin=${SITE_URL}/View/?id=${art.getId()}" method="POST" >
                                            <button class="btn btn-danger btn-sm col-sm-12">Remove from cart</button>
                                        </form>
                                        </c:if>
                                        <c:if test="${ !art.isInCart(sessionScope.cart) }">
                                            <form action="${SITE_URL}/AddToCart/?id=${art.getId()}&origin=${SITE_URL}/View/?id=${art.getId()}" method="POST" >
                                            <button class="btn btn-success btn-sm col-sm-12">Add to cart</button>
                                        </form>
                                        </c:if>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.user.getUsername().equals(art.getUserId())}">
                                        <button class="btn btn-default btn-sm col-sm-12" disabled="">This is your art</button>
                                </c:if>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h3> <%= art.getView() %> <small>Views</small></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-9">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="page-header">
                        <h2><%=art.getTitle()%> </h2>
                        <h4><small> <%= art.getUpload_date() %> </small></h4>
                    </div>
                </div>

                <div class="col-sm-12">
                    <p><%=art.getDesc()%></p>
                </div>

                <!--Set Tag-->
                <div class="col-sm-12">
                    <div id="tag-group">
                        <c:forEach var="tag" items="${requestScope.allTag}">
                            <a href="${SITE_URL}/Gallery/?tag=${tag.getTag_id()}">
                                <span class="label label-info tag">
                                    <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> ${tag.getTag_name()}
                                </span>
                            </a>
                        </c:forEach>
                    </div>
                </div>

                <!--View Arts-->
                <div class="col-sm-12">
                    <img src="${SITE_URL}/asset/img/art/<%=art.getUrl()%>" class="img-responsive">
                </div>

                <!--favorite button-->
                <div class="col-sm-12">
                    <form action="${SITE_URL}/Favorite/?&id=<%= art.getId() %>" method="POST">
                        <button type="submit" class="btn <%= request.getAttribute("btn-fav") %> btn-xs" id="favorite-btn">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span> <%= request.getAttribute("count") %>
                        </button>
                    </form>
                </div>


                <div class="col-sm-12">
                    <div class="panel panel-default" id="comment-box">
                        <div class="panel-body">
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="${SITE_URL}/asset/img/avatar-img/${sessionScope.profile.getUrl_image()}">
                                </div>
                                <div class="media-body">
                                    <!--Comment Box-->
                                    <h4 class="media-heading">Comment</h4>
                                    <form action="${SITE_URL}/Comment/?&id=<%= art.getId() %>" method="POST">
                                        <textarea name="comment"></textarea>
                                        <button type="submit" class="btn btn-success btn-sm">Send</button>
                                    </form>
                                </div>
                                <hr>
                            </div>

                            <!--All Comment-->

                            <% if (request.getAttribute("allComm") != null) { %>
                                <% ArrayList<CommentModel> allComm = (ArrayList<CommentModel>) request.getAttribute("allComm");
                                for (model.CommentModel comm: allComm) { %>
                                        <div class="media comment-reply">
                                            <div class="media-left">
                                                <img class="media-object" src="${SITE_URL}/asset/img/avatar-img/<%=comm.getUrl_image()%>">
                                            </div>
                                            <div class="media-body">
                                                <p><a href="${SITE_URL}/ViewProfile/?id=<%= comm.getUsername() %>"><%= comm.getFirst_name() %> <%= comm.getLast_name() %></a> <small><%= comm.getComm_date() %></small></p>
                                                <p><%= comm.getText() %></p>
                                            </div>
                                            <hr>
                                        </div>
                                <% } %>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
