<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ashmitaryan.Model.Students" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Dashboard - Student Management System</title>

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

        /* Sidebar */

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


        /* Statistic Cards */

        .stat-card {
            border: none;
            border-radius: 12px;
        }

        .stat-icon {
            width: 50px;
            height: 50px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;

            font-size: 22px;
        }


        /* Quick Actions */

        .quick-action {
            text-decoration: none;
        }


        /* Recent Students */

        .table-card {
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

                    <a href="${pageContext.request.contextPath}/Dashboard"
                       class="nav-link active">

                        <i class="bi bi-speedometer2 me-2"></i>

                        Dashboard

                    </a>

                </li>


                <!-- Students -->

                <li class="nav-item">

                    <a href="${pageContext.request.contextPath}/AllStudentsServlet"
                       class="nav-link">

                        <i class="bi bi-people me-2"></i>

                        Students

                    </a>

                </li>


                <!-- Add Student -->

                <li class="nav-item">

                    <a href="${pageContext.request.contextPath}/AddStudentServlet"
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

                    <a href="${pageContext.request.contextPath}/logout"
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


            <!-- Header -->

            <div class="d-flex
                        justify-content-between
                        align-items-center
                        mb-4">

                <div>

                    <h2 class="fw-bold mb-1">
                        Dashboard
                    </h2>

                    <p class="text-muted mb-0">
                        Student Management System
                    </p>

                </div>


                <a href="${pageContext.request.contextPath}/AddStudentServlet"
                   class="btn btn-primary">

                    <i class="bi bi-person-plus me-2"></i>

                    Add Student

                </a>

            </div>



            <!-- ================================================= -->
            <!-- STATISTICS -->
            <!-- ================================================= -->

            <div class="row g-4 mb-4">


                <!-- TOTAL STUDENTS -->

                <div class="col-sm-6 col-xl-4">

                    <div class="card stat-card shadow-sm">

                        <div class="card-body">

                            <div class="d-flex
                                        justify-content-between
                                        align-items-center">

                                <div>

                                    <p class="text-muted mb-1">
                                        Total Students
                                    </p>

                                    <h3 class="fw-bold mb-0">

                                        ${totalStudents}

                                    </h3>

                                </div>


                                <div class="stat-icon
                                            bg-primary-subtle
                                            text-primary">

                                    <i class="bi bi-people-fill"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <!-- B.TECH -->

                <div class="col-sm-6 col-xl-4">

                    <div class="card stat-card shadow-sm">

                        <div class="card-body">

                            <div class="d-flex
                                        justify-content-between
                                        align-items-center">

                                <div>

                                    <p class="text-muted mb-1">
                                        B.Tech Students
                                    </p>

                                    <h3 class="fw-bold mb-0">

                                        ${btechStudents}

                                    </h3>

                                </div>


                                <div class="stat-icon
                                            bg-success-subtle
                                            text-success">

                                    <i class="bi bi-cpu"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <!-- BBA -->

                <div class="col-sm-6 col-xl-4">

                    <div class="card stat-card shadow-sm">

                        <div class="card-body">

                            <div class="d-flex
                                        justify-content-between
                                        align-items-center">

                                <div>

                                    <p class="text-muted mb-1">
                                        BBA Students
                                    </p>

                                    <h3 class="fw-bold mb-0">

                                        ${bbaStudents}

                                    </h3>

                                </div>


                                <div class="stat-icon
                                            bg-info-subtle
                                            text-info">

                                    <i class="bi bi-briefcase"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <!-- BCA -->

                <div class="col-sm-6 col-xl-4">

                    <div class="card stat-card shadow-sm">

                        <div class="card-body">

                            <div class="d-flex
                                        justify-content-between
                                        align-items-center">

                                <div>

                                    <p class="text-muted mb-1">
                                        BCA Students
                                    </p>

                                    <h3 class="fw-bold mb-0">

                                        ${bcaStudents}

                                    </h3>

                                </div>


                                <div class="stat-icon
                                            bg-warning-subtle
                                            text-warning">

                                    <i class="bi bi-laptop"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <!-- BJMC -->

                <div class="col-sm-6 col-xl-4">

                    <div class="card stat-card shadow-sm">

                        <div class="card-body">

                            <div class="d-flex
                                        justify-content-between
                                        align-items-center">

                                <div>

                                    <p class="text-muted mb-1">
                                        BJMC Students
                                    </p>

                                    <h3 class="fw-bold mb-0">

                                        ${bjmcStudents}

                                    </h3>

                                </div>


                                <div class="stat-icon
                                            bg-danger-subtle
                                            text-danger">

                                    <i class="bi bi-camera-video"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <!-- B.COM -->

                <div class="col-sm-6 col-xl-4">

                    <div class="card stat-card shadow-sm">

                        <div class="card-body">

                            <div class="d-flex
                                        justify-content-between
                                        align-items-center">

                                <div>

                                    <p class="text-muted mb-1">
                                        B.Com Students
                                    </p>

                                    <h3 class="fw-bold mb-0">

                                        ${bcomStudents}

                                    </h3>

                                </div>


                                <div class="stat-icon
                                            bg-secondary-subtle
                                            text-secondary">

                                    <i class="bi bi-calculator"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


            </div>



            <!-- ================================================= -->
            <!-- QUICK ACTIONS -->
            <!-- ================================================= -->

            <div class="card shadow-sm table-card mb-4">

                <div class="card-body">

                    <h5 class="fw-bold mb-3">
                        Quick Actions
                    </h5>


                    <div class="row g-3">


                        <!-- Add Student -->

                        <div class="col-md-4">

                            <a href="${pageContext.request.contextPath}/AddStudentServlet"
                               class="quick-action">

                                <div class="border rounded p-3 text-dark">

                                    <i class="bi bi-person-plus
                                              fs-4 text-primary"></i>

                                    <div class="fw-semibold mt-2">
                                        Add Student
                                    </div>

                                    <small class="text-muted">
                                        Register a new student
                                    </small>

                                </div>

                            </a>

                        </div>


                        <!-- View Students -->

                        <div class="col-md-4">

                            <a href="${pageContext.request.contextPath}/AllStudentsServlet"
                               class="quick-action">

                                <div class="border rounded p-3 text-dark">

                                    <i class="bi bi-people
                                              fs-4 text-success"></i>

                                    <div class="fw-semibold mt-2">
                                        View Students
                                    </div>

                                    <small class="text-muted">
                                        View all registered students
                                    </small>

                                </div>

                            </a>

                        </div>


                        <!-- Search -->

                        <div class="col-md-4">

                            <a href="${pageContext.request.contextPath}/students"
                               class="quick-action">

                                <div class="border rounded p-3 text-dark">

                                    <i class="bi bi-search
                                              fs-4 text-warning"></i>

                                    <div class="fw-semibold mt-2">
                                        Search Student
                                    </div>

                                    <small class="text-muted">
                                        Find a student quickly
                                    </small>

                                </div>

                            </a>

                        </div>


                    </div>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- RECENT STUDENTS -->
            <!-- ================================================= -->

            <div class="card shadow-sm table-card">

                <div class="card-body">


                    <div class="d-flex
                                justify-content-between
                                align-items-center
                                mb-3">

                        <h5 class="fw-bold mb-0">
                            Recent Students
                        </h5>


                        <a href="${pageContext.request.contextPath}/AllStudentsServlet"
                           class="btn btn-sm btn-outline-primary">

                            View All

                        </a>

                    </div>



                    <div class="table-responsive">

                        <table class="table table-hover
                                      align-middle mb-0">

                            <thead class="table-light">

                            <tr>

                                <th>ID</th>

                                <th>Name</th>

                                <th>Email</th>

                                <th>Phone</th>

                                <th>Course</th>

                                <th>Batch</th>

                            </tr>

                            </thead>


                            <tbody>


                            <%

                                List<Students> recentStudents =
                                        (List<Students>)
                                        request.getAttribute(
                                                "recentStudents"
                                        );


                                if (recentStudents != null
                                        && !recentStudents.isEmpty()) {


                                    for (Students student :
                                            recentStudents) {

                            %>


                            <tr>

                                <td>
                                    <%= student.getId() %>
                                </td>


                                <td>

                                    <span class="fw-semibold">

                                        <%= student.getName() %>

                                    </span>

                                </td>


                                <td>

                                    <%= student.getEmail() %>

                                </td>


                                <td>

                                    <%= student.getPhone() %>

                                </td>


                                <td>

                                    <span class="badge text-bg-primary">

                                        <%= student.getCourse() %>

                                    </span>

                                </td>


                                <td>

                                    <%= student.getBatch() %>

                                </td>

                            </tr>


                            <%

                                    }

                                } else {

                            %>


                            <tr>

                                <td colspan="6"
                                    class="text-center
                                           text-muted
                                           py-4">

                                    <i class="bi bi-people
                                              fs-3 d-block mb-2"></i>

                                    No students found.

                                </td>

                            </tr>


                            <%

                                }

                            %>


                            </tbody>

                        </table>

                    </div>

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