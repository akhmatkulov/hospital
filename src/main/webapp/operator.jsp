<%@ page import="uz.pdp.carenestclinic.repo.UserRepo" %>
<%@ page import="uz.pdp.carenestclinic.entity.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Operator</title>
</head>
<body>
<%
    String search = request.getParameter("search");
    List<Users> patient = UserRepo.getPatient(search);
    int n =1;
    List<Users> doctor = UserRepo.getDoctor();
%>
<div class="container mt-4">
    <div class="w-50 p-4">
        <form action="">
            <div class="input-group">
                <input name="search" class="form-control" type="text" placeholder="Search...">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>
    </div>
    <%
        if (patient.isEmpty()) {
    %>
    <a href="/user/create" class="btn btn-primary">
        <i class="bi bi-person-plus"></i> Create
    </a>
    <%
    } else {
    %>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>№</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Phone Number</th>
            <th>Status</th>
            <th>Created Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
                for (Users users : patient) {
            %>
            <tr>
                <td><%=n++%></td>
                <td><%=users.getFirstName()%></td>
                <td><%=users.getLastName()%></td>
                <td><%=users.getPhone()%></td>
                <td><%=users.getStatus()%></td>
                <td><%=users.getCreatedDate()%></td>
                <td>
                    <form action="/assignDoctor" method="post">
                        <div class="d-flex">
                        <select class="form-control me-3" name="doctorId">
                        <option value="" disabled selected>Select Doctor</option>
                        <%
                            for (Users user : doctor) {
                        %>
                        <option value="<%=user.getId()%>"><%=user.getFirstName()%> <%=user.getSpecialization()%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                        <input type="hidden" name="patientId" value="<%=users.getId()%>" />
                        <button class="btn btn-success" type="submit">send</button>
                        </div>
                    </form>
                </td>
            </tr>
            <%
                }
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
