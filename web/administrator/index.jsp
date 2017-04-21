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
    <div class="panel-heading">Search</div>
    <div class="panel-body">
        <form method="post">
            <div class="form-group">
                <label for="search-type">Search Type</label>
                <div class="radio" id="search-type">
                    <label style="margin-right: 15px;">
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">
                        Art [ID art, Name art, Artist]
                    </label>
                    <label style="margin-right: 15px;">
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                        User [Username, User ID, Firstname, Lastname]
                    </label>
                    <label style="margin-right: 15px;">
                        <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
                        Comment [Part of comment, Art of comment, User]
                    </label>
                </div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="search" name="search" required="">
            </div>
            <button class="btn btn-primary">Search</button>
        </form>
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
