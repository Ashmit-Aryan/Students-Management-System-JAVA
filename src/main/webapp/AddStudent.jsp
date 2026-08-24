<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Student - Student Management System</title>


    <!-- Bootstrap CSS -->

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


        /* ================= SIDEBAR ================= */

        .sidebar {
            min-height: 100vh;
            background-color: #212529;
        }

        .sidebar-brand {
            color: white;
            font-size: 20px;
            font-weight: 600;
        }

        .sidebar .nav-link {
            color: #adb5bd;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 5px;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: #343a40;
            color: white;
        }


        /* ================= FORM CARD ================= */

        .form-card {
            border: none;
            border-radius: 12px;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control,
        .form-select {
            padding: 10px 12px;
        }

        .form-control:focus,
        .form-select:focus {
            box-shadow: 0 0 0 0.2rem
                        rgba(13, 110, 253, 0.15);
        }


        /* ================= HEADER ================= */

        .page-header {
            margin-bottom: 25px;
        }

        .page-title {
            font-weight: 700;
        }

        .page-description {
            color: #6c757d;
        }


        /* ================= SECTION ================= */

        .section-title {
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .required {
            color: #dc3545;
        }

    </style>

</head>


<body>


<div class="container-fluid">

    <div class="row">


        <!-- ================================================= -->
        <!-- SIDEBAR -->
        <!-- ================================================= -->

        <div class="col-md-3 col-lg-2 px-3 py-4 sidebar">


            <!-- BRAND -->

            <div class="sidebar-brand mb-4">

                <i class="bi bi-mortarboard-fill"></i>

                Student Management

            </div>


            <!-- NAVIGATION -->

            <ul class="nav flex-column">


                <!-- Dashboard -->

                <li class="nav-item">

                    <a
                        href="<%= request.getContextPath() %>/Dashboard"
                        class="nav-link">

                        <i class="bi bi-speedometer2 me-2"></i>

                        Dashboard

                    </a>

                </li>


                <!-- Students -->

                <li class="nav-item">

                    <a
                        href="<%= request.getContextPath() %>/AllStudentsServlet"
                        class="nav-link">

                        <i class="bi bi-people me-2"></i>

                        Students

                    </a>

                </li>


                <!-- Add Student -->

                <li class="nav-item">

                    <a
                        href="<%= request.getContextPath() %>/AddStudentServlet"
                        class="nav-link active">

                        <i class="bi bi-person-plus me-2"></i>

                        Add Student

                    </a>

                </li>


                <!-- Settings -->

                <li class="nav-item mt-3">

                    <a
                        href="#"
                        class="nav-link">

                        <i class="bi bi-gear me-2"></i>

                        Settings

                    </a>

                </li>


                <!-- Logout -->

                <li class="nav-item">

                    <a
                        href="<%= request.getContextPath() %>/logout"
                        class="nav-link text-danger">

                        <i class="bi bi-box-arrow-right me-2"></i>

                        Logout

                    </a>

                </li>


            </ul>

        </div>



        <!-- ================================================= -->
        <!-- MAIN CONTENT -->
        <!-- ================================================= -->

        <main class="col-md-9 col-lg-10 px-md-4 py-4">


            <!-- ================================================= -->
            <!-- PAGE HEADER -->
            <!-- ================================================= -->

            <div class="page-header">


                <div class="d-flex
                            justify-content-between
                            align-items-center">


                    <div>

                        <h2 class="page-title mb-1">

                            Add Student

                        </h2>


                        <p class="page-description mb-0">

                            Add a new student to the system

                        </p>

                    </div>


                    <a
                        href="<%= request.getContextPath() %>/AllStudentsServlet"
                        class="btn btn-outline-secondary">

                        <i class="bi bi-arrow-left me-2"></i>

                        Back to Students

                    </a>


                </div>

            </div>



            <!-- ================================================= -->
            <!-- FORM CARD -->
            <!-- ================================================= -->

            <div class="card shadow-sm form-card">

                <div class="card-body p-4 p-lg-5">


                    <!-- FORM TITLE -->

                    <div class="mb-4">

                        <h5 class="section-title">

                            Student Information

                        </h5>

                        <p class="text-muted small">

                            Enter the student's details below.

                            Fields marked with
                            <span class="required">*</span>
                            are required.

                        </p>

                    </div>



                    <!-- ================================================= -->
                    <!-- FORM -->
                    <!-- ================================================= -->

                    <form
                       
                        method="post"
                        action="./AddStudentServlet">


                        <!-- ACTION -->

                        <input
                            type="hidden"
                            name="action"
                            value="insert">



                        <!-- ================================================= -->
                        <!-- NAME + EMAIL -->
                        <!-- ================================================= -->

                        <div class="row g-4 mb-4">


                            <!-- NAME -->

                            <div class="col-md-6">

                                <label
                                    for="name"
                                    class="form-label">

                                    Name

                                    <span class="required">*</span>

                                </label>


                                <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    name="name"
                                    placeholder="Enter student's full name"
                                    required>


                            </div>



                            <!-- EMAIL -->

                            <div class="col-md-6">

                                <label
                                    for="email"
                                    class="form-label">

                                    Email

                                    <span class="required">*</span>

                                </label>


                                <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    name="email"
                                    placeholder="student@example.com"
                                    required>


                            </div>


                        </div>



                        <!-- ================================================= -->
                        <!-- PHONE + AGE -->
                        <!-- ================================================= -->

                        <div class="row g-4 mb-4">


                            <!-- PHONE -->

                            <div class="col-md-6">

                                <label
                                    for="phone"
                                    class="form-label">

                                    Phone

                                    <span class="required">*</span>

                                </label>


                                <input
                                    type="tel"
                                    class="form-control"
                                    id="phone"
                                    name="phone"
                                    placeholder="Enter 10-digit phone number"
                                    pattern="[0-9]{10}"
                                    maxlength="10"
                                    required>


                                <div class="form-text">

                                    Enter a 10-digit phone number.

                                </div>


                            </div>



                            <!-- AGE -->

                            <div class="col-md-6">

                                <label
                                    for="age"
                                    class="form-label">

                                    Age

                                    <span class="required">*</span>

                                </label>


                                <input
                                    type="number"
                                    class="form-control"
                                    id="age"
                                    name="age"
                                    placeholder="Enter age"
                                    min="15"
                                    max="100"
                                    required>


                            </div>


                        </div>



                        <!-- ================================================= -->
                        <!-- COURSE + BATCH -->
                        <!-- ================================================= -->

                        <div class="row g-4 mb-4">


                            <!-- COURSE -->

                            <div class="col-md-6">

                                <label
                                    for="course"
                                    class="form-label">

                                    Course

                                    <span class="required">*</span>

                                </label>


                                <select
                                    class="form-select"
                                    id="course"
                                    name="course"
                                    required>


                                    <option
                                        value=""
                                        selected
                                        disabled>

                                        Select Course

                                    </option>


                                    <option value="B_TECH">

                                        B. Tech

                                    </option>


                                    <option value="BBA">

                                        BBA

                                    </option>


                                    <option value="B_COM">

                                        B.Com

                                    </option>


                                    <option value="BJMC">

                                        BJMC

                                    </option>


                                    <option value="BCA">

                                        BCA

                                    </option>


                                </select>


                            </div>



                            <!-- BATCH -->

                            <div class="col-md-6">

                                <label
                                    for="batch"
                                    class="form-label">

                                    Batch

                                    <span class="required">*</span>

                                </label>


                                <select
                                    class="form-select"
                                    id="batch"
                                    name="batch"
                                    required>


                                    <option
                                        value=""
                                        selected
                                        disabled>

                                        Select Batch

                                    </option>


                                    <option value="2022-2026">

                                        2022 - 2026

                                    </option>


                                    <option value="2023-2027">

                                        2023 - 2027

                                    </option>


                                    <option value="2024-2028">

                                        2024 - 2028

                                    </option>


                                    <option value="2025-2029">

                                        2025 - 2029

                                    </option>


                                    <option value="2026-2030">

                                        2026 - 2030

                                    </option>


                                    <option value="2027-2031">

                                        2027 - 2031

                                    </option>


                                </select>


                            </div>


                        </div>



                        <!-- ================================================= -->
                        <!-- DIVIDER -->
                        <!-- ================================================= -->

                        <hr class="my-4">



                        <!-- ================================================= -->
                        <!-- BUTTONS -->
                        <!-- ================================================= -->

                        <div class="d-flex
                                    justify-content-end
                                    gap-2">


                            <a
                                href="<%= request.getContextPath() %>/Dashboard"
                                class="btn btn-light border">

                                Cancel

                            </a>


                            <button
                                type="reset"
                                class="btn btn-outline-secondary">

                                <i class="bi bi-arrow-counterclockwise me-1"></i>

                                Reset

                            </button>


                            <button
                                type="submit"
                                class="btn btn-primary px-4">

                                <i class="bi bi-person-plus me-2"></i>

                                Add Student

                            </button>


                        </div>


                    </form>


                </div>

            </div>


        </main>


    </div>

</div>



<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>