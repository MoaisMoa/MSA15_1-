package movie.Servlet.mypage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.DAO.UserDAO;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

import java.io.IOException;

@WebServlet("/mypage/info")
public class MyPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl(new UserDAO());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Users user = (Users) session.getAttribute("loginUser");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/mypage/info.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Users loginUser = (Users) session.getAttribute("loginUser");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String tel = request.getParameter("tel");

        loginUser.setName(name);
        loginUser.setEmail(email);
        loginUser.setBirth(birth);
        loginUser.setTel(tel);

        // DB 업데이트
        userService.update(loginUser);

        // 세션 갱신
        session.setAttribute("loginUser", loginUser);

        response.sendRedirect(request.getContextPath() + "/mypage/info");
    }
}
