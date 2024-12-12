package uz.pdp.carenestclinic.servlets;

import uz.pdp.carenestclinic.entity.Role;
import uz.pdp.carenestclinic.entity.Status;
import uz.pdp.carenestclinic.entity.Users;
import uz.pdp.carenestclinic.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/user/create")
public class CreateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        Users user = new Users();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        user.setRole(Role.PATIENT);
        user.setStatus(Status.NEW);
        user.setCreatedDate(new Date());
        System.out.println(user);
        Users createUser = UserRepo.createUser(user);
        request.getRequestDispatcher("/operator.jsp").forward(request, response);

    }
}
