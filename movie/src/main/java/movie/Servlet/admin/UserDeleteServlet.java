package movie.Servlet.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.UserDAO;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

@WebServlet("/admin/users/delete")
public class UserDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl(new UserDAO()); // 기본 생성자 사용

    @Override
    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response)
            throws ServletException, IOException {

        String userIdStr = request.getParameter("userId");
        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/users/list");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            boolean deleted = userService.delete((long)userId);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/admin/users/list?msg=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/users/list?msg=fail");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/users/list?msg=error");
        }
    }
}
