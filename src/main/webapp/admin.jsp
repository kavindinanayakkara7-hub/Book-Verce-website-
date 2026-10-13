<%@ page session="true" %>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse - Admin Panel</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            background:#f8fafc;
            font-family:'Segoe UI',sans-serif;

        }



        .sidebar{

            min-height:100vh;
            background:#ffffff;
            box-shadow:0 0 20px rgba(0,0,0,.08);
            padding:25px;

        }



        .logo{

            font-size:28px;
            font-weight:700;
            color:#2563eb;

        }



        .sidebar a{

            display:block;
            padding:14px;
            margin-top:10px;
            text-decoration:none;
            color:#374151;
            border-radius:12px;

        }



        .sidebar a:hover{

            background:#2563eb;
            color:white;

        }



        .dashboard-card{

            border:none;
            border-radius:18px;
            box-shadow:0 10px 30px rgba(0,0,0,.08);

        }



        .icon{

            font-size:40px;
            color:#2563eb;

        }



    </style>


</head>



<body>




<div class="container-fluid">


    <div class="row">





        <!-- Sidebar -->


        <div class="col-md-3 sidebar">


            <div class="logo mb-4">


                <i class="bi bi-book-half"></i>

                BookVerse


            </div>




            <a href="adminDashboard">

                <i class="bi bi-speedometer2"></i>

                Dashboard

            </a>

            <a href="addAnnouncement">

                <i class="bi bi-speedometer2"></i>

                Publisher Announcement

            </a>

            <a href="viewFeedback">

                <i class="bi bi-speedometer2"></i>

                View All FeedBack

            </a>



            <a href="addBook">

                <i class="bi bi-plus-circle"></i>

                Add Book

            </a>

            <a href="viewReservations">

                <i class="bi bi-plus-circle"></i>

                View Reservation

            </a>

            <a href="adminContacts">

                <i class="bi bi-plus-circle"></i>

                Messages

            </a>



            <a href="manageBooks">

                <i class="bi bi-book"></i>

                Manage Books

            </a>



            <a href="manageUsers">

                <i class="bi bi-people"></i>

                Users

            </a>



            <a href="borrowRecords">

                <i class="bi bi-clock-history"></i>

                Borrow Requests

            </a>




            <hr>



            <a href="logout"
               class="text-danger">


                <i class="bi bi-box-arrow-right"></i>

                Logout


            </a>



        </div>







        <!-- Main Content -->


        <div class="col-md-9 p-5">



            <h1>

                Admin Dashboard

            </h1>


            <p class="text-muted">

                Manage BookVerse Library System

            </p>





            <div class="row g-4 mt-3">






                <div class="col-md-4">


                    <div class="card dashboard-card p-4 text-center">


                        <i class="bi bi-book icon"></i>


                        <h4 class="mt-3">

                            Total Books

                        </h4>


                        <h2>

                            <%=request.getAttribute("totalBooks")%>

                        </h2>


                    </div>


                </div>







                <div class="col-md-4">


                    <div class="card dashboard-card p-4 text-center">


                        <i class="bi bi-people icon"></i>


                        <h4 class="mt-3">

                            Users

                        </h4>


                        <h2>

                            <%=request.getAttribute("totalUsers")%>

                        </h2>


                    </div>


                </div>







                <div class="col-md-4">


                    <div class="card dashboard-card p-4 text-center">


                        <i class="bi bi-arrow-left-right icon"></i>


                        <h4 class="mt-3">

                            Borrowed Books

                        </h4>


                        <h2>

                            <%=request.getAttribute("totalBorrowed")%>

                        </h2>


                    </div>


                </div>







            </div>







            <div class="card dashboard-card mt-5 p-4">


                <h3>

                    Quick Actions

                </h3>


                <a href="addBook"
                   class="btn btn-primary mt-3">

                    <i class="bi bi-plus"></i>

                    Add New Book

                </a>


            </div>







        </div>




    </div>


</div>





</body>

</html>