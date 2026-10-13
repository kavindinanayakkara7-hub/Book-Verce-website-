<%@page import="java.util.ArrayList"%>
<%@page import="model.ReservationBean"%>

<!DOCTYPE html>
<html>
<head>

    <title>My Reservations</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>

        body{
            background:#f4f7fb;
            font-family:'Segoe UI',sans-serif;
        }

        .page-title{
            color:#1e3a8a;
            font-weight:700;
        }

        .reservation-card{
            border:none;
            border-radius:20px;
            box-shadow:0 10px 25px rgba(0,0,0,.08);
        }

        .table{
            margin-bottom:0;
        }

        .table thead{
            background:#1e3a8a;
            color:white;
        }

        .table thead th{
            padding:15px;
        }

        .table tbody td{
            padding:15px;
            vertical-align:middle;
        }

        .table tbody tr:hover{
            background:#f1f5ff;
        }

        .empty-box{
            padding:50px;
            text-align:center;
        }

    </style>

</head>

<body>

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h2 class="page-title">
            <i class="bi bi-bookmark-check-fill"></i>
            My Reservations
        </h2>

        <a href="books" class="btn btn-primary rounded-pill">
            <i class="bi bi-arrow-left"></i>
            Back To Books
        </a>

    </div>

    <div class="card reservation-card">

        <div class="card-body p-0">

            <div class="table-responsive">

                <table class="table table-hover align-middle">

                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>User ID</th>
                        <th>Book ID</th>
                        <th>Reserve Date</th>
                        <th>Status</th>
                    </tr>
                    </thead>

                    <tbody>

                    <%
                        ArrayList<ReservationBean> list =
                                (ArrayList<ReservationBean>)request.getAttribute("reservations");

                        if(list != null && !list.isEmpty()){

                            for(ReservationBean r : list){
                    %>

                    <tr>

                        <td>
                            <strong>#<%=r.getId()%></strong>
                        </td>

                        <td>
                            <i class="bi bi-person-circle text-primary"></i>
                            <%=r.getUser_id()%>
                        </td>

                        <td>
                            <i class="bi bi-book text-success"></i>
                            <%=r.getBook_id()%>
                        </td>

                        <td>
                            <i class="bi bi-calendar-event text-danger"></i>
                            <%=r.getReserve_date()%>
                        </td>

                        <td>

                            <form action="updateReservationStatus"
                                  method="post"
                                  class="d-flex gap-2">

                                <input type="hidden"
                                       name="id"
                                       value="<%=r.getId()%>">

                                <select name="status"
                                        class="form-select form-select-sm">

                                    <option value="PENDING"
                                            <%=r.getStatus().equals("PENDING") ? "selected" : ""%>>
                                        Pending
                                    </option>

                                    <option value="APPROVED"
                                            <%=r.getStatus().equals("APPROVED") ? "selected" : ""%>>
                                        Approved
                                    </option>

                                    <option value="CANCELLED"
                                            <%=r.getStatus().equals("CANCELLED") ? "selected" : ""%>>
                                        Cancelled
                                    </option>

                                </select>

                                <button class="btn btn-success btn-sm"
                                        type="submit">

                                    <i class="bi bi-check-lg"></i>
                                    Update

                                </button>

                            </form>

                        </td>

                    </tr>

                    <%
                        }

                    }else{
                    %>

                    <tr>

                        <td colspan="5">

                            <div class="empty-box">

                                <i class="bi bi-bookmark-x display-4 text-secondary"></i>

                                <h4 class="mt-3">
                                    No Reservations Found
                                </h4>

                                <p class="text-muted">
                                    You have not reserved any books yet.
                                </p>

                                <a href="books"
                                   class="btn btn-primary rounded-pill">

                                    Browse Books

                                </a>

                            </div>

                        </td>

                    </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>