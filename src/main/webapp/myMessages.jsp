<%@page import="java.util.ArrayList"%>
<%@page import="model.ContactReplyBean"%>


<!DOCTYPE html>

<html>

<head>

    <title>My Messages - BookVerse</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            background:#f4f7fb;

            font-family:'Segoe UI',sans-serif;

        }



        .message-container{

            margin-top:60px;

        }



        .message-card{

            border:none;

            border-radius:25px;

            background:white;

            box-shadow:0 10px 30px rgba(0,0,0,.1);

            padding:30px;

        }



        .page-title{

            color:#1e3a8a;

            font-weight:700;

        }



        .reply-box{

            background:#f8fafc;

            border-radius:20px;

            padding:20px;

            border-left:5px solid #2563eb;

            transition:.3s;

        }



        .reply-box:hover{

            transform:translateY(-5px);

            box-shadow:0 10px 25px rgba(0,0,0,.08);

        }



        .reply-icon{

            width:50px;

            height:50px;

            background:#2563eb;

            color:white;

            border-radius:50%;

            display:flex;

            justify-content:center;

            align-items:center;

            font-size:22px;

        }



        .date-text{

            color:#6b7280;

            font-size:14px;

        }



        .empty-box{

            text-align:center;

            padding:50px;

            color:#6b7280;

        }



        .btn-back{

            border-radius:30px;

        }



    </style>


</head>


<body>



<div class="container message-container">


    <div class="row justify-content-center">


        <div class="col-lg-8">



            <div class="message-card">



                <h2 class="page-title text-center mb-4">

                    <i class="bi bi-chat-left-text-fill"></i>

                    My Reply Messages

                </h2>





                <%

                    ArrayList<ContactReplyBean> list =
                            (ArrayList<ContactReplyBean>)
                                    request.getAttribute("replies");



                    if(list != null && !list.isEmpty()){



                        for(ContactReplyBean r:list){



                %>





                <div class="reply-box mb-4">



                    <div class="d-flex align-items-start">


                        <div class="reply-icon me-3">

                            <i class="bi bi-envelope-open-fill"></i>

                        </div>



                        <div class="flex-grow-1">


                            <h5 class="fw-bold text-primary">

                                BookVerse Support Reply

                            </h5>



                            <p class="mb-3">

                                <%=r.getAdmin_reply()%>

                            </p>



                            <p class="date-text mb-0">

                                <i class="bi bi-calendar-event"></i>

                                <%=r.getReply_date()%>

                            </p>



                        </div>



                    </div>



                </div>





                <%

                    }


                }else{


                %>



                <div class="empty-box">


                    <i class="bi bi-chat-square-dots"
                       style="font-size:50px;color:#2563eb;"></i>


                    <h4 class="mt-3">

                        No Replies Yet

                    </h4>


                    <p>

                        Your messages will appear here after admin replies.

                    </p>



                </div>



                <%

                    }

                %>




                <a href="contact.jsp"
                   class="btn btn-outline-primary btn-back w-100 mt-3">


                    <i class="bi bi-arrow-left"></i>

                    Back to Contact


                </a>




            </div>


        </div>


    </div>


</div>



</body>

</html>