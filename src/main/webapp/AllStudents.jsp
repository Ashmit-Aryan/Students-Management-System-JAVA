<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ashmitaryan.Model.Students" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>All Students - Student Management System</title>


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


        /* ================= CONTENT ================= */

        .content-card {
            border: none;
            border-radius: 12px;
        }


        /* ================= STUDENT AVATAR ================= */

        .student-avatar {
            width: 38px;
            height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background-color: #e9ecef;
            color: #495057;

            font-weight: 600;
        }


        /* ================= SEARCH ================= */

        .search-box {
            max-width: 450px;
        }

        .search-box .form-control {
            border-left: none;
        }

        .search-box .input-group-text {
            background-color: white;
            border-right: none;
        }

        .search-box .form-control:focus {
            box-shadow: none;
            border-color: #dee2e6;
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
                        class="nav-link active">

                        <i class="bi bi-people me-2"></i>

                        Students

                    </a>

                </li>


                <!-- Add Student -->

                <li class="nav-item">

                    <a
                        href="<%= request.getContextPath() %>/AddStudentServlet"
                        class="nav-link">

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

            <div class="d-flex
                        justify-content-between
                        align-items-center
                        mb-4">


                <div>

                    <h2 class="fw-bold mb-1">

                        All Students

                    </h2>

                    <p class="text-muted mb-0">

                        View and manage all registered students

                    </p>

                </div>


                <a
                    href="<%= request.getContextPath() %>/AddStudentServlet"
                    class="btn btn-primary">

                    <i class="bi bi-person-plus me-2"></i>

                    Add Student

                </a>


            </div>



            <!-- ================================================= -->
            <!-- STUDENT TABLE CARD -->
            <!-- ================================================= -->

            <div class="card shadow-sm content-card">

                <div class="card-body">


                    <!-- ================================================= -->
                    <!-- TABLE HEADER -->
                    <!-- ================================================= -->

                    <div class="row
                                align-items-center
                                mb-4">


                        <!-- TITLE -->

                        <div class="col-md-4 mb-3 mb-md-0">

                            <h5 class="fw-bold mb-1">

                                Students

                            </h5>


                            <%

                                List<Students> students =
                                    (List<Students>)
                                    request.getAttribute("students");


                                int studentCount = 0;


                                if (students != null) {

                                    studentCount = students.size();

                                }

                            %>


                            <span class="text-muted small">

                                <%= studentCount %> students found

                            </span>

                        </div>



                        <!-- SEARCH -->

                        <div class="col-md-5 mb-3 mb-md-0">


                            <div class="input-group search-box">


                                <span class="input-group-text">

                                    <i class="bi bi-search"></i>

                                </span>


                                <input
                                    type="text"
                                    id="studentSearch"
                                    class="form-control"
                                    placeholder="Search students..."
                                    onkeyup="searchStudents()">


                                <button
                                    type="button"
                                    class="btn btn-outline-secondary"
                                    onclick="clearSearch()">

                                    <i class="bi bi-x-lg"></i>

                                </button>


                            </div>


                        </div>



                        <!-- RESULT COUNT -->

                        <div class="col-md-3 text-md-end">


                            <span
                                id="searchResult"
                                class="text-muted small">

                            </span>


                        </div>


                    </div>



                    <!-- ================================================= -->
                    <!-- TABLE -->
                    <!-- ================================================= -->

                    <div class="table-responsive">


                        <table
                            class="table table-hover align-middle"
                            id="studentsTable">


                            <thead class="table-light">

                            <tr>

                                <th>ID</th>

                                <th>Student</th>

                                <th>Email</th>

                                <th>Phone</th>

                                <th>Age</th>

                                <th>Course</th>

                                <th>Batch</th>

                                <th class="text-center">

                                    Actions

                                </th>

                            </tr>

                            </thead>



                            <tbody>


                            <%

                                if (students != null
                                    && !students.isEmpty()) {


                                    for (Students student : students) {


                                        String name =
                                            student.getName();


                                        String firstLetter =
                                            name.substring(0, 1)
                                                .toUpperCase();

                            %>


                            <tr>


                                <!-- ID -->

                                <td>

                                    <span class="text-muted">

                                        #<%= student.getId() %>

                                    </span>

                                </td>



                                <!-- STUDENT -->

                                <td>

                                    <div class="d-flex
                                                align-items-center">


                                        <div
                                            class="student-avatar me-2">

                                            <%= firstLetter %>

                                        </div>


                                        <div>

                                            <div class="fw-semibold">

                                                <%= student.getName() %>

                                            </div>

                                        </div>


                                    </div>

                                </td>



                                <!-- EMAIL -->

                                <td>

                                    <%= student.getEmail() %>

                                </td>



                                <!-- PHONE -->

                                <td>

                                    <%= student.getPhone() %>

                                </td>



                                <!-- AGE -->

                                <td>

                                    <%= student.getAge() %>

                                </td>



                                <!-- COURSE -->

                                <td>

                                    <span
                                        class="badge text-bg-primary">

                                        <%= student.getCourse() %>

                                    </span>

                                </td>



                                <!-- BATCH -->

                                <td>

                                    <%= student.getBatch() %>

                                </td>



                                <!-- ACTIONS -->

                                <td class="text-center">


                                    <!-- EDIT -->

                                    <a
                                        href="<%= request.getContextPath() %>/UpdateStudentServlet?id=<%= student.getId() %>"
                                        class="btn btn-sm btn-outline-primary me-1"
                                        title="Edit Student">

                                        <i class="bi bi-pencil"></i>

                                    </a>



                                    <!-- DELETE -->

                                    <form
                                        action="<%= request.getContextPath() %>/DeleteStudentServlet"
                                        method="post"
                                        class="d-inline">


                                        <input
                                            type="hidden"
                                            name="action"
                                            value="delete">


                                        <input
                                            type="hidden"
                                            name="id"
                                            value="<%= student.getId() %>">


                                        <button
                                            type="submit"
                                            class="btn btn-sm btn-outline-danger"
                                            title="Delete Student"
                                            onclick="return confirm('Are you sure you want to delete this student?');">

                                            <i class="bi bi-trash"></i>

                                        </button>


                                    </form>


                                </td>


                            </tr>


                            <%

                                    }

                                } else {

                            %>


                            <!-- ================================================= -->
                            <!-- NO STUDENTS -->
                            <!-- ================================================= -->

                            <tr>

                                <td
                                    colspan="8"
                                    class="text-center py-5">


                                    <i
                                        class="bi bi-people fs-1 text-muted">
                                    </i>


                                    <h5 class="mt-3">

                                        No Students Found

                                    </h5>


                                    <p class="text-muted">

                                        There are currently no
                                        students registered.

                                    </p>


                                    <a
                                        href="<%= request.getContextPath() %>/AddStudentServlet"
                                        class="btn btn-primary">

                                        <i
                                            class="bi bi-person-plus me-2">
                                        </i>

                                        Add First Student

                                    </a>


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



<!-- ================================================= -->
<!-- BOOTSTRAP JS -->
<!-- ================================================= -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>



<!-- ================================================= -->
<!-- SEARCH JAVASCRIPT -->
<!-- ================================================= -->

<script>

    function searchStudents() {

        const searchInput =
            document.getElementById("studentSearch");

        const searchValue =
            searchInput.value.toLowerCase().trim();


        const table =
            document.getElementById("studentsTable");


        const rows =
            table.querySelectorAll("tbody tr");


        let visibleRows = 0;


        rows.forEach(function(row) {


            /*
             * Ignore the "No Students Found" row.
             */

            if (row.cells.length !== 8) {

                return;

            }


            const rowText =
                row.textContent.toLowerCase();


            if (rowText.includes(searchValue)) {

                row.style.display = "";

                visibleRows++;

            } else {

                row.style.display = "none";

            }

        });


        const result =
            document.getElementById("searchResult");


        if (searchValue === "") {

            result.textContent = "";

        } else {

            result.textContent =
                visibleRows + " result(s) found";

        }

    }



    function clearSearch() {

        const searchInput =
            document.getElementById("studentSearch");


        searchInput.value = "";


        searchStudents();


        searchInput.focus();

    }

</script>


</body>

</html>