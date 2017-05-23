<%@page import="java.util.ArrayList"%>
<%@page import="model.Art"%>
<%@page import="model.Art"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="templates/header.jsp" />
<% ArrayList<Art> cart = (ArrayList<Art>) request.getSession().getAttribute("cart"); %>
<% if(cart == null) {cart = new ArrayList<Art>();} %>
<% int total = 0; for(Art art:cart) {total += art.getProduct().getPrice();} %>

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
                                <td><button class="btn btn-link btn-sm cart-btn remove-cart" value="<%= art.getId() %>,<%= art.getTitle() %>"><span class="glyphicon glyphicon-trash"></span></button></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="col-sm-12 text-right">
                <p id="total"><%= (int)total %> <small>coin</small></p>
                <p><button class="btn btn-success btn-sm" id="buy" value="${sessionScope.user.getCoin()}" >Buy</button></p>
            </div>
        <% } else { %>

            <h3 class="text-center"><small> There is nothing here. Let's add something. </small></h3><br>

        <%}%>
    </div>
</div>

<script>
        // Cart Button
        $('.cart-btn').click(function() {
            text = $(this).val().split(',');
            id = text[0];
            title = text[1];
            btn = this;
            total_price = 0;
            cnt = 0;
            if ($(this).hasClass('remove-cart')) {
                $.ajax({
                    url: "${SITE_URL}/RemoveFromCart/?id="+id+"&origin=${SITE_URL}/cart.jsp",
                    success: function(result){
                        if ($.trim(result) === "ok") {
                            $(btn).parent().parent().remove();
                            alertify.error("Removed <strong>"+title+"</strong> from <strong>cart</strong>");
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
        
        // Buy Button
        $("#buy").click(function() {
        coin = parseInt($(this).val());
            alertify.confirm("Confirm purchase?", function () {
                    price = parseInt($('#total').text().split(' ')[0]);
                    if (coin >= price) {
                        alertify.success("Purchase Successful");
                        $.ajax({
                            url: "${SITE_URL}/Buy",
                            success: function(){
                                setTimeout(function() {
                                    location.reload();
                                }, 1000);
                            }
                        });
                    } else {
                        alertify.delay(3000).error("Your money is not enough to purchase. Please add more money to your <a href=\"${SITE_URL}/Pocket\">Pocket.</a>");
                        $.ajax({
                            url: "#",
                            success: function(){
                            }
                        });
                    }
            }, function() {
                alertify.error("Purchase Cancled");
            });
            
        });
</script>

<jsp:include page="templates/footer.jsp" />
