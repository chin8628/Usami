<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        <!--        Buy Arts History-->
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
                            <c:forEach var="art" items="${requestScope.artBuy}">
                                <tr>
                                    <td class="col-sm-2">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                                            <img
                                                src="${SITE_URL}/asset/img/art/${art.getUrl()}"
                                                class="img-responsive image-art-thumbnail">
                                        </a>
                                    </td>
                                    <td class="col-sm-4">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">${art.getTitle()}</a>
                                    </td>
                                    <td class="col-sm-4">
                                        <a href="${SITE_URL}/ViewProfile/?id=${art.getUserId()}">${art.getFullname
                                    ()}</td>
                                    <td class="col-sm-1">$${art.getPrice()}</td>
                                    <td>${art.getBuy_date()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!--Arts Income History-->
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
                            <c:forEach var="art" items="${requestScope.artIncome}">
                                <tr>
                                    <td class="col-sm-2">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                                            <img
                                                src="${SITE_URL}/asset/img/art/${art.getUrl()}"
                                                alt=""
                                                class="img-responsive image-art-thumbnail">
                                        </a>
                                    <td class="col-sm-4">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">${art.getTitle()}</a>
                                    </td>
                                    <td class="col-sm-4">
                                        <a href="${SITE_URL}/ViewProfile/?id=${art.getCustomerId()}">
                                            ${art.getCustomerName()}
                                        </a>
                                    </td>
                                    <td class="col-sm-1">$${art.getPrice()}</td>
                                    <td>${art.getBuy_date()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- ArtUpload  -->
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
                            <c:forEach var="art" items="${requestScope.artUpload}">
                                <tr>
                                    <td class="col-sm-2">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">
                                            <img
                                                src="${SITE_URL}/asset/img/art/${art.getUrl()}"
                                                class="img-responsive image-art-thumbnail">
                                        </a>
                                    </td class="col-sm-8">
                                    <td class="col-sm-2">
                                        <a href="${SITE_URL}/View/?id=${art.getId()}">${art.getTitle()}</a>
                                    </td>
                                    <td>${art.getUpload_date()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!--  My Comment  -->
            <div role="tabpanel" class="tab-pane" id="history-comment">
                <div class="table-responsive">
                    <table class="table table-bordered" id="comment-table">
                        <thead>
                            <tr>
                                <th class="col-sm-2"></th>
                                <th class="col-sm-3">Art</th>
                                <th class="col-sm-2">Creator</th>
                                <th class="col-sm-5">Comment</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="comm" items="${requestScope.myComm}">
                                <tr>
                                    <td class="col-sm-2">
                                        <a href="${SITE_URL}/View/?id=${comm.getImage_id()}">
                                            <img
                                                src="${SITE_URL}/asset/img/art/${comm.getUrl_image()}"
                                                class="img-responsive image-art-thumbnail">
                                        </a>
                                    </td>
                                    <td  class="col-sm-3">
                                        <a href="${SITE_URL}/View/?id=${comm.getImage_id()}">${comm.getTitle()}</a>
                                    </td>
                                    <td class="col-sm-2">
                                        <a href="${SITE_URL}/ViewProfile/?id=${comm.getUsername()}">
                                            ${comm.getFirst_name()} ${comm.getLast_name()}
                                        </a>
                                    </td>
                                    <td class="col-sm-5">${comm.getText()}</td>
                                    <td>${comm.getFcomm_date()}</td>
                                </tr>
                            </c:forEach>

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
        $('#income-table').DataTable();
        $('#upload-table').DataTable();
        $('#comment-table').DataTable();
    });
</script>

<jsp:include page="templates/footer.jsp" />
