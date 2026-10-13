<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse Library</title>


    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <!-- Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            font-family: 'Segoe UI', sans-serif;
            background:#ffffff;

        }


        /* Navbar */

        .navbar{

            padding:20px;

        }


        .logo{

            font-size:28px;
            font-weight:700;
            color:#1d4ed8;

        }



        /* Hero */

        .hero{

            min-height:85vh;
            display:flex;
            align-items:center;

        }



        .hero h1{

            font-size:55px;
            font-weight:800;
            color:#111827;

        }


        .hero span{

            color:#2563eb;

        }


        .hero p{

            font-size:18px;
            color:#6b7280;

        }



        /* Buttons */

        .btn-primary{

            background:#2563eb;
            border:none;
            padding:13px 35px;
            border-radius:30px;

        }


        .btn-outline-primary{

            padding:13px 35px;
            border-radius:30px;

        }


        /* Image */


        .carousel img{

            height:450px;
            object-fit:cover;
            border-radius:20px;

        }



        /* Features */


        .feature-card{

            padding:25px;
            border-radius:15px;
            background:white;
            box-shadow:0 10px 30px rgba(0,0,0,.08);

        }


        .feature-card i{

            font-size:35px;
            color:#2563eb;

        }



    </style>


</head>


<body>


<!-- Navbar -->

<nav class="navbar navbar-expand-lg bg-white shadow-sm">


    <div class="container">


        <a class="navbar-brand logo">

            <i class="bi bi-book"></i>
            BookVerse

        </a>



        <div>


            <a href="login.jsp"
               class="btn btn-outline-primary me-2">

                Login

            </a>


            <a href="register.jsp"
               class="btn btn-primary">

                Register

            </a>


        </div>


    </div>


</nav>





<!-- Hero Section -->


<section class="hero">


    <div class="container">


        <div class="row align-items-center">



            <div class="col-md-6">


                <h1>

                    Discover Your Next
                    <span>Great Book</span>

                </h1>


                <p>

                    Welcome to BookVerse Library.
                    Explore thousands of books,
                    manage your collection and enjoy
                    a smart digital library experience.

                </p>



                <a href="register.jsp"
                   class="btn btn-primary mt-3">

                    Join Library

                </a>


                <a href="login.jsp"
                   class="btn btn-outline-primary mt-3 ms-2">

                    Member Login

                </a>



            </div>





            <div class="col-md-6">



                <div id="bookSlider"
                     class="carousel slide"
                     data-bs-ride="carousel">



                    <div class="carousel-inner">



                        <div class="carousel-item active">

                            <img src="https://images.unsplash.com/photo-1521587760476-6c12a4b040da"
                                 class="d-block w-100">


                        </div>



                        <div class="carousel-item">

                            <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794"
                                 class="d-block w-100">


                        </div>




                        <div class="carousel-item">

                            <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f"
                                 class="d-block w-100">


                        </div>



                    </div>



                </div>


            </div>



        </div>


    </div>


</section>






<!-- Features -->


<section class="container py-5">


    <div class="row g-4">



        <div class="col-md-4">


            <div class="feature-card text-center">


                <i class="bi bi-book-half"></i>

                <h4 class="mt-3">

                    Thousands of Books

                </h4>


                <p>

                    Access a large collection
                    of books anytime.

                </p>


            </div>


        </div>





        <div class="col-md-4">


            <div class="feature-card text-center">


                <i class="bi bi-search"></i>

                <h4 class="mt-3">

                    Easy Search

                </h4>


                <p>

                    Find your favourite books
                    quickly.

                </p>


            </div>


        </div>





        <div class="col-md-4">


            <div class="feature-card text-center">


                <i class="bi bi-person-check"></i>

                <h4 class="mt-3">

                    Member System

                </h4>


                <p>

                    Register and manage
                    your library account.

                </p>


            </div>


        </div>



    </div>


</section>







<footer class="text-center py-4 bg-light">


    <p>

        © 2026 BookVerse Library.
        All Rights Reserved.

    </p>


</footer>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js">
</script>


</body>


</html>