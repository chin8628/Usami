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
                        <th class="col-md-1"></th>
                        <th>Creator</th>
                        <th>Comment</th>
                        <th>Comment Date</th>
                        <th class="col-sm-1">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <a href="#">
                                <img src="${SITE_URL}/asset/img/avatar.jpg" class="img-responsive avatar-art">
                            </a>
                        </td>
                        <td><a href="#">Lorem</a></td>
                        <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda officiis voluptatum recusandae mollitia cupiditate eum non, voluptate et aspernatur. Laboriosam inventore vitae qui doloremque odit, adipisci dolorem nihil tempore laudantium?</td>
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
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Update comment</h4>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="form-group">
                        <label for="comment">Comment</label>
                        <textarea class="form-control" rows="7" id="comment">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil minus, ab totam corrupti alias iusto. Omnis culpa, fugit, repudiandae deserunt voluptas aut nemo velit ullam error aliquid tempore accusamus, fuga.</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger">Delete</button>
                <button type="submit" class="btn btn-default">Update</button>
            </div>
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
