<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="panel-default panel">
    <div class="panel-heading"><h2>Upload Art</h2></div>
    <div class="panel-body">
        <form method="post" enctype="multipart/form-data" action="${SITE_URL}/ArtUpload">
            <div class="form-group">
                <label for="art-file">File input</label>
                <input type="file" id="art-file" name="art">
                <p class="help-block">Upload .jpg, .bmp, .png and .gif extensions only.</p>
            </div>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" placeholder="Art's name" name="title">
            </div>
            <div class="form-group">
                <label for="desciption">Description</label>
                <textarea class="form-control" id="desciption" name="desc" placeholder="Please tell us about your brilliant art!"></textarea>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="sell"> Do you want to sell this art?
                </label>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
