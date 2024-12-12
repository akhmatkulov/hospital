package uz.pdp.carenestclinic.servlets;

import uz.pdp.carenestclinic.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assignDoctor")
public class AssignDoctorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("patientId");
        String doctorId = req.getParameter("doctorId");
        if (doctorId == null || id == null) {
            resp.sendRedirect("/operator.jsp");
            return;
        }
        UserRepo.assignPatientToDoctor(Integer.parseInt(id), Integer.parseInt(doctorId));
        resp.sendRedirect("/operator.jsp");
    }
}
