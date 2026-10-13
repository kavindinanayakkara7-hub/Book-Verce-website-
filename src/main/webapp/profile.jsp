<%@ page session="true" %>
<%@ page import="model.UserBean" %>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse - Profile</title>


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



        .profile-card{

            border:none;
            border-radius:20px;
            box-shadow:0 15px 40px rgba(0,0,0,.08);

        }



        .profile-icon{

            width:100px;
            height:100px;
            background:#2563eb;
            color:white;
            border-radius:50%;
            display:flex;
            align-items:center;
            justify-content:center;
            margin:auto;
            font-size:50px;

        }



        .info-box{

            background:#f8fafc;
            padding:15px;
            border-radius:12px;
            margin-bottom:15px;

        }



        .info-box i{

            color:#2563eb;
            margin-right:10px;

        }



    </style>


</head>


<body>


<%

    UserBean user =
            (UserBean)session.getAttribute("user");


    if(user == null){

        response.sendRedirect("login.jsp");

    }

%>





<nav class="navbar bg-white shadow-sm">


    <div class="container">


        <a class="navbar-brand">

            <i class="bi bi-book-half"></i>
            BookVerse

        </a>



        <div>


            <a href="home.jsp"
               class="btn btn-outline-primary me-2">

                <i class="bi bi-house"></i>

                Dashboard

            </a>



            <a href="logout"
               class="btn btn-outline-danger">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>


        </div>


    </div>


</nav>







<div class="container mt-5">


    <div class="row justify-content-center">


        <div class="col-md-6">



            <div class="card profile-card p-4">



                <div class="text-center">


                    <div class="profile-icon">

                        <i class="bi bi-person"></i>

                    </div>



                    <h2 class="mt-3">

                        <%= user.getFirstName() %>
                        <%= user.getLastName() %>

                    </h2>



                    <p class="text-muted">

                        BookVerse Library Member

                    </p>


                </div>





                <hr>





                <div class="info-box">

                    <i class="bi bi-envelope"></i>

                    <strong>Email:</strong>

                    <%= user.getEmail() %>

                </div>






                <div class="info-box">

                    <i class="bi bi-telephone"></i>

                    <strong>Phone:</strong>

                    <%= user.getPhone() %>

                </div>






                <div class="info-box">

                    <i class="bi bi-geo-alt"></i>

                    <strong>Address:</strong>

                    <%= user.getAddress() %>

                </div>







                <div class="info-box">

                    <i class="bi bi-person-badge"></i>

                    <strong>Role:</strong>

                    Member

                </div>





            </div>


        </div>


    </div>


</div>







</body>

</html>