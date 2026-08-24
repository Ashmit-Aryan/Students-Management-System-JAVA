<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.ashmitaryan.Model.Students" %>

<%

    Students student =
            (Students) request.getAttribute("student");

%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Update Student - Student Management System</title>


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

        .profile-card {
            border: none;
            border-radius: 12px;
        }

        .student-avatar {
            width: 80px;
            height: 80px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background-color: #e9ecef;
            color: #495057;

            font-size: 32px;
            font-weight: 600;
        }

        .field-card {
            border: none;
            border-radius: 12px;
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


            <div class="sidebar-brand mb-4">

                <i class="bi bi-mortarboard-fill"></i>

                Student Management

            </div>


            <ul class="nav flex-column">


                <!-- Dashboard -->

                <li class="nav-item">

                    <a href="<%= request.getContextPath() %>/Dashboard"
                       class="nav-link">

                        <i class="bi bi-speedometer2 me-2"></i>

                        Dashboard

                    </a>

                </li>


                <!-- Students -->

                <li class="nav-item">

                    <a href="<%= request.getContextPath() %>/AllStudentsServlet"
                       class="nav-link active">

                        <i class="bi bi-people me-2"></i>

                        Students

                    </a>

                </li>


                <!-- Add Student -->

                <li class="nav-item">

                    <a href="<%= request.getContextPath() %>/AddStudentServlet"
                       class="nav-link">

                        <i class="bi bi-person-plus me-2"></i>

                        Add Student

                    </a>

                </li>


                <!-- Settings -->

                <li class="nav-item mt-3">

                    <a href="#"
                       class="nav-link">

                        <i class="bi bi-gear me-2"></i>

                        Settings

                    </a>

                </li>


                <!-- Logout -->

                <li class="nav-item">

                    <a href="<%= request.getContextPath() %>/logout"
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


            <!-- PAGE HEADER -->

            <div class="d-flex
                        justify-content-between
                        align-items-center
                        mb-4">


                <div>

                    <h2 class="fw-bold mb-1">

                        Update Student

                    </h2>

                    <p class="text-muted mb-0">

                        Update student information

                    </p>

                </div>


                <a
                    href="<%= request.getContextPath() %>/AllStudentsServlet"
                    class="btn btn-outline-secondary">

                    <i class="bi bi-arrow-left me-2"></i>

                    Back to Students

                </a>


            </div>



            <!-- ================================================= -->
            <!-- STUDENT PROFILE -->
            <!-- ================================================= -->

            <div class="card shadow-sm profile-card mb-4">

                <div class="card-body">


                    <div class="d-flex align-items-center">


                        <div class="student-avatar me-3">

                            <%= student.getName()
                                      .substring(0, 1)
                                      .toUpperCase() %>

                        </div>


                        <div>

                            <h4 class="fw-bold mb-1">

                                <%= student.getName() %>

                            </h4>


                            <p class="text-muted mb-0">

                                Student ID:
                                #<%= student.getId() %>

                            </p>

                        </div>


                    </div>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- NAME -->
            <!-- ================================================= -->

            <div class="card shadow-sm field-card mb-3">

                <div class="card-body">

                    <div class="row align-items-center">


                        <div class="col-md-3">

                            <label class="fw-semibold">

                                Name

                            </label>

                        </div>


                        <div class="col-md-7">

                            <input
                                type="text"
                                class="form-control"
                                value="<%= student.getName() %>"
                                readonly
                                id="nameInput">

                        </div>


                        <div class="col-md-2 text-md-end mt-2 mt-md-0">

                            <button
                                type="button"
                                class="btn btn-outline-primary"
                                onclick="editField('nameInput')">

                                <i class="bi bi-pencil me-1"></i>

                                Edit

                            </button>

                        </div>

                    </div>


                    <!-- Hidden update form -->

                    <form
                        action="<%= request.getContextPath() %>/UpdateStudentServlet"
                        method="post"
                        class="mt-3 d-none"
                        id="nameForm">


                        <input
                            type="hidden"
                            name="action"
                            value="name">


                        <input
                            type="hidden"
                            name="id"
                            value="<%= student.getId() %>">


                        <div class="row">

                            <div class="col-md-10">

                                <input
                                    type="text"
                                    name="name"
                                    class="form-control"
                                    value="<%= student.getName() %>"
                                    required>

                            </div>


                            <div class="col-md-2">

                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    Save

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- EMAIL -->
            <!-- ================================================= -->

            <div class="card shadow-sm field-card mb-3">

                <div class="card-body">

                    <div class="row align-items-center">


                        <div class="col-md-3">

                            <label class="fw-semibold">

                                Email

                            </label>

                        </div>


                        <div class="col-md-7">

                            <input
                                type="email"
                                class="form-control"
                                value="<%= student.getEmail() %>"
                                readonly
                                id="emailInput">

                        </div>


                        <div class="col-md-2 text-md-end mt-2 mt-md-0">

                            <button
                                type="button"
                                class="btn btn-outline-primary"
                                onclick="editField('emailInput')">

                                <i class="bi bi-pencil me-1"></i>

                                Edit

                            </button>

                        </div>

                    </div>


                    <form
                        action="<%= request.getContextPath() %>/UpdateStudentServlet"
                        method="post"
                        class="mt-3 d-none"
                        id="emailForm">


                        <input
                            type="hidden"
                            name="action"
                            value="email">


                        <input
                            type="hidden"
                            name="id"
                            value="<%= student.getId() %>">


                        <div class="row">

                            <div class="col-md-10">

                                <input
                                    type="email"
                                    name="email"
                                    class="form-control"
                                    value="<%= student.getEmail() %>"
                                    required>

                            </div>


                            <div class="col-md-2">

                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    Save

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- PHONE -->
            <!-- ================================================= -->

            <div class="card shadow-sm field-card mb-3">

                <div class="card-body">

                    <div class="row align-items-center">


                        <div class="col-md-3">

                            <label class="fw-semibold">

                                Phone

                            </label>

                        </div>


                        <div class="col-md-7">

                            <input
                                type="text"
                                class="form-control"
                                value="<%= student.getPhone() %>"
                                readonly
                                id="phoneInput">

                        </div>


                        <div class="col-md-2 text-md-end mt-2 mt-md-0">

                            <button
                                type="button"
                                class="btn btn-outline-primary"
                                onclick="editField('phoneInput')">

                                <i class="bi bi-pencil me-1"></i>

                                Edit

                            </button>

                        </div>

                    </div>


                    <form
                        action="<%= request.getContextPath() %>/UpdateStudentServlet"
                        method="post"
                        class="mt-3 d-none"
                        id="phoneForm">


                        <input
                            type="hidden"
                            name="action"
                            value="phone">


                        <input
                            type="hidden"
                            name="id"
                            value="<%= student.getId() %>">


                        <div class="row">

                            <div class="col-md-10">

                                <input
                                    type="text"
                                    name="phone"
                                    class="form-control"
                                    value="<%= student.getPhone() %>"
                                    pattern="[0-9]{10}"
                                    maxlength="10"
                                    required>

                            </div>


                            <div class="col-md-2">

                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    Save

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- AGE -->
            <!-- ================================================= -->

            <div class="card shadow-sm field-card mb-3">

                <div class="card-body">

                    <div class="row align-items-center">


                        <div class="col-md-3">

                            <label class="fw-semibold">

                                Age

                            </label>

                        </div>


                        <div class="col-md-7">

                            <input
                                type="number"
                                class="form-control"
                                value="<%= student.getAge() %>"
                                readonly
                                id="ageInput">

                        </div>


                        <div class="col-md-2 text-md-end mt-2 mt-md-0">

                            <button
                                type="button"
                                class="btn btn-outline-primary"
                                onclick="editField('ageInput')">

                                <i class="bi bi-pencil me-1"></i>

                                Edit

                            </button>

                        </div>

                    </div>


                    <form
                        action="<%= request.getContextPath() %>/UpdateStudentServlet"
                        method="post"
                        class="mt-3 d-none"
                        id="ageForm">


                        <input
                            type="hidden"
                            name="action"
                            value="age">


                        <input
                            type="hidden"
                            name="id"
                            value="<%= student.getId() %>">


                        <div class="row">

                            <div class="col-md-10">

                                <input
                                    type="number"
                                    name="age"
                                    class="form-control"
                                    value="<%= student.getAge() %>"
                                    min="15"
                                    max="100"
                                    required>

                            </div>


                            <div class="col-md-2">

                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    Save

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- COURSE -->
            <!-- ================================================= -->

            <div class="card shadow-sm field-card mb-3">

                <div class="card-body">

                    <div class="row align-items-center">


                        <div class="col-md-3">

                            <label class="fw-semibold">

                                Course

                            </label>

                        </div>


                        <div class="col-md-7">

                            <input
                                type="text"
                                class="form-control"
                                value="<%= student.getCourse() %>"
                                readonly
                                id="courseInput">

                        </div>


                        <div class="col-md-2 text-md-end mt-2 mt-md-0">

                            <button
                                type="button"
                                class="btn btn-outline-primary"
                                onclick="editField('courseInput')">

                                <i class="bi bi-pencil me-1"></i>

                                Edit

                            </button>

                        </div>

                    </div>


                    <form
                        action="<%= request.getContextPath() %>/UpdateStudentServlet"
                        method="post"
                        class="mt-3 d-none"
                        id="courseForm">


                        <input
                            type="hidden"
                            name="action"
                            value="course">


                        <input
                            type="hidden"
                            name="id"
                            value="<%= student.getId() %>">


                        <div class="row">

                            <div class="col-md-10">

                                <select
                                    name="course"
                                    class="form-select"
                                    required>


                                    <option value="B_TECH"
                                            <%= "B_TECH".equals(student.getCourse()) ? "selected" : "" %>>

                                        B. Tech

                                    </option>


                                    <option value="BBA"
                                            <%= "BBA".equals(student.getCourse()) ? "selected" : "" %>>

                                        BBA

                                    </option>


                                    <option value="B_COM"
                                            <%= "B_COM".equals(student.getCourse()) ? "selected" : "" %>>

                                        B.Com

                                    </option>


                                    <option value="BJMC"
                                            <%= "BJMC".equals(student.getCourse()) ? "selected" : "" %>>

                                        BJMC

                                    </option>


                                    <option value="BCA"
                                            <%= "BCA".equals(student.getCourse()) ? "selected" : "" %>>

                                        BCA

                                    </option>


                                </select>

                            </div>


                            <div class="col-md-2">

                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    Save

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- BATCH -->
            <!-- ================================================= -->

            <div class="card shadow-sm field-card mb-4">

                <div class="card-body">

                    <div class="row align-items-center">


                        <div class="col-md-3">

                            <label class="fw-semibold">

                                Batch

                            </label>

                        </div>


                        <div class="col-md-7">

                            <input
                                type="text"
                                class="form-control"
                                value="<%= student.getBatch() %>"
                                readonly
                                id="batchInput">

                        </div>


                        <div class="col-md-2 text-md-end mt-2 mt-md-0">

                            <button
                                type="button"
                                class="btn btn-outline-primary"
                                onclick="editField('batchInput')">

                                <i class="bi bi-pencil me-1"></i>

                                Edit

                            </button>

                        </div>

                    </div>


                    <form
                        action="<%= request.getContextPath() %>/UpdateStudentServlet"
                        method="post"
                        class="mt-3 d-none"
                        id="batchForm">


                        <input
                            type="hidden"
                            name="action"
                            value="batch">


                        <input
                            type="hidden"
                            name="id"
                            value="<%= student.getId() %>">


                        <div class="row">

                            <div class="col-md-10">

                                <select
                                    name="batch"
                                    class="form-select"
                                    required>


                                    <option value="2022-2026"
                                            <%= "2022-2026".equals(student.getBatch()) ? "selected" : "" %>>

                                        2022 - 2026

                                    </option>


                                    <option value="2023-2027"
                                            <%= "2023-2027".equals(student.getBatch()) ? "selected" : "" %>>

                                        2023 - 2027

                                    </option>


                                    <option value="2024-2028"
                                            <%= "2024-2028".equals(student.getBatch()) ? "selected" : "" %>>

                                        2024 - 2028

                                    </option>


                                    <option value="2025-2029"
                                            <%= "2025-2029".equals(student.getBatch()) ? "selected" : "" %>>

                                        2025 - 2029

                                    </option>


                                    <option value="2026-2030"
                                            <%= "2026-2030".equals(student.getBatch()) ? "selected" : "" %>>

                                        2026 - 2030

                                    </option>


                                    <option value="2027-2031"
                                            <%= "2027-2031".equals(student.getBatch()) ? "selected" : "" %>>

                                        2027 - 2031

                                    </option>


                                </select>

                            </div>


                            <div class="col-md-2">

                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    Save

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>


        </main>

    </div>

</div>



<!-- ================================================= -->
<!-- JAVASCRIPT -->
<!-- ================================================= -->

<script>

    function editField(inputId) {

        const input =
            document.getElementById(inputId);

        const form =
            document.getElementById(
                inputId.replace("Input", "Form")
            );

        form.classList.remove("d-none");

        input.focus();

    }

</script>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>