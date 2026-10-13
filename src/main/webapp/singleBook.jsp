<%@page import="model.BookBean"%>

<%

    BookBean b =
            (BookBean)request.getAttribute("book");


    if(b==null){

        response.sendRedirect("home.jsp");
        return;

    }

%>


<!DOCTYPE html>

<html>

<head>


    <title>
        <%=b.getTitle()%>
    </title>



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

            color:white;
            font-size:28px;
            font-weight:bold;

        }



        .card{

            border:none;
            border-radius:25px;
            box-shadow:0 15px 40px rgba(0,0,0,.1);

        }



        .book-image{


            width:100%;
            height:520px;
            object-fit:cover;
            border-radius:20px;


        }



        .title{

            font-size:42px;
            font-weight:700;
            color:#1f2937;

        }



        .description{

            color:#6b7280;
            line-height:1.8;

        }



        .info-box{


            background:#f8fafc;
            padding:15px;
            border-radius:15px;

        }



        .available{

            color:green;
            font-weight:bold;

        }



        .btn-borrow{


            background:#2563eb;
            color:white;
            border-radius:30px;
            padding:12px 30px;


        }



        .btn-borrow:hover{


            background:#1d4ed8;
            color:white;


        }



        .favorite{


            border:none;
            background:#ef4444;
            color:white;
            border-radius:30px;
            padding:12px 25px;


        }



        select{


            border-radius:20px;
            padding:10px;

        }



    </style>


</head>



<body>


<!-- Navbar -->


<nav class="navbar navbar-expand-lg">


    <div class="container">


        <a class="navbar-brand">

            <i class="bi bi-book-half"></i>

            BookVerse

        </a>


    </div>


</nav>





<div class="container mt-5 mb-5">



    <div class="card p-5">



        <div class="row">





            <!-- IMAGE -->


            <div class="col-md-5">


                <img src="<%=request.getContextPath()%>/images/<%=b.getImage()%>"
                     class="book-image">




            </div>






            <!-- DETAILS -->


            <div class="col-md-7">


                <h1 class="title">

                    <%=b.getTitle()%>

                </h1>




                <p class="text-muted">

                    <i class="bi bi-upc"></i>

                    ISBN :

                    <%=b.getIsbn()%>


                </p>





                <span class="badge bg-primary p-2">


<i class="bi bi-calendar"></i>

Year :

<%=b.getPublish_year()%>


</span>






                <h4 class="mt-4">

                    Description

                </h4>



                <p class="description">


                    <%=b.getDescription()%>


                </p>






                <div class="info-box mt-4">



                    <h5>


                        Available Copies :

                        <span class="available">

<%=b.getAvailable()%>

</span>


                    </h5>





                    <h5>


                        Status :

                        <span class="badge bg-success">

<%=b.getStatus()%>

</span>


                    </h5>



                </div>









                <!-- ACTIONS -->


                <div class="mt-5">





                    <button class="favorite me-3">


                        <i class="bi bi-heart"></i>

                        Add Favorite


                    </button>







                    <form action="<%=request.getContextPath()%>/borrow"
                          method="post"
                          class="mt-4">





                        <input type="hidden"
                               name="book_id"
                               value="<%=b.getId()%>">





                        <label class="fw-bold">

                            Borrow Period

                        </label>




                        <select name="period"
                                class="form-select mt-2 w-50">


                            <option value="7">

                                7 Days

                            </option>



                            <option value="14">

                                14 Days

                            </option>



                            <option value="30">

                                30 Days

                            </option>



                        </select>








                        <form action="BorrowServlet" method="post">

                            <input type="hidden"
                                   name="book_id"
                                   value="<%=b.getId()%>">

                            <button class="btn btn-primary">
                                Borrow
                            </button>

                        </form>





                    </form>







                </div>







            </div>






        </div>


    </div>


</div>





<footer class="bg-dark text-white text-center p-4">


    <h5>

        BookVerse Library

    </h5>


    <p>

        Read. Learn. Grow.

    </p>


</footer>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


</body>


</html>