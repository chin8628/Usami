<%@page import="java.util.ArrayList"%>
<%@page import="model.Art"%>
<%@page import="model.Art"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="templates/header.jsp" />
<% ArrayList<Art> cart = (ArrayList<Art>) request.getSession().getAttribute("cart"); %>
<% if(cart == null) {cart = new ArrayList<Art>();} %>
<%  int total = 0; for(Art art:cart) {total += art.getProduct().getPrice();} %>

<div class="alert alert-warning" role="alert"><b>Ohh!</b> Your money is not enough to purchase. Please add more money to your <a href="${SITE_URL}/Pocket">Pocket.</a></div>

<div class="panel panel-default">
    <div class="panel-heading"><h2>Cart</h2></div>
    <div class="panel-body">
        <% if(cart.size() > 0) { %>
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
                                <td class="show-price"><%= art.getPrice() %></td>
                                <td><button class="btn btn-link btn-sm cart-btn remove-cart" value="<%= art.getId() %>"><span class="glyphicon glyphicon-trash"></span></button></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="col-sm-12 text-right">
                <p id="total">Total: <%= (int)total %> <small>coin</small></p>
                <form action="${SITE_URL}/Buy" method="POST">
                    <p><button class="btn btn-success btn-sm">Buy</button></p>
                </form>
            </div>
        <% } else { %>

            <h3 class="text-center"><small> There is nothing here. Let's add something. </small></h3><br>

        <%}%>
    </div>
</div>

<script>
        // Cart Button
        $('.cart-btn').click(function() {
            id = $(this).val();
            btn = this;
            total_price = 0;
            cnt = 0;
            if ($(this).hasClass('remove-cart')) {
                $.ajax({
                    url: "${SITE_URL}/RemoveFromCart/?id="+id+"&origin=${SITE_URL}/cart.jsp",
                    success: function(result){
                        if ($.trim(result) === "ok") {
                            $(btn).parent().parent().remove();
                            alertify.error("Removed <strong> </strong> from <strong>cart</strong>");
                            $('.show-price').each(function() {
                                total_price += parseInt($(this).text(), 10) || 0;
                                cnt++;
                            });
                            $('#total').text(total_price + " coin");

                            if (cnt == 0) {
                                $('.panel-body').html("<h3 class='text-center'><small> There is nothing here. Let's add something. </small></h3><br>");
                            }
                        }
                    }
                });
            }

        });
</script>

<jsp:include page="templates/footer.jsp" />
