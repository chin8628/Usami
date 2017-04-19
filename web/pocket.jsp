<%@page import="model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-12">
    <div class="page-header">
        <h1>Pocket</h1>
    </div>

    <div class="col-sm-12">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Balance</div>
                <div class="panel-body">
                    <h2><%= request.getAttribute("cur_coin") %> <small>Coin</small></h2>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Income (Last 30 days)</div>
                <div class="panel-body">
                    <h2><%= request.getAttribute("in_coin") %> <small>Coin</small></h2>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Outcome (Last 30 days)</div>
                <div class="panel-body">
                    <h2><%= request.getAttribute("out_coin") %> <small>Coin</small></h2>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-12" id="payment">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Payment</h3>
            </div>
            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form method="post" action="${SITE_URL}/dwCoin">
                            <input name="mode" value="0" hidden>
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">฿</span>
                                    <input type="number" class="form-control" name="amount" id="baht">
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Coin</span>
                                    <input type="number" class="form-control" id="coin" disabled>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Paypal</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-12" id="withdraw">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Withdraw</h3>
            </div>
            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form method="post" action="${SITE_URL}/dwCoin">
                            <input name="mode" value="1" hidden>
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Coin</span>
                                    <input type="number" class="form-control" name="amount" id="coin">
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">฿</span>
                                    <input type="number" class="form-control" id="baht" disabled>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Withdraw</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$('#payment #baht').on('input', function() {
    $('#payment #coin').val($(this).val() * EXCHANGE);
});

$('#withdraw #coin').on('input', function() {
    $('#withdraw #baht').val($(this).val() / EXCHANGE);
});
</script>

<jsp:include page="templates/footer.jsp" />
