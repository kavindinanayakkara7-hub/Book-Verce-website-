<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse - Register</title>


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



        .register-card{

            border:none;
            border-radius:20px;
            box-shadow:0 15px 40px rgba(0,0,0,0.08);

        }



        .card-header{

            background:white;
            border:none;
            text-align:center;
            padding-top:30px;

        }



        .card-header h2{

            font-weight:700;
            color:#111827;

        }



        .card-header p{

            color:#6b7280;

        }



        .form-control{

            height:48px;
            border-radius:12px;

        }



        textarea.form-control{

            height:100px;

        }



        .btn-register{

            background:#2563eb;
            color:white;
            height:50px;
            border-radius:25px;
            font-weight:600;

        }



        .btn-register:hover{

            background:#1d4ed8;
            color:white;

        }



        .login-link{

            text-decoration:none;
            color:#2563eb;
            font-weight:600;

        }



        .logo-icon{

            color:#2563eb;
            font-size:40px;

        }


    </style>


</head>



<body>



<!-- Navbar -->

<nav class="navbar bg-white shadow-sm">

    <div class="container">


        <a class="navbar-brand">

            <i class="bi bi-book-half"></i>

            BookVerse

        </a>


        <a href="index.jsp"
           class="btn btn-outline-primary">

            Home

        </a>


    </div>

</nav>





<div class="container mt-5 mb-5">


    <div class="row justify-content-center">


        <div class="col-md-6">



            <div class="card register-card">



                <div class="card-header">


                    <i class="bi bi-person-plus logo-icon"></i>


                    <h2>Create Account</h2>


                    <p>
                        Join BookVerse Digital Library
                    </p>


                </div>





                <div class="card-body p-4">



                    <form action="register" method="post">



                        <div class="mb-3">

                            <input class="form-control"
                                   name="firstName"
                                   placeholder="First Name"
                                   required>

                        </div>




                        <div class="mb-3">

                            <input class="form-control"
                                   name="lastName"
                                   placeholder="Last Name"
                                   required>

                        </div>




                        <div class="mb-3">

                            <input class="form-control"
                                   type="email"
                                   name="email"
                                   placeholder="Email Address"
                                   required>

                        </div>




                        <div class="mb-3">

                            <input class="form-control"
                                   type="password"
                                   name="password"
                                   placeholder="Password"
                                   required>

                        </div>





                        <div class="mb-3">

                            <input class="form-control"
                                   name="phone"
                                   placeholder="Phone Number">

                        </div>





                        <div class="mb-3">

<textarea class="form-control"
          name="address"
          placeholder="Your Address"></textarea>

                        </div>





                        <button class="btn btn-register w-100">

                            <i class="bi bi-check-circle"></i>

                            Create Account

                        </button>



                    </form>




                    <div class="text-center mt-4">


                        Already have an account?

                        <a href="login.jsp"
                           class="login-link">

                            Login

                        </a>


                    </div>



                </div>



            </div>



        </div>


    </div>


</div>



</body>

</html>