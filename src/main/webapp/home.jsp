<%@ page session="true" %>
<%@ page import="model.UserBean" %>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse - Dashboard</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            background:#f8fafc;
            font-family:'Segoe UI',sans-serif;

        }



        .navbar-brand{

            font-size:28px;
            font-weight:700;
            color:#2563eb;

        }



        .dashboard-card{

            border:none;
            border-radius:18px;
            box-shadow:0 10px 30px rgba(0,0,0,.08);
            transition:.3s;

        }


        .dashboard-card:hover{

            transform:translateY(-5px);

        }



        .icon{

            font-size:40px;
            color:#2563eb;

        }



        .logout{

            border-radius:25px;

        }



    </style>


</head>


<body>



<%

    UserBean user =
            (UserBean) session.getAttribute("user");


    if(user == null){

        response.sendRedirect("login.jsp");

    }

%>





<!-- Navbar -->

<nav class="navbar bg-white shadow-sm">


    <div class="container">


        <a class="navbar-brand">

            <i class="bi bi-book-half"></i>
            BookVerse

        </a>



        <div>


<span class="me-3">

<i class="bi bi-person-circle"></i>

<%= user.getFirstName() %>

</span>



            <a href="logout"
               class="btn btn-outline-danger logout">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>


        </div>


    </div>


</nav>







<div class="container mt-5">



    <div class="text-center mb-5">


        <h1>

            Welcome,
            <%= user.getFirstName() %>

        </h1>


        <p class="text-muted">

            Manage your digital library experience

        </p>


    </div>







    <div class="row g-4">





        <div class="col-md-4">


            <div class="card dashboard-card text-center p-4">


                <i class="bi bi-search icon"></i>


                <h4 class="mt-3">

                    Browse Books

                </h4>


                <p>

                    Explore available books in library

                </p>


                <a href="books"
                   class="btn btn-primary rounded-pill">

                    View Books

                </a>


            </div>


        </div>







        <div class="col-md-4">


            <div class="card dashboard-card text-center p-4">


                <i class="bi bi-person-vcard icon"></i>


                <h4 class="mt-3">

                    My Profile

                </h4>


                <p>

                    View your account details

                </p>


                <a href="profile.jsp"
                   class="btn btn-primary rounded-pill">

                    Profile

                </a>


            </div>


        </div>







        <div class="col-md-4">


            <div class="card dashboard-card text-center p-4">


                <i class="bi bi-clock-history icon"></i>


                <h4 class="mt-3">

                    Borrow History

                </h4>


                <p>

                    Check your borrowed books

                </p>


                <a href="myborrow"
                   class="btn btn-primary rounded-pill">

                    History

                </a>


            </div>


        </div>

        <div class="col-md-4">


            <div class="card dashboard-card text-center p-4">


                <i class="bi bi-clock-history icon"></i>


                <h4 class="mt-3">

                    Announcements

                </h4>


                <p>

                    Check your Publisher Announcements

                </p>


                <a href="viewAnnouncements"
                   class="btn btn-primary rounded-pill">

                    Publisher Announcement

                </a>


            </div>


        </div>


        <div class="col-md-4">


            <div class="card dashboard-card text-center p-4">


                <i class="bi bi-clock-history icon"></i>


                <h4 class="mt-3">

                    Feedback

                </h4>


                <p>

                    Add Your FeedBack Here

                </p>


                <a href="addFeedback"
                   class="btn btn-primary rounded-pill">

                    FeedBack

                </a>


            </div>


        </div>


    </div>


</div>





<footer class="text-center mt-5 py-4 bg-white">


    © 2026 BookVerse Library


</footer>



</body>

</html>