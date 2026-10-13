<!DOCTYPE html>

<html>

<head>

    <title>Contact Us - BookVerse</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


    <style>


        body{

            background:#f4f7fb;
            font-family:'Segoe UI',sans-serif;

        }



        .contact-card{

            border:none;

            border-radius:25px;

            box-shadow:0 15px 40px rgba(0,0,0,.12);

            background:white;

        }



        .title-icon{

            width:70px;

            height:70px;

            background:#1e3a8a;

            color:white;

            border-radius:50%;

            display:flex;

            align-items:center;

            justify-content:center;

            font-size:35px;

            margin:auto;

        }



        .form-control{

            border-radius:15px;

            padding:12px;

            border:1px solid #ddd;

        }



        .form-control:focus{

            border-color:#2563eb;

            box-shadow:0 0 0 .2rem rgba(37,99,235,.15);

        }



        .btn-contact{

            background:#1e3a8a;

            color:white;

            border-radius:30px;

            padding:12px;

            font-weight:600;

        }



        .btn-contact:hover{

            background:#2563eb;

            color:white;

        }



        .reply-card{

            background:#f8fafc;

            border-radius:20px;

            padding:20px;

            border-left:5px solid #2563eb;

        }



        .reply-icon{

            font-size:25px;

            color:#2563eb;

        }



    </style>


</head>


<body>



<div class="container py-5">


    <div class="row justify-content-center">


        <div class="col-lg-7">



            <div class="card contact-card p-5">



                <div class="title-icon mb-3">

                    <i class="bi bi-envelope-paper-fill"></i>

                </div>



                <h2 class="text-center fw-bold text-primary">

                    Contact BookVerse

                </h2>



                <p class="text-center text-muted mb-4">

                    Need help? Send your message and our team will reply soon.

                </p>




                <form action="contact" method="post">



                    <div class="mb-3">

                        <label class="fw-semibold">

                            Name

                        </label>

                        <input class="form-control"
                               name="name"
                               placeholder="Enter your name"
                               required>

                    </div>




                    <div class="mb-3">

                        <label class="fw-semibold">

                            Email

                        </label>


                        <input class="form-control"
                               name="email"
                               type="email"
                               placeholder="Enter email address"
                               required>


                    </div>




                    <div class="mb-3">

                        <label class="fw-semibold">

                            Subject

                        </label>


                        <input class="form-control"
                               name="subject"
                               placeholder="Message subject"
                               required>


                    </div>




                    <div class="mb-3">

                        <label class="fw-semibold">

                            Message

                        </label>


                        <textarea class="form-control"
                                  name="message"
                                  rows="5"
                                  placeholder="Write your message..."
                                  required></textarea>


                    </div>




                    <button class="btn btn-contact w-100">

                        <i class="bi bi-send-fill"></i>

                        Send Message

                    </button>



                </form>





                <hr class="my-4">





                <div class="reply-card">


                    <div class="d-flex align-items-center">


                        <div class="reply-icon me-3">

                            <i class="bi bi-chat-left-text-fill"></i>

                        </div>


                        <div>

                            <h5 class="mb-1 fw-bold">

                                Admin Replies

                            </h5>


                            <p class="text-muted mb-0">

                                Check responses from BookVerse support team

                            </p>


                        </div>


                    </div>




                    <a href="myMessages"
                       class="btn btn-outline-primary rounded-pill mt-3 w-100">


                        <i class="bi bi-envelope-open-fill"></i>

                        View Reply Messages


                    </a>


                </div>




            </div>


        </div>


    </div>


</div>


</body>

</html>