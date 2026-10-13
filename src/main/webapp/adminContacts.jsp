<%@page import="java.util.ArrayList"%>
<%@page import="model.ContactBean"%>


<!DOCTYPE html>

<html>

<head>

    <title>Manage Contact Messages - Admin</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            background:#f4f7fb;

            font-family:'Segoe UI',sans-serif;

        }



        .container-box{

            margin-top:50px;

        }



        .card-box{

            background:white;

            border:none;

            border-radius:25px;

            padding:30px;

            box-shadow:0 15px 35px rgba(0,0,0,.1);

        }



        .title{

            color:#1e3a8a;

            font-weight:700;

        }



        .contact-table{

            border-radius:15px;

            overflow:hidden;

        }



        .table thead{

            background:#1e3a8a;

            color:white;

        }



        .table tbody tr:hover{

            background:#f1f5ff;

        }



        .message-box{

            background:#f8fafc;

            padding:12px;

            border-radius:12px;

            max-width:250px;

        }



        .reply-area{

            min-width:250px;

        }



        .reply-text{

            border-radius:15px;

            resize:none;

        }



        .btn-reply{

            background:#1e3a8a;

            color:white;

            border-radius:30px;

            padding:10px 20px;

        }



        .btn-reply:hover{

            background:#2563eb;

            color:white;

        }



        .badge-msg{

            background:#2563eb;

        }



    </style>


</head>


<body>



<div class="container-fluid container-box px-5">



    <div class="card-box">



        <h2 class="title text-center mb-4">

            <i class="bi bi-envelope-paper-fill"></i>

            Customer Messages

        </h2>




        <div class="table-responsive">



            <table class="table table-hover align-middle contact-table">



                <thead>


                <tr>


                    <th>ID</th>

                    <th>User</th>

                    <th>Email</th>

                    <th>Subject</th>

                    <th>Message</th>

                    <th>Admin Reply</th>


                </tr>


                </thead>



                <tbody>



                <%


                    ArrayList<ContactBean> list =
                            (ArrayList<ContactBean>)
                                    request.getAttribute("contacts");



                    if(list != null){



                        for(ContactBean c:list){



                %>



                <tr>



                    <td>

<span class="badge badge-msg">

<%=c.getId()%>

</span>

                    </td>




                    <td>

                        <strong>

                            <%=c.getName()%>

                        </strong>

                    </td>




                    <td>

                        <%=c.getEmail()%>

                    </td>




                    <td>

                        <%=c.getSubject()%>

                    </td>




                    <td>


                        <div class="message-box">

                            <i class="bi bi-chat-left-text text-primary"></i>

                            <br>

                            <%=c.getMessage()%>


                        </div>


                    </td>





                    <td class="reply-area">



                        <form action="replyContact"
                              method="post">



                            <input type="hidden"
                                   name="contact_id"
                                   value="<%=c.getId()%>">





                            <textarea name="reply"
                                      class="form-control reply-text mb-3"
                                      rows="4"
                                      placeholder="Write reply to user..."
                                      required></textarea>




                            <button class="btn btn-reply w-100">


                                <i class="bi bi-send-fill"></i>

                                Send Reply


                            </button>



                        </form>



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



</body>

</html>