<%@page import="model.BookBean"%>

<%

    BookBean b =
            (BookBean)request.getAttribute("book");

%>


<!DOCTYPE html>

<html>

<head>

    <title>Edit Book</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


</head>


<body class="bg-light">


<div class="container mt-5">


    <div class="card p-5 shadow">


        <h2>
            Edit Book
        </h2>



        <form action="updateBook"
              method="post">



            <input type="hidden"
                   name="id"
                   value="<%=b.getId()%>">



            <input class="form-control mb-3"
                   name="title"
                   value="<%=b.getTitle()%>">



            <input class="form-control mb-3"
                   name="isbn"
                   value="<%=b.getIsbn()%>">



            <input class="form-control mb-3"
                   name="publish_year"
                   value="<%=b.getPublish_year()%>">



            <textarea class="form-control mb-3"
                      name="description">

<%=b.getDescription()%>

</textarea>



            <input class="form-control mb-3"
                   name="quantity"
                   value="<%=b.getQuantity()%>">



            <select name="status"
                    class="form-control mb-3">


                <option>
                    AVAILABLE
                </option>


                <option>
                    NOT_AVAILABLE
                </option>


            </select>



            <button class="btn btn-primary">

                Update Book

            </button>



        </form>



    </div>


</div>


</body>

</html>