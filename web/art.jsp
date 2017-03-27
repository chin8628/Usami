<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />

<section id="art">
    <div class="col-sm-8 col-sm-offset-2 row">
        <div class="col-sm-3">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <p>
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/asset/img/avatar.jpg">
                            </a>
                        </p>
                        <p>御免なさい＠単行本発売中</p>
                        <p><span class="label label-default">Standard User</span></p>
                        <p><button class="btn btn-success btn-sm" type="submit">Follow</button></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2>進撃の艦娘・初雪「明日から本気だす…から…っ見てて…！」</h2>
                    <hr>

                    <p>やっぱりダメでした。ということで乗り遅れもなんのそのやっと艦これはじめました。乗り遅れていたのでいじけて「艦これなんて…ふん！」とか思ってたのですが、試しにやってみたら…初雪の可愛さに撃沈しました。初雪のキャラがすごくいい味出ていて、堪りませんが止まりません。そんな初雪はどうやら一部の層にだけ人気があるくらいで存在感がないご様子？なぜだ！あんなに可愛いのに！今のところ私のお気に入りの艦娘は初雪と望月です。どっちもダメっぽいけど頑張るときはちゃんと頑張るやればできる娘達だと思います。仕事に支障きたすレベルにハマらないよう注意しながら初雪に「やだ…触らないで」と言われながら望月の肩をモミモミして生きて逝きたいと思います。おのれDMMめ…おのれ角川め…</p>

                    <div id="tag-group">
                        <a href="#">
                            <span class="label label-info tag">
                                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> KanColle
                            </span>
                        </a>
                        <a href="#">
                            <span class="label label-info tag">
                                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> Kantai Collection
                            </span>
                        </a>
                        <a href="#">
                            <span class="label label-info tag">
                                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span> Girl Sad
                            </span>
                        </a>
                    </div>

                    <img src="${pageContext.request.contextPath}/asset/img/art.jpg" class="img-responsive">

                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success btn-xs" id="favorite-btn">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4732
                        </button>
                    </div>

                    <div class="panel panel-default col-sm-12" id="comment-box">
                        <div class="panel-body">
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="${pageContext.request.contextPath}/asset/img/avatar2.jpg">
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Comment</h4>
                                    <form method="POST">
                                        <textarea name="comment"></textarea>
                                        <button type="submit" class="btn btn-success btn-sm">Send</button>
                                    </form>
                                </div>
                                <hr>
                            </div>

                            <div class="media comment-reply">
                                <div class="media-left">
                                    <img class="media-object" src="${pageContext.request.contextPath}/asset/img/avatar2.jpg">
                                </div>
                                <div class="media-body">
                                    <p><a href="#">chin8628</a> <small>12/25/2015 23:08</small></p>
                                    <p>Your art is very cute!.</p>
                                </div>
                                <hr>
                            </div>

                            <div class="media comment-reply">
                                <div class="media-left">
                                    <img class="media-object" src="${pageContext.request.contextPath}/asset/img/avatar.jpg">
                                </div>
                                <div class="media-body">
                                    <p><a href="#">御免なさい＠単行本発売中</a> <small>12/25/2015 20:28</small></p>
                                    <p>おのれDMMですか・・・。 ただ、まさかのそのDMMで先生の本 買えるようになったのはビビリました・・。</p>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="templates/footer.jsp" />
