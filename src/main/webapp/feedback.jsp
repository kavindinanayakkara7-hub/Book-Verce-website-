<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Send Feedback | BookVerse</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <style>

        body{
            background:#f5f7fb;
        }


        .feedback-card{

            max-width:700px;
            margin:auto;
            border:none;
            border-radius:20px;
            box-shadow:0 10px 30px rgba(0,0,0,.1);

        }


        .card-header{

            background:#0d6efd;
            color:white;
            padding:25px;
            border-radius:20px 20px 0 0 !important;

        }


        .card-header h3{

            margin:0;
            font-weight:700;

        }


        .form-control{

            border-radius:12px;
            padding:12px 15px;

        }


        .form-control:focus{

            box-shadow:0 0 0 .2rem rgba(13,110,253,.15);
            border-color:#0d6efd;

        }


        textarea{

            resize:none;

        }


        .btn-submit{

            background:#0d6efd;
            color:white;
            border-radius:12px;
            padding:12px 35px;
            font-weight:600;
            transition:.3s;

        }


        .btn-submit:hover{

            background:#084298;
            color:white;
            transform:translateY(-2px);

        }


        .feedback-icon{

            font-size:45px;

        }

    </style>


</head>


<body>


<div class="container py-5">


    <div class="card feedback-card">


        <div class="card-header text-center">


            <div class="feedback-icon">

                <i class="bi bi-chat-square-heart-fill"></i>

            </div>


            <h3>
                Share Your Feedback
            </h3>


            <p class="mb-0">

                Your feedback helps us improve BookVerse

            </p>


        </div>



        <div class="card-body p-4">


            <form action="addFeedback" method="post">



                <div class="mb-4">


                    <label class="form-label fw-semibold">

                        <i class="bi bi-pencil-square text-primary"></i>

                        Subject

                    </label>


                    <input type="text"
                           class="form-control"
                           name="subject"
                           placeholder="Enter feedback subject"
                           required>


                </div>





                <div class="mb-4">


                    <label class="form-label fw-semibold">


                        <i class="bi bi-chat-left-text text-primary"></i>

                        Message


                    </label>


                    <textarea class="form-control"
                              name="message"
                              rows="6"
                              placeholder="Write your feedback here..."
                              required></textarea>


                </div>




                <div class="text-center">


                    <button type="submit"
                            class="btn btn-submit">


                        <i class="bi bi-send-fill"></i>

                        Submit Feedback


                    </button>


                </div>




            </form>


        </div>


    </div>


</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>