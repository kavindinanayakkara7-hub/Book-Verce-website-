<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Publish Announcement | BookVerse</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

        body{
            background:#f5f7fb;
        }

        .page-title{
            font-weight:700;
            color:#2c3e50;
        }

        .card{
            border:none;
            border-radius:18px;
            box-shadow:0 8px 25px rgba(0,0,0,.08);
        }

        .card-header{
            background:#0d6efd;
            color:white;
            font-size:22px;
            font-weight:600;
            border-radius:18px 18px 0 0 !important;
            padding:18px;
        }

        .form-control{
            border-radius:10px;
        }

        textarea{
            resize:none;
        }

        .btn-publish{
            background:#0d6efd;
            color:white;
            border-radius:10px;
            padding:10px 30px;
            font-weight:600;
        }

        .btn-publish:hover{
            background:#0b5ed7;
            color:white;
        }

        .btn-reset{
            border-radius:10px;
            padding:10px 30px;
        }

    </style>

</head>

<body>

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <h2 class="page-title mb-4">
                <i class="bi bi-megaphone-fill text-primary"></i>
                Publish Announcement
            </h2>

            <div class="card">

                <div class="card-header">

                    <i class="bi bi-bell-fill"></i>
                    New Announcement

                </div>

                <div class="card-body p-4">

                    <form action="addAnnouncement" method="post">

                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                <i class="bi bi-card-heading"></i>
                                Title
                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="title"
                                   placeholder="Enter announcement title"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                <i class="bi bi-chat-left-text"></i>
                                Message
                            </label>

                            <textarea class="form-control"
                                      name="message"
                                      rows="6"
                                      placeholder="Write your announcement..."
                                      required></textarea>

                        </div>

                        <div class="mb-4">

                            <label class="form-label fw-semibold">
                                <i class="bi bi-calendar-event"></i>
                                Publish Date
                            </label>

                            <input type="date"
                                   class="form-control"
                                   name="publish_date"
                                   required>

                        </div>

                        <div class="d-flex justify-content-end gap-2">

                            <button type="reset"
                                    class="btn btn-outline-secondary btn-reset">

                                <i class="bi bi-arrow-counterclockwise"></i>
                                Reset

                            </button>

                            <button type="submit"
                                    class="btn btn-publish">

                                <i class="bi bi-send-fill"></i>
                                Publish Announcement

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>