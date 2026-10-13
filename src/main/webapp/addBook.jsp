<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Category" %>
<%@ page import="model.Author" %>
<%@ page import="model.Publisher" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <title>BookVerse - Add Book</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <style>

        body{

            background:#f8fafc;

        }


        .card{

            border-radius:20px;

        }

        .form-control,
        .form-select{

            height:45px;

        }


        textarea{

            height:120px!important;

        }

    </style>


</head>


<body>


<div class="container mt-5">


    <div class="card shadow p-4">


        <h2 class="text-center mb-4">

            <i class="bi bi-book"></i>

            Add New Book

        </h2>




        <form action="addBook"
              method="post"
              enctype="multipart/form-data">



            <!-- TITLE -->

            <div class="mb-3">

                <label class="form-label">
                    Book Title
                </label>


                <input type="text"
                       name="title"
                       class="form-control"
                       required>

            </div>





            <!-- ISBN -->

            <div class="mb-3">

                <label class="form-label">
                    ISBN
                </label>


                <input type="text"
                       name="isbn"
                       class="form-control">

            </div>







            <div class="row">



                <!-- CATEGORY -->

                <div class="col-md-4 mb-3">


                    <label class="form-label">
                        Category
                    </label>



                    <select name="category_id"
                            class="form-select"
                            required>



                        <option value="">
                            Select Category
                        </option>



                        <%

                            ArrayList<Category> categories =
                                    (ArrayList<Category>)
                                            request.getAttribute("categories");


                            if(categories != null){


                                for(Category c : categories){


                        %>


                        <option value="<%=c.getId()%>">

                            <%=c.getName()%>

                        </option>


                        <%

                                }

                            }

                        %>


                    </select>


                </div>








                <!-- AUTHOR -->

                <div class="col-md-4 mb-3">


                    <label class="form-label">
                        Author
                    </label>



                    <select name="author_id"
                            class="form-select"
                            required>



                        <option value="">
                            Select Author
                        </option>



                        <%

                            ArrayList<Author> authors =
                                    (ArrayList<Author>)
                                            request.getAttribute("authors");


                            if(authors != null){


                                for(Author a : authors){


                        %>


                        <option value="<%=a.getId()%>">

                            <%=a.getName()%>

                        </option>


                        <%

                                }

                            }

                        %>


                    </select>


                </div>








                <!-- PUBLISHER -->

                <div class="col-md-4 mb-3">


                    <label class="form-label">
                        Publisher
                    </label>



                    <select name="publisher_id"
                            class="form-select"
                            required>



                        <option value="">
                            Select Publisher
                        </option>



                        <%

                            ArrayList<Publisher> publishers =
                                    (ArrayList<Publisher>)
                                            request.getAttribute("publishers");


                            if(publishers != null){


                                for(Publisher p : publishers){


                        %>


                        <option value="<%=p.getId()%>">

                            <%=p.getName()%>

                        </option>


                        <%

                                }

                            }

                        %>


                    </select>


                </div>



            </div>








            <div class="row">


                <!-- YEAR -->

                <div class="col-md-6 mb-3">


                    <label>
                        Publish Year
                    </label>


                    <input type="number"
                           name="publish_year"
                           class="form-control">

                </div>






                <!-- QUANTITY -->

                <div class="col-md-6 mb-3">


                    <label>
                        Quantity
                    </label>


                    <input type="number"
                           name="quantity"
                           class="form-control"
                           min="1"
                           required>

                </div>



            </div>








            <!-- IMAGE -->

            <div class="mb-3">


                <label>
                    Book Image
                </label>


                <input type="file"
                       name="image"
                       class="form-control"
                       accept="image/*"
                       required>


            </div>








            <!-- DESCRIPTION -->

            <div class="mb-3">


                <label>
                    Description
                </label>


                <textarea name="description"
                          class="form-control"></textarea>


            </div>







            <button class="btn btn-primary w-100">

                Save Book

            </button>




        </form>



    </div>


</div>



</body>


</html>