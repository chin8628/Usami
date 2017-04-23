<%@page import="model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<% User user = (User) request.getSession().getAttribute("user"); %>
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
            <div class="form-group">
                <label for="tags">Tags (Seperate each tag by comma)</label>
                <input type="tags" class="form-control" id="tags" name="tags">
            </div>
            <% if(user.getU_type().equals("PRM")) { %>
            <div class="checkbox">
                <br>
                <label>
                    <input type="checkbox" id="sell" name="sell"> Would you like to sell this art?
                </label>
                
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <div class="input-group">
                    <span class="input-group-addon">Coin</span>
                    <input type="number" class="form-control" id="price" name="price" aria-label="Amount in whole number" disabled>
                </div>
            </div>
            <% } %>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>

<script>
$('#tags').tagsInput({
    'width': "auto",
    'height': "auto",
    'delimiter': [',']
});

$('#sell').click(function(event) {
    if ($(this).is(':checked') == true) {
        $('#price').prop( "disabled", false );
    } else {
        $('#price').prop( "disabled", true ).val(null);
    }
});
</script>

<jsp:include page="templates/footer.jsp" />
