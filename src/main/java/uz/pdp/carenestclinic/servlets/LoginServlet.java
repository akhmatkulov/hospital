package uz.pdp.carenestclinic.servlets;

import uz.pdp.carenestclinic.entity.Role;
import uz.pdp.carenestclinic.entity.Users;
import uz.pdp.carenestclinic.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");

        List<Users> users = UserRepo.getUserByPhoneNumberAndPassword(phoneNumber, password);

        if (users.isEmpty()) {
            req.setAttribute("errorMessage", "Telefon raqam yoki parol noto‘g‘ri!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        Users user = users.get(0);
        HttpSession session = req.getSession();
        session.setAttribute("currentUser", user);

        if (user.getRole() == Role.OPERATOR) {
            resp.sendRedirect("operator.jsp");
        } else if (user.getRole() == Role.DOCTOR) {
            req.setAttribute("doctorId", user.getId());
            req.setAttribute("firstName", user.getFirstName());
            req.setAttribute("lastName", user.getLastName());
            req.setAttribute("specialization", user.getSpecialization());
            req.getRequestDispatcher("/doctor.jsp").forward(req, resp);
        }
    }
}
