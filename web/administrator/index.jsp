<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp" />

<div class="page-header">
    <h1>Control Panel</h1>
</div>

<div class="panel-default panel">
    <div class="panel-heading">Overview</div>
    <div class="panel-body">
        <canvas id="myChart" height="100"></canvas>
    </div>
</div>

<div class="panel-default panel">
    <div class="panel-heading">All Report</div>
    <div class="panel-body">
        <table class="table table-bordered" id="report">
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
                    <td><a href="#" data-toggle="modal" data-target="#myModal">Too explicit sexual</a></td>
                    <td>Art</td>
                    <td><a href="${SITE_URL}/profile.jsp">chin8628</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="#" data-toggle="modal" data-target="#myModal">Found bug on system</a></td>
                    <td>Problem usage</td>
                    <td><a href="${SITE_URL}/profile.jsp">chin8628</a></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><a href="#" data-toggle="modal" data-target="#myModal">Too violation comment</a></td>
                    <td>Comment</td>
                    <td><a href="${SITE_URL}/profile.jsp">chin8628</a></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><a href="#" data-toggle="modal" data-target="#myModal">I was spamed by another user</a></td>
                    <td>User</td>
                    <td><a href="${SITE_URL}/profile.jsp">chin8628</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Report</h4>
                </div>
                <div class="modal-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus ut iure nemo quo assumenda impedit, quos eveniet, dignissimos praesentium perspiciatis deleniti amet iste esse ipsam sequi repudiandae libero a quis!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
      </div>
</div>

<script>
    /* Manage table */
    $(document).ready(function(){
        $('#report').DataTable();
    });

    /* Create chart by Chart.js */
    var ctx = $("#myChart");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["21/03/2017", "22/03/2017", "23/03/2017", "24/03/2017", "25/03/2017", "26/03/2017"],
            datasets: [{
                label: '# of Uploaded Art',
                data: [539, 693, 413, 435, 393, 932],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)'
                ],
                borderWidth: 1
            },
            {
                label: '# of Purchased',
                data: [102, 232, 103, 184, 200, 302],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>

<jsp:include page="../templates/footer.jsp" />
