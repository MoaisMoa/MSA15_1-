package movie.Servlet.mypage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.DTO.Users;
import movie.DAO.UserDAO;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

@WebServlet("/mypage/update")
public class MyPageUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAO();
    private UserService userService = new UserServiceImpl(userDAO);

    @Override
    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Users loginUser = (Users) session.getAttribute("loginUser");


        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String tel = request.getParameter("tel");


        Users updatedUser = Users.builder()
                .id(loginUser.getId())
                .username(loginUser.getUsername())
                .name(name)
                .email(email)
                .birth(birth)
                .tel(tel)
                .build();

        boolean result = userService.updateById(updatedUser, loginUser.getId());

        if(result) {
            updatedUser.setPassword(null); 
            session.setAttribute("loginUser", updatedUser);
            response.sendRedirect(request.getContextPath() + "/mypageinfo.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/mypageinfo.jsp?error=true");
        }
    }
}
