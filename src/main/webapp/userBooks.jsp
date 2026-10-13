<%@page import="java.util.ArrayList"%>
<%@page import="model.BookBean"%>
<%@page import="dao.FavoriteDAO"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>BookVerse Library</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

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

            font-size:28px;
            font-weight:bold;
            color:white !important;

        }

        .nav-link{

            color:white !important;
            margin-left:15px;

        }

        .hero{

            background:linear-gradient(135deg,#2563eb,#3b82f6);

            padding:70px 0;

            color:white;

            margin-bottom:40px;

        }

        .search-box{

            max-width:600px;

            margin:auto;

        }

        .book-card{

            border:none;

            border-radius:20px;

            overflow:hidden;

            transition:.3s;

            box-shadow:0 10px 25px rgba(0,0,0,.08);

            background:white;

        }

        .book-card:hover{

            transform:translateY(-8px);

            box-shadow:0 20px 35px rgba(0,0,0,.15);

        }

        .book-card img{

            height:320px;

            object-fit:cover;

        }

        .book-title{

            font-size:22px;

            font-weight:bold;

            color:#1f2937;

        }

        .book-desc{

            height:70px;

            overflow:hidden;

            color:#6b7280;

        }

        .badge-year{

            background:#2563eb;

        }

        .available{

            color:green;

            font-weight:bold;

        }

        .btn-book{

            background:#2563eb;

            color:white;

            border-radius:30px;

        }

        .btn-book:hover{

            background:#1d4ed8;

            color:white;

        }

        .heart-btn{

            border:none;

            background:none;

            float:right;

            font-size:25px;

            cursor:pointer;

            color:#777;

        }


        .heart-btn:hover{

            transform:scale(1.2);

        }


        .active-heart{

            color:red;

            animation:heart .3s;

        }


        @keyframes heart{

            0%{

                transform:scale(.5);

            }


            100%{

                transform:scale(1);

            }

        }

    </style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg">

    <div class="container">

        <a class="navbar-brand" href="#">

            <i class="bi bi-book-half"></i>

            BookVerse

        </a>

        <button class="navbar-toggler bg-white"
                data-bs-toggle="collapse"
                data-bs-target="#menu">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="menu">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link" href="#">Home</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="#">Books</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="#">Categories</a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="myborrow">
                        <i class="bi bi-book"></i>
                        My Borrow
                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="myReservations">

                        <i class="bi bi-bookmark-check-fill"></i>

                        My Reservations

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="contact">Contact</a>

                </li>



            </ul>

        </div>

    </div>

</nav>

<!-- Hero -->

<section class="hero text-center">

    <div class="container">

        <h1 class="display-4 fw-bold">

            Discover Your Next Favorite Book

        </h1>

        <p class="lead">

            Thousands of books waiting for you.

        </p>

        <div class="search-box mt-4">

            <input type="text"
                   class="form-control form-control-lg"
                   placeholder="Search books...">

        </div>

    </div>

</section>

<!-- Books -->

<!-- Books -->

<div class="container">

    <div class="row g-4">


        <%

            ArrayList<BookBean> books =
                    (ArrayList<BookBean>)request.getAttribute("books");


            Integer userId =
                    (Integer)session.getAttribute("user_id");


            FavoriteDAO favoriteDAO =
                    new FavoriteDAO();



            if(books!=null){


                for(BookBean b:books){


                    boolean liked=false;


                    if(userId!=null){

                        liked =
                                favoriteDAO.isFavorite(
                                        userId,
                                        b.getId()
                                );

                    }


        %>



        <div class="col-lg-4 col-md-6">


            <div class="card book-card">


                <img src="<%=request.getContextPath()%>/images/<%=b.getImage()%>"
                                                                 class="card-img-top"
                                                                 style="height:250px;object-fit:cover;">



                <div class="card-body">



                    <button
                            class="heart-btn"
                            onclick="toggleFavorite(<%=b.getId()%>,this)">



                        <i class="bi
                <%= liked ? "bi-heart-fill active-heart" : "bi-heart" %>">
                        </i>



                    </button>





                    <h4 class="book-title">

                        <%=b.getTitle()%>

                    </h4>




                    <span class="badge badge-year">

                <%=b.getPublish_year()%>

            </span>




                    <p class="book-desc mt-3">

                        <%=b.getDescription()%>

                    </p>




                    <p>

                        Available :

                        <span class="available">

                    <%=b.getAvailable()%>

                    Copies

                </span>

                    </p>




                    <div class="d-grid gap-2">


                        <a href="viewBook?id=<%=b.getId()%>"
                           class="btn btn-book">

                            <i class="bi bi-book"></i>

                            View Details

                        </a>



                        <%

                            if(b.getAvailable() > 0){

                        %>

                        <button class="btn btn-outline-success">

                            <i class="bi bi-cart-plus"></i>

                            Borrow Book

                        </button>


                        <%

                        }else{

                        %>


                        <a href="reserveBook?id=<%=b.getId()%>"
                           class="btn btn-warning">


                            <i class="bi bi-bookmark-plus-fill"></i>

                            Reserve Book


                        </a>


                        <%

                            }

                        %>


                    </div>



                </div>


            </div>


        </div>



        <%

                }

            }

        %>


    </div>

</div>
<!-- Statistics -->

<section class="container mt-5 mb-5">

    <div class="row text-center">

        <div class="col-md-3 mb-3">

            <div class="card border-0 shadow-sm p-4 rounded-4">

                <h2 class="text-primary fw-bold">500+</h2>

                <p class="text-muted mb-0">Books</p>

            </div>

        </div>

        <div class="col-md-3 mb-3">

            <div class="card border-0 shadow-sm p-4 rounded-4">

                <h2 class="text-success fw-bold">120+</h2>

                <p class="text-muted mb-0">Members</p>

            </div>

        </div>

        <div class="col-md-3 mb-3">

            <div class="card border-0 shadow-sm p-4 rounded-4">

                <h2 class="text-warning fw-bold">80+</h2>

                <p class="text-muted mb-0">Authors</p>

            </div>

        </div>

        <div class="col-md-3 mb-3">

            <div class="card border-0 shadow-sm p-4 rounded-4">

                <h2 class="text-danger fw-bold">24/7</h2>

                <p class="text-muted mb-0">Library</p>

            </div>

        </div>

    </div>

</section>

<!-- Newsletter -->

<section class="container mb-5">

    <div class="card border-0 shadow rounded-4 p-5 text-center">

        <h2 class="fw-bold">

            Stay Updated

        </h2>

        <p class="text-muted">

            Subscribe to receive new book updates.

        </p>

        <div class="row justify-content-center">

            <div class="col-md-6">

                <div class="input-group">

                    <input type="email"
                           class="form-control"
                           placeholder="Enter your email">

                    <button class="btn btn-primary">

                        Subscribe

                    </button>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- Footer -->

<footer class="bg-dark text-white mt-5">

    <div class="container py-5">

        <div class="row">

            <div class="col-md-4">

                <h3>

                    <i class="bi bi-book-half"></i>

                    BookVerse

                </h3>

                <p class="text-light">

                    Read. Learn. Grow.

                    Your modern online library.

                </p>

            </div>

            <div class="col-md-4">

                <h5>

                    Quick Links

                </h5>

                <ul class="list-unstyled">

                    <li>

                        <a href="#"
                           class="text-white text-decoration-none">

                            Home

                        </a>

                    </li>

                    <li>

                        <a href="#"
                           class="text-white text-decoration-none">

                            Books

                        </a>

                    </li>

                    <li>

                        <a href="#"
                           class="text-white text-decoration-none">

                            Categories

                        </a>

                    </li>

                    <li>

                        <a href="#"
                           class="text-white text-decoration-none">

                            Contact

                        </a>

                    </li>

                </ul>

            </div>

            <div class="col-md-4">

                <h5>

                    Follow Us

                </h5>

                <a href="#" class="text-white fs-3 me-3">

                    <i class="bi bi-facebook"></i>

                </a>

                <a href="#" class="text-white fs-3 me-3">

                    <i class="bi bi-instagram"></i>

                </a>

                <a href="#" class="text-white fs-3 me-3">

                    <i class="bi bi-twitter-x"></i>

                </a>

                <a href="#" class="text-white fs-3">

                    <i class="bi bi-youtube"></i>

                </a>

            </div>

        </div>

        <hr>

        <div class="text-center">

            © 2026 BookVerse Library Management System.

            All Rights Reserved.

        </div>

    </div>

</footer>

<!-- Search Script -->

<script>

    const searchInput =
        document.querySelector(".search-box input");

    searchInput.addEventListener("keyup",function(){

        let value =
            this.value.toLowerCase();

        document.querySelectorAll(".book-card")
            .forEach(function(card){

                let title =
                    card.querySelector(".book-title")
                        .innerText.toLowerCase();

                if(title.includes(value)){

                    card.parentElement.style.display="block";

                }else{

                    card.parentElement.style.display="none";

                }

            });

    });

    function toggleFavorite(bookId,button){


        fetch("favorite",{

            method:"POST",

            headers:{

                "Content-Type":
                    "application/x-www-form-urlencoded"

            },


            body:

                "book_id="+bookId


        })


            .then(response=>response.json())


            .then(data=>{


                if(data.status==="login"){


                    alert("Please Login First");


                    return;

                }



                let icon =
                    button.querySelector("i");



                if(data.favorite){


                    icon.classList.remove(
                        "bi-heart"
                    );


                    icon.classList.add(
                        "bi-heart-fill",
                        "active-heart"
                    );


                }

                else{


                    icon.classList.remove(
                        "bi-heart-fill",
                        "active-heart"
                    );


                    icon.classList.add(
                        "bi-heart"
                    );


                }



            })


            .catch(error=>{

                console.log(error);

            });


    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>