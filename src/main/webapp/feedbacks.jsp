<%@page import="java.util.ArrayList"%>
<%@page import="model.FeedbackBean"%>

<%
    ArrayList<FeedbackBean> list =
            (ArrayList<FeedbackBean>)request.getAttribute("feedbacks");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Feedback Management | BookVerse</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

        body{
            background:#f5f7fb;
        }

        .card{
            border:none;
            border-radius:18px;
            box-shadow:0 8px 25px rgba(0,0,0,.08);
        }

        .card-header{
            background:#0d6efd;
            color:#fff;
            font-size:22px;
            font-weight:600;
            border-radius:18px 18px 0 0 !important;
        }

        .table th{
            background:#0d6efd;
            color:#fff;
            vertical-align:middle;
        }

        .table td{
            vertical-align:middle;
        }

        .message{
            max-width:400px;
            white-space:normal;
            word-break:break-word;
        }

        .badge-date{
            font-size:12px;
        }

        .page-title{
            font-weight:700;
            color:#2c3e50;
        }

    </style>

</head>

<body>

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h2 class="page-title">

            <i class="bi bi-chat-left-text-fill text-primary"></i>

            Feedback Management

        </h2>

        <span class="badge bg-primary fs-6">

            Total Feedback :
            <%= list==null ? 0 : list.size() %>

        </span>

    </div>

    <div class="card">

        <div class="card-header">

            <i class="bi bi-envelope-paper-fill"></i>

            User Feedback

        </div>

        <div class="card-body">

            <div class="mb-3">

                <input type="text"
                       class="form-control"
                       id="searchInput"
                       placeholder="🔍 Search feedback...">

            </div>

            <div class="table-responsive">

                <table class="table table-bordered table-hover"
                       id="feedbackTable">

                    <thead>

                    <tr>

                        <th width="70">ID</th>

                        <th width="100">User</th>

                        <th width="220">Subject</th>

                        <th>Message</th>

                        <th width="180">Date</th>

                    </tr>

                    </thead>

                    <tbody>

                    <%

                        if(list!=null){

                            for(FeedbackBean f:list){

                    %>

                    <tr>

                        <td>

                            <span class="badge bg-dark">

                                #<%=f.getId()%>

                            </span>

                        </td>

                        <td>

                            <span class="badge bg-secondary">

                                User <%=f.getUserId()%>

                            </span>

                        </td>

                        <td>

                            <strong>

                                <%=f.getSubject()%>

                            </strong>

                        </td>

                        <td class="message">

                            <%=f.getMessage()%>

                        </td>

                        <td>

                            <span class="badge bg-success badge-date">

                                <i class="bi bi-calendar-event"></i>

                                <%=f.getCreatedAt()%>

                            </span>

                        </td>

                    </tr>

                    <%

                            }

                        }

                    %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>

<script>

    document.getElementById("searchInput").addEventListener("keyup",function(){

        let filter=this.value.toLowerCase();

        let rows=document.querySelectorAll("#feedbackTable tbody tr");

        rows.forEach(function(row){

            row.style.display=row.innerText.toLowerCase().includes(filter)
                ? ""
                : "none";

        });

    });

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>