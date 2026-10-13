<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse - Login</title>


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



        .login-card{

            border:none;
            border-radius:20px;
            box-shadow:0 15px 40px rgba(0,0,0,.08);

        }



        .icon{

            font-size:45px;
            color:#2563eb;

        }



        .card-header{

            background:white;
            border:none;
            text-align:center;
            padding-top:35px;

        }



        .card-header h2{

            font-weight:700;
            color:#111827;

        }



        .card-header p{

            color:#6b7280;

        }



        .form-control{

            height:50px;
            border-radius:12px;

        }



        .btn-login{

            background:#2563eb;
            color:white;
            height:50px;
            border-radius:25px;
            font-weight:600;

        }



        .btn-login:hover{

            background:#1d4ed8;
            color:white;

        }



        .link{

            text-decoration:none;
            color:#2563eb;
            font-weight:600;

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





<div class="container mt-5">


    <div class="row justify-content-center">


        <div class="col-md-5">



            <div class="card login-card">



                <div class="card-header">


                    <i class="bi bi-person-circle icon"></i>


                    <h2 class="mt-3">

                        Welcome Back

                    </h2>


                    <p>

                        Login to your library account

                    </p>


                </div>




                <div class="card-body p-4">



                    <%

                        String error=request.getParameter("error");

                        if(error!=null){

                    %>


                    <div class="alert alert-danger text-center">

                        <i class="bi bi-exclamation-triangle"></i>

                        Invalid Email or Password

                    </div>


                    <%

                        }

                    %>






                    <form action="login" method="post">



                        <div class="mb-3">


                            <label class="form-label">

                                Email Address

                            </label>


                            <input type="email"
                                   class="form-control"
                                   name="email"
                                   placeholder="Enter your email"
                                   required>


                        </div>





                        <div class="mb-3">


                            <label class="form-label">

                                Password

                            </label>


                            <input type="password"
                                   class="form-control"
                                   name="password"
                                   placeholder="Enter password"
                                   required>


                        </div>





                        <button type="submit"
                                class="btn btn-login w-100">


                            <i class="bi bi-box-arrow-in-right"></i>

                            Login


                        </button>



                    </form>






                    <div class="text-center mt-4">


                        Don't have an account?


                        <a href="register.jsp"
                           class="link">

                            Register Now

                        </a>


                    </div>




                </div>


            </div>



        </div>


    </div>


</div>





</body>

</html>