package uz.pdp.carenestclinic.servlets;

import uz.pdp.carenestclinic.entity.Status;
import uz.pdp.carenestclinic.entity.Users;
import uz.pdp.carenestclinic.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/patient/status")
public class UpdateStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String a = req.getParameter("id");
        String b = req.getParameter("doctorId");
        int id = Integer.parseInt(a);
        int doctorId = Integer.parseInt(b);
        Users user = UserRepo.getUserById(doctorId);
        Users patient = UserRepo.getUserById(id);
        if (patient.getStatus() == Status.NEW) {
            patient.setStatus(Status.CHECK);
        } else if (patient.getStatus() == Status.CHECK) {
            patient.setStatus(Status.COMPLETED);
        }

        UserRepo.updateUser(patient);
        req.setAttribute("doctorId", user.getId());
        req.setAttribute("firstName", user.getFirstName());
        req.setAttribute("lastName", user.getLastName());
        req.setAttribute("specialization", user.getSpecialization());
        req.getRequestDispatcher("/doctor.jsp").forward(req, resp);

    }
}
