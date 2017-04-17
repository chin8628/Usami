<%@page import="java.util.ArrayList"%>
<%@page import="model.Art"%>
<%@page import="model.Art"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="templates/header.jsp" />
<% ArrayList<Art> cart = (ArrayList<Art>) request.getSession().getAttribute("cart"); %>
<% Float total = (Float) request.getSession().getAttribute("total"); %>
<% if(cart == null) {cart = new ArrayList<Art>();} %>

<div class="panel panel-default">
    <div class="panel-heading"><h2>Cart</h2></div>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="col-sm-2"></th>
                    <th class="col-sm-5">Art</th>
                    <th class="col-sm-4">Creator</th>
                    <th class="col-sm-1">Price</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for(Art art: cart) { %>
                <tr>
                    <td><img src="${SITE_URL}/asset/img/art/<%=art.getUrl()%>" alt="" class="img-responsive"></td>
                    <td><%= art.getTitle() %></td>
                    <td><%= art.getFullname() %></td>
                    <td><%= art.getProduct().getPrice() %></td>
                    <td><a href="${SITE_URL}/RemoveFromCart/?id=<%= art.getId() %>"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <div class="panel-body">
        <div class="col-sm-12 text-right">
            <p><%= total %></p>
            <form action="${SITE_URL}/Buy" method="POST">
                <p><button class="btn btn-success btn-sm">Buy</button></p>
            </form>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
