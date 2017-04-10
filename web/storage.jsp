<%@page import="model.Art"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1>My Storage</h1>
    </div>
    <% ArrayList<Art> allArt = (ArrayList<Art>) request.getAttribute("allArt");
   if(allArt != null){
       for(Art art: allArt){ %>   
            <div class="col-sm-3 image-storage">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <ul class="nav nav-pills">
                            <a href="${SITE_URL}/View/?id=<%=art.getId()%>">
                                <p>
                                    <img src="${SITE_URL}/asset/img/art/<%=art.getUrl()%>" class="
                                    img-responsive">
                                </p>
                                <div class="title">
                                    <p>
                                        <strong><%=art.getTitle()%></strong>
                                    </p>
                                </div>
                            </a>
                            <div class="price">
                                <p><%=art.getPrice()%></p>
                            </div>
                            <button data-toggle="modal" data-target="#editModal" data-art-id="<%=art.getId()%>" data-art-title="<%=art.getTitle() %>" data-art-desc="<%=art.getDesc()%>" class="btn btn-success col-sm-12 btn-xs">EDIT</button>
                        </ul>
                    </div>
                </div>
            </div>
               <%}
           }
        %>
    
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            
            <form method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editModalLabel">Edit</h4>
                </div>
                <div class="modal-body">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" id="title" placeholder="Art's name" value="進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」">
                        </div>
                        <div class="form-group">
                            <label for="desciption">Description</label>
                            <textarea class="form-control col-sm-12" id="desciption" placeholder="Please tell us about your brilliant art!">やっぱりダメでした。ということで乗り遅れもなんのそのやっと艦これはじめました。乗り遅れていたのでいじけて「艦これなんて…ふん！」とか思ってたのですが、試しにやってみたら…初雪の可愛さに撃沈しました。初雪のキャラがすごくいい味出ていて、堪りませんが止まりません。そんな初雪はどうやら一部の層にだけ人気があるくらいで存在感がないご様子？なぜだ！あんなに可愛いのに！今のところ私のお気に入りの艦娘は初雪と望月です。どっちもダメっぽいけど頑張るときはちゃんと頑張るやればできる娘達だと思います。仕事に支障きたすレベルにハマらないよう注意しながら初雪に「やだ…触らないで」と言われながら望月の肩をモミモミして生きて逝きたいと思います。おのれDMMめ…おのれ角川め…</textarea>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Do you want to sell this art?
                            </label>
                        </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger">DELETE</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form>
            
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />

<script>
$('#editModal').on('show.bs.modal', function(e) {
  
    var title = $(e.relatedTarget).data('art-title');
    var desc = $(e.relatedTarget).data('art-desc');
    
    $('#editModal').find('input#title').val(title);
    $('#editModal').find('textarea#desciption').val(desc);

});
</script>