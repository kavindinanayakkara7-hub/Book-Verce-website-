<%@page import="model.BookBean"%>

<!DOCTYPE html>
<html>

<head>

    <title>Borrow Book</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body{

            background:#f4f7fb;

            font-family:'Segoe UI';

        }

        .card{

            border-radius:20px;

            box-shadow:0 10px 25px rgba(0,0,0,.1);

        }


        .book-img{

            height:300px;

            object-fit:cover;

            border-radius:15px;

        }


    </style>

</head>


<body>


<div class="container mt-5">


    <div class="card p-4">


        <h2 class="text-center mb-4">

            Borrow Book

        </h2>



        <%

            BookBean book =
                    (BookBean)request.getAttribute("book");

        %>



        <div class="row">


            <div class="col-md-5">


                <img src="<%=request.getContextPath()%>/<%=book.getImage()%>"
                     class="img-fluid book-img">


            </div>



            <div class="col-md-7">


                <h2>

                    <%=book.getTitle()%>

                </h2>


                <p>

                    <%=book.getDescription()%>

                </p>


                <h5>

                    Available Copies :

                    <%=book.getAvailable()%>

                </h5>



                <form action="borrowBook"
                      method="post">


                    <input type="hidden"
                           name="book_id"
                           value="<%=book.getId()%>">



                    <label class="mt-3">

                        Borrow Period

                    </label>


                    <select name="period"
                            class="form-select">


                        <option value="7">

                            7 Days

                        </option>


                        <option value="14">

                            14 Days

                        </option>


                        <option value="30">

                            30 Days

                        </option>


                        <option value="60">

                            60 Days

                        </option>


                    </select>




                    <button class="btn btn-primary w-100 mt-4">

                        <i class="bi bi-book"></i>

                        Confirm Borrow

                    </button>


                </form>


            </div>


        </div>



    </div>


</div>


</body>


</html>