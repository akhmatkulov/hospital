<%@ page import="uz.pdp.carenestclinic.entity.Users" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor's Patient List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            Doctor Information
        </div>
        <div class="card-body">
            <h5 class="card-title"><%= request.getAttribute("firstName") %> <%= request.getAttribute("lastName") %>
            </h5>
            <p class="card-text">
                <strong>Specialization:</strong> <%= request.getAttribute("specialization") %><br>
                <strong>Doctor ID:</strong> <%= request.getAttribute("doctorId") %>
            </p>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>№</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone</th>
                <th>Status</th>
                <th>Create Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Users> users = (List<Users>) request.getAttribute("users");
                int index = 1;
                if (users != null && !users.isEmpty()) {
                    for (Users user : users) {
            %>
            <tr>
                <td><%= index++ %>
                </td>
                <td><%= user.getFirstName() %>
                </td>
                <td><%= user.getLastName() %>
                </td>
                <td><%= user.getPhone() %>
                </td>
                <td><%= user.getStatus() %>
                </td>
                <td><%= user.getCreatedDate() %>
                </td>
                <td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="7" class="text-center">No patients assigned to this doctor.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
