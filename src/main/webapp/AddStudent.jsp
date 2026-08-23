<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Student</title>

    <!-- Bootstrap CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-md-8 col-lg-7">

            <div class="card shadow-sm">

                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Add Student</h4>
                </div>

                <div class="card-body p-4">

                    <form action="./AddStudentServlet"
                          method="post">

                        <!-- Action -->
                        <input type="hidden"
                               name="action"
                               value="insert">


                        <!-- Name -->
                        <div class="mb-3">

                            <label for="name"
                                   class="form-label">
                                Name
                            </label>

                            <input type="text"
                                   class="form-control"
                                   id="name"
                                   name="name"
                                   placeholder="Enter student's name"
                                   required>

                        </div>


                        <!-- Email -->
                        <div class="mb-3">

                            <label for="email"
                                   class="form-label">
                                Email
                            </label>

                            <input type="email"
                                   class="form-control"
                                   id="email"
                                   name="email"
                                   placeholder="student@example.com"
                                   required>

                        </div>


                        <!-- Phone -->
                        <div class="mb-3">

                            <label for="phone"
                                   class="form-label">
                                Phone
                            </label>

                            <input type="tel"
                                   class="form-control"
                                   id="phone"
                                   name="phone"
                                   placeholder="Enter phone number"
                                   pattern="[0-9]{10}"
                                   maxlength="10"
                                   required>

                            <div class="form-text">
                                Enter a 10-digit phone number.
                            </div>

                        </div>


                        <!-- Age -->
                        <div class="mb-3">

                            <label for="age"
                                   class="form-label">
                                Age
                            </label>

                            <input type="number"
                                   class="form-control"
                                   id="age"
                                   name="age"
                                   placeholder="Enter age"
                                   min="15"
                                   max="100"
                                   required>

                        </div>


                        <!-- Course -->
                        <div class="mb-3">

                            <label for="course"
                                   class="form-label">
                                Course
                            </label>

                            <select class="form-select"
                                    id="course"
                                    name="course"
                                    required>

                                <option value=""
                                        selected
                                        disabled>
                                    Select Course
                                </option>

                                <option value="B. Tech">
                                    B. Tech
                                </option>

                                <option value="BBA">
                                    BBA
                                </option>

                                <option value="B.Com">
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


                        <!-- Batch -->
                        <div class="mb-4">

                            <label for="batch"
                                   class="form-label">
                                Batch
                            </label>

                            <select class="form-select"
                                    id="batch"
                                    name="batch"
                                    required>

                                <option value=""
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


                        <!-- Buttons -->
                        <div class="d-flex gap-2">

                            <button type="submit"
                                    class="btn btn-primary">
                                Add Student
                            </button>

                            <a href="${pageContext.request.contextPath}/Dashboard"
                               class="btn btn-secondary">
                                Cancel
                            </a>

                        </div>

                    </form>

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