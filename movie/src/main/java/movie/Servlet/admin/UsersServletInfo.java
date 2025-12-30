package movie.Servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.UserDAO;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

import java.io.IOException;

@WebServlet("/admin/users/info")
public class UsersServletInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {

		
        String usersIdStr = request.getParameter("users_id");
        if(usersIdStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/users/list");
            return;
        }

        int usersId = Integer.parseInt(usersIdStr);

        UserService userService = new UserServiceImpl(new UserDAO());
        Users user = userService.select((long)usersId);

        request.setAttribute("user", user);
        request.getRequestDispatcher("/page/admin/users/info.jsp").forward(request, response);
    }
    
}