<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp" />

<div class="page-header">
    <h1>Result search art</h1>
</div>

<div class="panel-default panel">
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="table">
                <thead>
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-sm-2"></th>
                        <th>Art</th>
                        <th>Creator</th>
                        <th>Upload Date</th>
                        <th class="col-sm-1">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <a href="#">
                                <img src="${SITE_URL}/asset/img/art.jpg" class="img-responsive image-art">
                            </a>
                        </td>
                        <td><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, dolor.</a></td>
                        <td><a href="#">Lorem</a></td>
                        <td>12-04-1023</td>
                        <td class="text-center">
                            <button
                                class="btn btn-default btn-sm"
                                data-toggle="modal"
                                data-target="#modal">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="post" action="${SITE_URL}/EditArt">
                <input type="hidden"  value="" name="id">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editModalLabel">Edit</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" name="title" placeholder="Art's name" value="">
                    </div>
                    <div class="form-group">
                        <label for="desciption">Description</label>
                        <textarea class="form-control" name="desc"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="tags">Tags (Seperate each tag by comma)</label>
                        <input type="tags" class="form-control" id="-tags" name="tags" value="">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="-sell" name="sell"> Do you want to sell this art?
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <div class="input-group">
                            <span class="input-group-addon">$</span>
                            <input type="number" class="form-control" id="-price" name="price" aria-label="Amount (to the nearest dollar)" value="" disabled>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" form="del-form" name="id2" value="">DELETE</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form>
            <form method="post" action="${SITE_URL}/DeleteArt/" id="del-form">
            </form>
        </div>
    </div>
</div>

<script>
    /* Manage table */
    $(document).ready(function(){
        $('#table').DataTable();
    });
</script>

<jsp:include page="../templates/footer.jsp" />
