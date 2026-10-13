<%@page import="java.util.ArrayList"%>
<%@page import="model.ReservationBean"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>My Reservations | BookVerse</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            background:#f4f7fb;
            font-family:'Segoe UI',sans-serif;

        }



        .navbar{

            background:#1e3a8a;

        }



        .navbar-brand{

            color:white !important;
            font-size:28px;
            font-weight:bold;

        }



        .page-title{

            color:#1e3a8a;
            font-weight:700;

        }



        .reservation-card{

            border:none;
            border-radius:20px;
            overflow:hidden;
            background:white;
            box-shadow:0 10px 25px rgba(0,0,0,.1);
            transition:.3s;

        }



        .reservation-card:hover{

            transform:translateY(-5px);

        }



        .book-img{

            height:260px;
            width:100%;
            object-fit:cover;

        }



        .card-body h4{

            font-weight:700;
            color:#1f2937;

        }



        .info{

            color:#6b7280;

        }



        .pending{

            background:#f59e0b;

        }



        .approved{

            background:#16a34a;

        }



        .cancelled{

            background:#dc2626;

        }



        .badge{

            padding:10px 18px;
            border-radius:20px;

        }



        .empty-box{

            background:white;
            padding:50px;
            border-radius:20px;
            text-align:center;
            box-shadow:0 10px 25px rgba(0,0,0,.08);

        }



    </style>


</head>


<body>



<!-- Navbar -->


<nav class="navbar navbar-expand-lg">


    <div class="container">


        <a class="navbar-brand" href="books">


            <i class="bi bi-book-half"></i>

            BookVerse

        </a>


    </div>


</nav>




<div class="container py-5">



    <div class="d-flex justify-content-between align-items-center mb-5">


        <h2 class="page-title">

            <i class="bi bi-bookmark-check-fill"></i>

            My Reservations

        </h2>



        <a href="books"
           class="btn btn-primary rounded-pill">


            <i class="bi bi-arrow-left"></i>

            Browse Books


        </a>



    </div>





    <div class="row g-4">



        <%


            ArrayList<ReservationBean> list =

                    (ArrayList<ReservationBean>)
                            request.getAttribute("reservations");



            if(list != null && !list.isEmpty()){



                for(ReservationBean r : list){


        %>




        <div class="col-lg-4 col-md-6">



            <div class="card reservation-card">



                <img src="<%=request.getContextPath()%>/images/<%=r.getBookImage()%>"
                     class="book-img">





                <div class="card-body p-4">



                    <h4>

                        <i class="bi bi-book"></i>

                        <%=r.getBookTitle()%>


                    </h4>



                    <hr>



                    <p class="info">


                        <i class="bi bi-calendar-event"></i>


                        Reserve Date :

                        <br>


                        <strong>

                            <%=r.getReserve_date()%>

                        </strong>


                    </p>





                    <p class="info">


                        <i class="bi bi-info-circle"></i>


                        Status :

                        <br>


                        <%


                            if(r.getStatus().equals("PENDING")){


                        %>


                        <span class="badge pending text-white">

<i class="bi bi-clock"></i>

Pending

</span>


                        <%


                        }else if(r.getStatus().equals("APPROVED")){


                        %>


                        <span class="badge approved text-white">

<i class="bi bi-check-circle"></i>

Approved

</span>



                        <%


                        }else{


                        %>


                        <span class="badge cancelled text-white">


<i class="bi bi-x-circle"></i>

Cancelled


</span>



                        <%


                            }


                        %>



                    </p>



                </div>


            </div>



        </div>




        <%


            }


        }else{


        %>



        <div class="col-12">


            <div class="empty-box">


                <i class="bi bi-bookmark-x display-3 text-secondary"></i>


                <h3 class="mt-3">

                    No Reservations Found

                </h3>


                <p class="text-muted">

                    You have not reserved any books yet.

                </p>


                <a href="books"
                   class="btn btn-primary rounded-pill">


                    Find Books


                </a>


            </div>


        </div>



        <%


            }


        %>





    </div>



</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


</body>


</html>