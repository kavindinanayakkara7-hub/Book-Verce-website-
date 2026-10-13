<%@page import="java.util.ArrayList"%>
<%@page import="model.AnnouncementBean"%>

<%
    ArrayList<AnnouncementBean> list =
            (ArrayList<AnnouncementBean>) request.getAttribute("announcements");
%>

<!DOCTYPE html>
<html>
<head>

    <title>Announcements | BookVerse</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>

        body{
            background:#f5f7fb;
        }

        .announcement-card{

            border:none;
            border-radius:15px;
            box-shadow:0 5px 20px rgba(0,0,0,.08);
            margin-bottom:20px;

        }

        .announcement-title{

            font-size:22px;
            font-weight:bold;
            color:#0d6efd;

        }

        .date{

            color:gray;
            font-size:14px;

        }

    </style>

</head>

<body>

<div class="container py-5">

    <h2 class="text-center mb-4">

        <i class="bi bi-megaphone-fill text-primary"></i>

        Library Announcements

    </h2>

    <%

        if(list!=null && !list.isEmpty()){

            for(AnnouncementBean a:list){

    %>

    <div class="card announcement-card">

        <div class="card-body">

            <h4 class="announcement-title">

                <%=a.getTitle()%>

            </h4>

            <p class="date">

                <i class="bi bi-calendar-event"></i>

                <%=a.getPublishDate()%>

            </p>

            <hr>

            <p>

                <%=a.getMessage()%>

            </p>

        </div>

    </div>

    <%

        }

    }else{

    %>

    <div class="alert alert-info text-center">

        No announcements available.

    </div>

    <%

        }

    %>

</div>

</body>
</html>