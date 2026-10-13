<%@page import="java.util.ArrayList"%>
<%@page import="model.BookBean"%>


<!DOCTYPE html>

<html>

<head>


    <title>
        Manage Books - BookVerse Admin
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



        .sidebar{

            min-height:100vh;
            background:white;
            padding:25px;
            box-shadow:0 0 20px rgba(0,0,0,.08);

        }



        .logo{

            font-size:28px;
            font-weight:bold;
            color:#2563eb;

        }



        .sidebar a{

            display:block;
            padding:12px;
            margin-top:10px;
            text-decoration:none;
            color:#374151;
            border-radius:12px;

        }



        .sidebar a:hover{

            background:#2563eb;
            color:white;

        }




        .card{

            border:none;
            border-radius:20px;
            box-shadow:0 10px 30px rgba(0,0,0,.08);

        }



        .book-img{

            width:70px;
            height:90px;
            object-fit:cover;
            border-radius:10px;

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



            <a href="admin.jsp">

                <i class="bi bi-speedometer2"></i>

                Dashboard

            </a>



            <a href="addBook">

                <i class="bi bi-plus-circle"></i>

                Add Book

            </a>



            <a href="manageBooks">

                <i class="bi bi-book"></i>

                Manage Books

            </a>



            <a href="users.jsp">

                <i class="bi bi-people"></i>

                Users

            </a>



            <a href="logout"
               class="text-danger">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>



        </div>









        <!-- Content -->


        <div class="col-md-9 p-5">



            <div class="d-flex justify-content-between">


                <h1>

                    Manage Books

                </h1>



                <a href="addBook"
                   class="btn btn-primary">


                    <i class="bi bi-plus"></i>

                    Add New Book


                </a>



            </div>







            <div class="card mt-4 p-4">





                <table class="table table-hover align-middle">


                    <thead class="table-primary">


                    <tr>


                        <th>
                            Image
                        </th>


                        <th>
                            Title
                        </th>


                        <th>
                            ISBN
                        </th>


                        <th>
                            Year
                        </th>


                        <th>
                            Quantity
                        </th>


                        <th>
                            Available
                        </th>


                        <th>
                            Status
                        </th>


                        <th>
                            Action
                        </th>


                    </tr>


                    </thead>






                    <tbody>



                    <%


                        ArrayList<BookBean> books =

                                (ArrayList<BookBean>)
                                        request.getAttribute("books");



                        if(books != null){


                            for(BookBean b:books){



                    %>





                    <tr>



                        <td>


                            <img src="<%=request.getContextPath()%>/<%=b.getImage()%>"
                                 class="book-img">


                        </td>





                        <td>


                            <strong>

                                <%=b.getTitle()%>

                            </strong>


                            <br>


                            <small class="text-muted">

                                <%=b.getDescription()%>

                            </small>


                        </td>





                        <td>

                            <%=b.getIsbn()%>

                        </td>




                        <td>

                            <%=b.getPublish_year()%>

                        </td>




                        <td>

                            <%=b.getQuantity()%>

                        </td>




                        <td>

<span class="badge bg-success">

<%=b.getAvailable()%>

</span>


                        </td>





                        <td>


                            <%

                                if(b.getStatus().equals("AVAILABLE")){

                            %>


                            <span class="badge bg-success">

AVAILABLE

</span>


                            <%

                            }else{

                            %>


                            <span class="badge bg-danger">

NOT AVAILABLE

</span>


                            <%

                                }

                            %>



                        </td>






                        <td>



                            <a href="editBook?id=<%=b.getId()%>"
                               class="btn btn-warning btn-sm">


                                <i class="bi bi-pencil"></i>


                            </a>






                            <a href="deleteBook?id=<%=b.getId()%>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Delete this book?')">


                                <i class="bi bi-trash"></i>


                            </a>



                        </td>



                    </tr>





                    <%


                            }


                        }


                    %>





                    </tbody>


                </table>






            </div>






        </div>



    </div>


</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


</body>


</html>