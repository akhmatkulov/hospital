package uz.pdp.carenestclinic.servlets;

import uz.pdp.carenestclinic.entity.Users;
import uz.pdp.carenestclinic.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/patients")
public class PatientHistoryListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("doctorId");
        int doctorId = Integer.parseInt(id);
        Users user = UserRepo.getUserById(doctorId);
        List<Users> usersByDoctorId = UserRepo.getUsersByDoctorId(doctorId);
        req.setAttribute("users", usersByDoctorId);
        req.setAttribute("doctorId", user.getId());
        req.setAttribute("firstName", user.getFirstName());
        req.setAttribute("lastName", user.getLastName());
        req.setAttribute("specialization", user.getSpecialization());
        req.getRequestDispatcher("/patientHistory.jsp").forward(req, resp);
    }
}
