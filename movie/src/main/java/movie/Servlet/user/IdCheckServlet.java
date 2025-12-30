package movie.Servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.UserDAO;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

import java.io.IOException;


@WebServlet("/id-check") 
public class IdCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();
    private UserService userService = new UserServiceImpl(userDAO);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        boolean exists = userService.idCheck(username);

       response.setContentType("text/plain; charset=UTF-8");
       response.getWriter().write(String.valueOf(exists));
    }
}
