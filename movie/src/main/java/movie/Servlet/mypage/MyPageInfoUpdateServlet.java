package movie.Servlet.mypage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

@WebServlet("/mypage/userinfo/update")
public class MyPageInfoUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String noStr = request.getParameter("no");
            if (noStr == null || noStr.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/mypage/userinfo?error=no_id");
                return;
            }

            int no = Integer.parseInt(noStr);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String birth = request.getParameter("birth");
            String tel = request.getParameter("tel");

            Users user = userService.select((long) no);
            if (user != null) {
                user.setName(name);
                user.setEmail(email);
                user.setBirth(birth);
                user.setTel(tel);
                user.setUpdatedAt(new java.util.Date());

                boolean success = userService.update(user);
                System.out.println("Update 성공 여부: " + success);
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/mypage/userinfo");
    }
}
