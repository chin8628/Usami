<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-header">
    <h1>Tags</h1>
</div>

<div class="panel panel-default">
    <div class="panel-body" >
        <c:forEach var="tag" items="${requestScope.allTag}">
            <div class="tag"><a href="${SITE_URL}/Gallery/?tag=${tag}"><span class="label label-info">${tag}</span></a></div>
        </c:forEach>
        
    </div>
</div>

<jsp:include page="templates/footer.jsp" />

