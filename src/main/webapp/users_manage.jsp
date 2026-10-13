<%@page import="java.util.ArrayList"%>
<%@page import="model.UserBean"%>


<html>

<head>

    <title>
        Manage Users
    </title>


    <link href=
                  "https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


</head>


<body>


<div class="container mt-5">


    <h2>
        Manage Users
    </h2>


    <table class="table table-bordered">


        <tr class="table-dark">

            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
            <th>Action</th>

        </tr>



        <%

            ArrayList<UserBean> list =
                    (ArrayList<UserBean>)
                            request.getAttribute("users");


            for(UserBean u:list){

        %>


        <tr>


            <td>
                <%=u.getId()%>
            </td>


            <td>
                <%=u.getFirstName()%>

                <%=u.getLastName()%>
            </td>


            <td>
                <%=u.getEmail()%>
            </td>


            <td>
                <%=u.getPhone()%>
            </td>


            <td>
                <%=u.getRole()%>
            </td>


            <td>
                <%=u.getStatus()%>
            </td>


            <td>


                <a href="updateUserStatus?id=<%=u.getId()%>&status=ACTIVE"
                   class="btn btn-success btn-sm">

                    Activate

                </a>



                <a href="updateUserStatus?id=<%=u.getId()%>&status=INACTIVE"
                   class="btn btn-warning btn-sm">

                    Block

                </a>



                <a href="deleteUser?id=<%=u.getId()%>"
                   class="btn btn-danger btn-sm">

                    Delete

                </a>


            </td>


        </tr>


        <%

            }

        %>


    </table>


</div>


</body>

</html>