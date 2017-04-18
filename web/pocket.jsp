<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1>Pocket</h1>
    </div>

    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2>352 Coin</h2>
                    <small>Balance</small>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2>352 Coin</h2>
                    <small>Income Last 30 days</small>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2>352 Coin</h2>
                    <small>Outcome Last 30 days</small>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <h3>Payment</h3>
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

<script>
$('#baht').change(function(event) {
    $('#coin').val($(this).val() * EXCHANGE);
});
</script>

<jsp:include page="templates/footer.jsp" />
