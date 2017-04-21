<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="page-header">
    <h1>Search result</h1>
</div>

<div class="panel panel-default">
    <div class="panel-body">
        <div class="media col-sm-10 col-xs-12 search-item">
            <div class="media-left">
                <img class="media-object image-search" src="${SITE_URL}/asset/img/art.jpg">
            </div>
            <div class="media-body">
                <span class="label label-default">Art</span>
                <h4 class="media-heading" style="display: inline-block;">
                    <a href="#">Media heading</a>
                </h4>
                <p>
                     Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.
                </p>
            </div>
        </div>
        <div class="media col-sm-10 col-xs-12 search-item">
            <div class="media-left">
                <img class="media-object image-search" src="${SITE_URL}/asset/img/art.jpg">
            </div>
            <div class="media-body">
                <span class="label label-default">Art</span>
                <h4 class="media-heading" style="display: inline-block;">
                    <a href="#">Media heading</a>
                </h4>
                <p>
                     Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.
                </p>
            </div>
        </div>
        <div class="media col-sm-10 col-xs-12 search-item">
            <div class="media-left">
                <img class="media-object image-search" src="${SITE_URL}/asset/img/avatar.jpg">
            </div>
            <div class="media-body">
                <span class="label label-default">Creator</span>
                <h4 class="media-heading" style="display: inline-block;">
                    <a href="#">Media heading</a>
                </h4>
                <p>
                     Lorem ipsum dolor sit amet.
                </p>
            </div>
        </div>
        <div class="media col-sm-10 col-xs-12 search-item">
            <div class="media-left">
                <img class="media-object image-search" src="${SITE_URL}/asset/img/art.jpg">
            </div>
            <div class="media-body">
                <span class="label label-default">Art</span>
                <h4 class="media-heading" style="display: inline-block;">
                    <a href="#">Media heading</a>
                </h4>
                <p>
                     Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.
                </p>
            </div>
        </div>
        <div class="media col-sm-10 col-xs-12 search-item">
            <div class="media-left">
                <img class="media-object image-search" src="${SITE_URL}/asset/img/art.jpg">
            </div>
            <div class="media-body">
                <span class="label label-default">Art</span>
                <h4 class="media-heading" style="display: inline-block;">
                    <a href="#">Media heading</a>
                </h4>
                <p>
                     Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam provident veritatis corporis unde quae doloremque eius quasi dolorem, quos impedit eligendi enim, architecto, deserunt mollitia voluptatibus commodi suscipit aliquam, et.
                </p>
            </div>
        </div>

        <div class="col-xs-12 text-center">
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-sm">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
</div>

<script>
    $(document).ready(function($) {
        $(function(){
            $('.search-item').dotdotdot({
                ellipsis: ' ...',
                wrap : 'word',
                watch : true
            });
        });
    });
</script>

<jsp:include page="templates/footer.jsp" />
