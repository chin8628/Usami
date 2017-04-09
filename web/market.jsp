<%@page import="model.Art"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
    <div class="col-sm-12">
        <div class="page-header">
            <h1>Marketplace</h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-3">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a href="#">Art</a></li>
                    <li role="presentation"><a href="#">Special</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="col-sm-9">             
        <% ArrayList<Art> allArt = (ArrayList<Art>) request.getAttribute("allArt");
           if(allArt != null){
               for(Art art: allArt){ %>             
                    <div class="col-sm-4 image-product">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <ul class="nav nav-pills">
                                    <a href="${SITE_URL}/view/<%=art.getId()%>">
                                        <p>
                                            <img src="${SITE_URL}/asset/img/art/<%=art.getUrl()%>" class="
                                            img-responsive thumbnail">
                                        </p>
                                        <div class="title">
                                            <p>
                                                <strong><%=art.getTitle()%></strong>
                                            </p>
                                        </div>
                                    </a>
                                    <div class="price">
                                        <p><%=art.getPrice()%></p>
                                    </div>
                                    <button class="btn btn-success btn-sm col-sm-12">ADD TO CART</button>
                                </ul>
                            </div>
                        </div>
                    </div>
               <%}
           }
        %>

    </div>
</div>

<jsp:include page="templates/footer.jsp" />
