<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Profiles"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="panel panel-default" id="following">
    <div class="panel-heading"><h3>Following</h3></div>
    <div class="panel-body">
        
        <c:forEach var="following" items="${requestScope.allFollowing}">
            <div class="col-sm-4 follow">
                <div class="media">
                    <a href="${SITE_URL}/ViewProfile/?id=${following.getUsername()}" target="blank">
                        <div class="media-left">
                            <img src="${SITE_URL}/asset/img/avatar-img/${following.getUrl_image()}" class="img-circle media-object follow-img">
                        </div>
                        <div class="media-body follow-name">
                            <strong>${following.getFirst_name()} ${following.getLast_name()}</strong>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>  
    </div>
</div>

<div class="panel panel-default" id="follower">
    <div class="panel-heading"><h3>Follower</h3></div>
    <div class="panel-body">
        
        <c:forEach var="follower" items="${requestScope.allFollower}">
            <div class="col-sm-4 follow">
                <div class="media">
                    <a href="${SITE_URL}/ViewProfile/?id=${follower.getUsername()}" target="blank">
                        <div class="media-left">
                            <img src="${SITE_URL}/asset/img/avatar-img/${follower.getUrl_image()}" class="img-circle media-object follow-img">
                        </div>
                        <div class="media-body follow-name">
                            <strong>${follower.getFirst_name()} ${follower.getLast_name()}</strong>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>            
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
