<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Sign Up - Student Management System</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Bootstrap Icons -->

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <style>

        body {
            background-color: #f5f6fa;
        }


        .signup-container {
            min-height: 100vh;
        }


        .signup-card {
            border: none;
            border-radius: 15px;
        }


        .signup-icon {

            width: 65px;
            height: 65px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin: auto;

            border-radius: 50%;

            background-color: #e7f1ff;

            color: #0d6efd;

            font-size: 28px;
        }


        .form-control {

            padding: 11px 14px;

        }


        .form-control:focus {

            border-color: #86b7fe;

            box-shadow:
                0 0 0 0.2rem
                rgba(13, 110, 253, .15);

        }

    </style>

</head>


<body>


<div class="container">

    <div class="row
                justify-content-center
                align-items-center
                signup-container">


        <div class="col-md-7 col-lg-5">


            <div class="card
                        shadow-sm
                        signup-card">


                <div class="card-body p-4 p-md-5">


                    <!-- ========================= -->
                    <!-- ICON -->
                    <!-- ========================= -->

                    <div class="signup-icon mb-3">

                        <i class="bi bi-person-plus-fill"></i>

                    </div>


                    <!-- ========================= -->
                    <!-- TITLE -->
                    <!-- ========================= -->

                    <div class="text-center mb-4">

                        <h3 class="fw-bold">

                            Create Account

                        </h3>


                        <p class="text-muted mb-0">

                            Register for Student Management System

                        </p>

                    </div>



                    <!-- ========================= -->
                    <!-- ERROR -->
                    <!-- ========================= -->

                    <%

                        String error =
                            (String) request.getAttribute("error");


                        if (error != null) {

                    %>


                        <div class="alert alert-danger">

                            <i class="bi bi-exclamation-triangle me-2"></i>

                            <%= error %>

                        </div>


                    <%

                        }

                    %>



                    <!-- ========================= -->
                    <!-- SIGNUP FORM -->
                    <!-- ========================= -->

                    <form
                        action="./AuthServlet"
                        method="post">


                        <!-- ACTION -->

                        <input
                            type="hidden"
                            name="action"
                            value="signup">



                        <!-- USERNAME -->

                        <div class="mb-3">

                            <label
                                class="form-label fw-semibold">

                                Username

                            </label>


                            <div class="input-group">

                                <span
                                    class="input-group-text bg-white">

                                    <i class="bi bi-person"></i>

                                </span>


                                <input
                                    type="text"
                                    name="username"
                                    class="form-control"
                                    placeholder="Choose a username"
                                    required>

                            </div>

                        </div>



                        <!-- EMAIL -->

                        <div class="mb-3">

                            <label
                                class="form-label fw-semibold">

                                Email

                            </label>


                            <div class="input-group">

                                <span
                                    class="input-group-text bg-white">

                                    <i class="bi bi-envelope"></i>

                                </span>


                                <input
                                    type="email"
                                    name="email"
                                    class="form-control"
                                    placeholder="Enter your email"
                                    required>

                            </div>

                        </div>



                        <!-- PASSWORD -->

                        <div class="mb-3">

                            <label
                                class="form-label fw-semibold">

                                Password

                            </label>


                            <div class="input-group">

                                <span
                                    class="input-group-text bg-white">

                                    <i class="bi bi-lock"></i>

                                </span>


                                <input
                                    type="password"
                                    name="password"
                                    id="password"
                                    class="form-control"
                                    placeholder="Create a password"
                                    minlength="6"
                                    required>

                            </div>

                        </div>



                        <!-- CONFIRM PASSWORD -->

                        <div class="mb-4">

                            <label
                                class="form-label fw-semibold">

                                Confirm Password

                            </label>


                            <div class="input-group">

                                <span
                                    class="input-group-text bg-white">

                                    <i class="bi bi-shield-lock"></i>

                                </span>


                                <input
                                    type="password"
                                    name="confirmPassword"
                                    id="confirmPassword"
                                    class="form-control"
                                    placeholder="Confirm your password"
                                    minlength="6"
                                    required>

                            </div>

                        </div>



                        <!-- SIGNUP BUTTON -->

                        <button
                            type="submit"
                            class="btn btn-primary w-100 py-2">

                            <i class="bi bi-person-plus me-2"></i>

                            Create Account

                        </button>


                    </form>



                    <!-- ========================= -->
                    <!-- LOGIN LINK -->
                    <!-- ========================= -->

                    <div class="text-center mt-4">

                        <span class="text-muted">

                            Already have an account?

                        </span>


                        <a
                            href="<%= request.getContextPath() %>/login.jsp"
                            class="text-decoration-none fw-semibold">

                            Login

                        </a>

                    </div>


                </div>

            </div>


        </div>

    </div>

</div>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>