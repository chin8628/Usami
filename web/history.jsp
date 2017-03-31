<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="page-header">
    <h1>Your History</h1>
</div>

<div class="panel-default panel">
    <div class="panel-body">

        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#history-purchase" aria-controls="history-purchase" role="tab" data-toggle="tab">Purchase</a>
            </li>
            <li role="presentation">
                <a href="#history-income" aria-controls="history-income" role="tab" data-toggle="tab">Income</a>
            </li>
            <li role="presentation">
                <a href="#history-upload" aria-controls="history-upload" role="tab" data-toggle="tab">Upload</a>
            </li>
            <li role="presentation">
                <a href="#history-comment" aria-controls="history-comment" role="tab" data-toggle="tab">Comment</a>
            </li>
        </ul>

        <div class="tab-content tab-content-custom">
            <div role="tabpanel" class="tab-pane active" id="history-purchase">
                <div class="table-responsive">
                    <table class="table table-bordered" id="purchase-table">
                        <thead>
                            <tr>
                                <th class="col-sm-2"></th>
                                <th class="col-sm-4">Art</th>
                                <th class="col-sm-4">Creator</th>
                                <th class="col-sm-1">Price</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>御免なさい＠単行本発売中</td>
                                <td>$3.14</td>
                                <td>31/03/2017</td>
                            </tr>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>御免なさい＠単行本発売中</td>
                                <td>$3.14</td>
                                <td>31/03/2017</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="history-income">
                <div class="table-responsive">
                    <table class="table table-bordered" id="income-table">
                        <thead>
                            <tr>
                                <th class="col-sm-2"></th>
                                <th class="col-sm-4">Art</th>
                                <th class="col-sm-4">Buy by</th>
                                <th class="col-sm-1">Price</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>R' TU</td>
                                <td>$3.14</td>
                                <td>31/03/2017</td>
                            </tr>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>Takisina</td>
                                <td>$3.14</td>
                                <td>31/03/2017</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="history-upload">
                <div class="table-responsive">
                    <table class="table table-bordered" id="upload-table">
                        <thead>
                            <tr>
                                <th class="col-sm-2"></th>
                                <th class="col-sm-8">Art</th>
                                <th class="col-sm-2">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>31/03/2017</td>
                            </tr>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>31/03/2017</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="history-comment">
                <div class="table-responsive">
                    <table class="table table-bordered" id="comment-table">
                        <thead>
                            <tr>
                                <th class="col-sm-2"></th>
                                <th class="col-sm-3">Art</th>
                                <th class="col-sm-3">Creator</th>
                                <th class="col-sm-4">Comment</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>御免なさい＠単行本発売中</td>
                                <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</td>
                                <td>31/03/2017</td>
                            </tr>
                            <tr>
                                <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                                <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                                <td>御免なさい＠単行本発売中</td>
                                <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima, officia.</td>
                                <td>31/03/2017</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    /* Manage table */
    $(document).ready(function(){
        $('#purchase-table').DataTable();
        // $('#income-table').DataTable();
        // $('#upload-table').DataTable();
        // $('#comment-table').DataTable();
    });
</script>

<jsp:include page="templates/footer.jsp" />
