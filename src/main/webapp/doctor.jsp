<%@ page import="uz.pdp.carenestclinic.repo.UserRepo" %>
<%@ page import="uz.pdp.carenestclinic.entity.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.carenestclinic.entity.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Doctor</title>
</head>
<body>

<%
    int doctorId = (int) request.getAttribute("doctorId");
    String firstName = (String) request.getAttribute("firstName");
    String lastName = (String) request.getAttribute("lastName");
    String specialization = (String) request.getAttribute("specialization");
    int n = 1;
    List<Users> patientsList = UserRepo.getAllPatientsAssignedDoctor(doctorId);
%>
<h3><%=firstName + " " + lastName + ": " + specialization%>
</h3>
<div class="container mt-4">
    <div class="w-50 p-4">
        <form action="/doctor/patients" method="get">
            <input type="hidden" name="doctorId" value="<%= doctorId %>"/>
            <div class="input-group">
                <button class="btn btn-dark" type="submit">My Patients History</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>№</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (patientsList != null && !patientsList.isEmpty()) {

                for (Users user : patientsList) {
        %>
        <tr>
            <td><%= n++ %>
            </td>
            <td><%= user.getFirstName() %>
            </td>
            <td><%= user.getLastName() %>
            </td>
            <td><%= user.getStatus() %>
            </td>
            <td>
                <form action="/patient/status" method="get">
                    <input type="hidden" name="id" value="<%= user.getId() %>"/>
                    <input type="hidden" name="doctorId" value="<%= doctorId %>"/>
                    <% if (user.getStatus() == Status.CHECK && n == 2) { %>
                    <button class="btn btn-warning" type="submit">Accepted</button>
                    <%} else if (n == 2 && user.getStatus() == Status.NEW) { %>
                    <button class="btn btn-success" type="submit">Accept</button>
                    <%
                    }
                    %>
                </form>
            </td>
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
</body>
</html>
