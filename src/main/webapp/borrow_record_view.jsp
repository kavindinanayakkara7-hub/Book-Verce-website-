<%@page import="java.util.ArrayList"%>
<%@page import="model.BorrowRecordBean"%>


<!DOCTYPE html>

<html>

<head>

    <title>
        Borrow Records
    </title>


    <link href=
                  "https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


</head>



<body class="bg-light">


<div class="container mt-5">


    <h2 class="mb-4">

        <i class="bi bi-clock-history"></i>

        Borrow Records

    </h2>



    <table class="table table-bordered table-striped">


        <thead class="table-dark">


        <tr>

            <th>ID</th>

            <th>User</th>

            <th>Book</th>

            <th>Borrow Date</th>

            <th>Due Date</th>

            <th>Return Date</th>

            <th>Status</th>

            <th>Action</th>


        </tr>


        </thead>



        <tbody>



        <%


            ArrayList<BorrowRecordBean> list =
                    (ArrayList<BorrowRecordBean>)
                            request.getAttribute("records");



            if(list != null && !list.isEmpty()){



                for(BorrowRecordBean br : list){


        %>



        <tr>


            <td>

                <%=br.getId()%>

            </td>



            <td>

                <%=br.getUsername()%>

            </td>



            <td>

                <%=br.getBook_title()%>

            </td>



            <td>

                <%=br.getBorrow_date()%>

            </td>



            <td>

                <%=br.getDue_date()%>

            </td>



            <td>



                <% if(br.getReturn_date()!=null){ %>


                <%=br.getReturn_date()%>


                <% }else{ %>


                -


                <% } %>



            </td>





            <td>


                <%

                    String status = br.getStatus();


                    if(status.equals("BORROWED")){


                %>


                <span class="badge bg-warning text-dark">

<%=status%>

</span>


                <%


                }else if(status.equals("RETURNED")){


                %>


                <span class="badge bg-success">

<%=status%>

</span>


                <%


                }else{


                %>


                <span class="badge bg-danger">

<%=status%>

</span>


                <%


                    }


                %>


            </td>





            <td>



                <%

                    if(!br.getStatus().equals("RETURNED")){


                %>



                <form action="returnBook" method="post">



                    <input type="hidden"
                           name="id"
                           value="<%=br.getId()%>">



                    <input type="date"
                           name="return_date"
                           class="form-control mb-2"
                           required>



                    <button type="submit"
                            class="btn btn-success btn-sm">


                        <i class="bi bi-check-circle"></i>

                        Return


                    </button>



                </form>



                <%


                }else{


                %>



            <td>

                <form action="ReturnServlet" method="post">

                    <input type="hidden"
                           name="borrow_id"
                           value="<%=br.getId()%>">

                    <input type="hidden"
                           name="book_id"
                           value="<%=br.getBook_id()%>">

                    <button class="btn btn-success">

                        Return

                    </button>

                </form>

            </td>



                <%


                    }


                %>



            </td>


        </tr>



        <%


            }


        }else{


        %>


        <tr>


            <td colspan="8" class="text-center">


                No Borrow Records Found


            </td>


        </tr>



        <%


            }


        %>



        </tbody>


    </table>


</div>


</body>


</html>