<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1>Pocket</h1>
    </div>

    <div class="col-sm-12">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Balance</div>
                <div class="panel-body">
                    <h2>352 <small>Coin</small></h2>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Income (Last 30 days)</div>
                <div class="panel-body">
                    <h2>352 <small>Coin</small></h2>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Outcome (Last 30 days)</div>
                <div class="panel-body">
                    <h2>352 <small>Coin</small></h2>
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
                        <form method="post">
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">฿</span>
                                    <input type="number" class="form-control" name="baht" id="baht">
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Coin</span>
                                    <input type="number" class="form-control" id="coin" disabled>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Pay</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-12" id="deposit">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Deposit</h3>
            </div>
            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form method="post">
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Coin</span>
                                    <input type="number" class="form-control" id="coin">
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon">฿</span>
                                    <input type="number" class="form-control" name="baht" id="baht" disabled>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Deposit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$('#payment #baht').change(function(event) {
    $('#payment #coin').val($(this).val() * EXCHANGE);
});

$('#deposit #coin').change(function(event) {
    $('#deposit #baht').val($(this).val() / EXCHANGE);
});
</script>

<jsp:include page="templates/footer.jsp" />
