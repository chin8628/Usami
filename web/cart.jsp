<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

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
                <tr>
                    <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                    <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                    <td>御免なさい＠単行本発売中</td>
                    <td>$3.14</td>
                    <td><a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
                <tr>
                    <td><img src="${SITE_URL}/asset/img/art.jpg" alt="" class="img-responsive"></td>
                    <td>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</td>
                    <td>御免なさい＠単行本発売中</td>
                    <td>$3.14</td>
                    <td><a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="panel-body">
        <div class="col-sm-12 text-right">
            <p>Total: $6.28</p>
            <p><button class="btn btn-success btn-sm">Buy</button></p>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
