<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp" />

<div class="page-header">
    <h1>Control Panel</h1>
</div>

<div class="panel-default panel">
    <div class="panel-heading">All Report</div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Type</th>
                <th>Report by</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><a href="#">Too explicit sexual</a></td>
                <td>Art report</td>
                <td><a href="${URL}/profile.jsp">Ayano Tateyama</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Found bug on system</td>
                <td>Problem usage</td>
                <td>SovietWomble</td>
            </tr>
        </tbody>
    </table>
</div>

<jsp:include page="../templates/footer.jsp" />
