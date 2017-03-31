<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="panel-default panel">
    <div class="panel-heading"><h2>Upload Art</h2></div>
    <div class="panel-body">
        <form method="post">
            <div class="form-group">
                <label for="art-file">File input</label>
                <input type="file" id="art-file">
                <p class="help-block">Upload .jpg, .bmp, .png and .gif extensions only.</p>
            </div>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" placeholder="Art's name">
            </div>
            <div class="form-group">
                <label for="desciption">Desciption</label>
                <textarea class="form-control" id="desciption" placeholder="Please tell us about your brilliant art!"></textarea>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Do you want to buy this art?
                </label>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
