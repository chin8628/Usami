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
<% User user = (User) session.getAttribute("user"); %>

<div class="row">
    <div class="col-sm-3">
        <div class="panel panel-default">
            <div class="panel-body text-center">
                <div class="thumbnail">
                    <img src="${SITE_URL}/asset/img/avatar-img/<%=owner.getUrl_image()%>" class="img-responsive">
                </div>
                <p><%= owner.getFirst_name() + " " + owner.getLast_name() %></p>
                <p><span class="label label-default">Standard User</span></p>
                <p><button class="btn btn-success btn-sm" type="submit">Follow</button></p>
            </div>
        </div>
    </div>
    <div class="col-sm-9">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="page-header">
                        <h2><%=art.getTitle()%></h2>
                    </div>
                </div>

                <div class="col-sm-12">
                    <p><%=art.getDesc()%></p>
                </div>

                <div class="col-sm-12">
                    <div id="tag-group">
                        <a href="#">
                            <span class="label label-info tag">
                                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> KanColle
                            </span>
                        </a>
                        <a href="#">
                            <span class="label label-info tag">
                                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> Kantai Collection
                            </span>
                        </a>
                        <a href="#">
                            <span class="label label-info tag">
                                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> Girl Sad
                            </span>
                        </a>
                    </div>
                </div>

                <div class="col-sm-12">
                    <img src="${SITE_URL}/asset/img/art/<%=art.getUrl()%>" class="img-responsive">
                </div>

                <div class="col-sm-12">
                    <button type="submit" class="btn btn-success btn-xs" id="favorite-btn">
                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4732
                    </button>
                </div>


                <div class="col-sm-12">
                    <div class="panel panel-default" id="comment-box">
                        <div class="panel-body">
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="${SITE_URL}/asset/img/avatar2.jpg">
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
                                                <img class="media-object" src="${SITE_URL}/asset/img/avatar2.jpg">
                                            </div>
                                            <div class="media-body">
                                                <p><a href="#"><%= comm.getFirst_name() %> <%= comm.getLast_name() %></a> <small><%= comm.getComm_date() %></small></p>
                                                <p><%= comm.getText() %></p>
                                            </div>
                                            <hr>
                                        </div>
                                <% } %>
                            <% } %>

<!--                            <div class="media comment-reply">
                                <div class="media-left">
                                    <img class="media-object" src="${SITE_URL}/asset/img/avatar.jpg">
                                </div>
                                <div class="media-body">
                                    <p><a href="#">御免なさい＠単行本発売中</a> <small>12/25/2015 20:28</small></p>
                                    <p>おのれDMMですか・・・。 ただ、まさかのそのDMMで先生の本 買えるようになったのはビビリました・・。</p>
                                </div>
                                <hr>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
