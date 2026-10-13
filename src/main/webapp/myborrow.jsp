<%@page import="java.util.ArrayList"%>
<%@page import="model.BorrowBean"%>


<!DOCTYPE html>
<html>

<head>

    <title>
        My Borrow Books
    </title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


</head>


<body class="bg-light">


<div class="container mt-5">


    <h2>
        My Borrow Books
    </h2>



    <table class="table table-striped shadow mt-4">


        <tr>

            <th>
                Book
            </th>

            <th>
                Borrow Date
            </th>


            <th>
                Due Date
            </th>


            <th>
                Status
            </th>


        </tr>



        <%

            ArrayList<BorrowBean> list =
                    (ArrayList<BorrowBean>)
                            request.getAttribute("borrowList");



            if(list!=null){


                for(BorrowBean b:list){


        %>


        <tr>


            <td>

                <%=b.getBookTitle()%>

            </td>



            <td>

                <%=b.getBorrowDate()%>

            </td>



            <td>

                <%=b.getDueDate()%>

            </td>



            <td>

<span class="badge bg-success">

<%=b.getStatus()%>

</span>

            </td>



        </tr>



        <%


                }

            }


        %>


    </table>



</div>


</body>


</html>