<%@ page import="model.Art" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="templates/header.jsp" />

<div class="col-sm-12">
    <div class="page-header">
        <h1>My Storage</h1>
    </div>
    <c:if test="${requestScope.allArt != null}">
        <c:forEach var="art" items="${requestScope.allArt}">
            <div class="col-sm-3 image-storage">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <ul class="nav nav-pills">
                            <a href="${SITE_URL}/View/?id=${art.getId()}">
                                <p><img src="${SITE_URL}/asset/img/art/${art.getUrl()}" class="img-responsive"></p>
                                <div class="title">
                                    <p><strong>${art.getTitle()}</strong></p>
                                </div>
                            </a>
                            <div class="price">
                                <p>${art.getPrice()}</p>
                            </div>
                            <button
                                data-toggle="modal"
                                data-target="#${art.getId()}-modal"
                                data-site-url="${SITE_URL}"
                                data-art-id="${art.getId()}"
                                data-art-title="${art.getTitle()}"
                                data-art-desc="${art.getDesc()}"
                                class="btn btn-success col-sm-12 btn-xs">
                                EDIT
                            </button>
                        </ul>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

<c:if test="${requestScope.allArt != null}">
    <c:forEach var="art" items="${requestScope.allArt}">
        <div class="modal fade" id="${art.getId()}-modal" tabindex="-1" role="dialog" aria-labelledby="${art.getId()}-modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form method="post" action="${SITE_URL}/EditArt">
                        <input type="hidden"  value="${art.getId()}" name="id">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="editModalLabel">Edit</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" class="form-control" name="title" placeholder="Art's name" value="進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」">
                            </div>
                            <div class="form-group">
                                <label for="desciption">Description</label>
                                <textarea class="form-control" name="desc" placeholder="Please tell us about your brilliant art!">やっぱりダメでした。ということで乗り遅れもなんのそのやっと艦これはじめました。乗り遅れていたのでいじけて「艦これなんて…ふん！」とか思ってたのですが、試しにやってみたら…初雪の可愛さに撃沈しました。初雪のキャラがすごくいい味出ていて、堪りませんが止まりません。そんな初雪はどうやら一部の層にだけ人気があるくらいで存在感がないご様子？なぜだ！あんなに可愛いのに！今のところ私のお気に入りの艦娘は初雪と望月です。どっちもダメっぽいけど頑張るときはちゃんと頑張るやればできる娘達だと思います。仕事に支障きたすレベルにハマらないよう注意しながら初雪に「やだ…触らないで」と言われながら望月の肩をモミモミして生きて逝きたいと思います。おのれDMMめ…おのれ角川め…</textarea>
                            </div>
                            <div class="form-group">
                                <label for="tags">Tags (Seperate each tag by comma)</label>
                                <input type="tags" class="form-control" id="${art.getId()}-tags" name="tags">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="${art.getId()}-sell" name="sell"> Do you want to sell this art?
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <div class="input-group">
                                    <span class="input-group-addon">$</span>
                                    <input type="number" class="form-control" id="${art.getId()}-price" name="price" aria-label="Amount (to the nearest dollar)" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" form="del-form">DELETE</button>
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                    <form method="post" action="${SITE_URL}/DeleteArt" id="del-form">
                        <input type="text" hidden="hidden" name="id" id="art-id2">
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

<script>
    <c:if test="${requestScope.allArt != null}">
        <c:forEach var="art" items="${requestScope.allArt}">
            $('#${art.getId()}-tags').tagsInput({
                'width': "auto",
                'height': "auto",
                'delimiter': [',']
            });

            $('#${art.getId()}-sell').click(function(event) {
                if ($(this).is(':checked') === true) {
                    $('#${art.getId()}-price').prop( "disabled", false );
                } else {
                    $('#${art.getId()}-price').prop( "disabled", true ).val(null);
                }
            });
        </c:forEach>
    </c:if>
</script>

<jsp:include page="templates/footer.jsp" />
