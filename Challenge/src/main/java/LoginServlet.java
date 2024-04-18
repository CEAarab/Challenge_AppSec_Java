import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.*;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/secdojolab";
    private static final String USER = "root";
    private static final String PASS = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userQuery = "SELECT password, role FROM users WHERE username = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                 PreparedStatement stmt = conn.prepareStatement(userQuery)) {

                stmt.setString(1, username);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String correctPassword = rs.getString("password");
                        String role = rs.getString("role");

                        if (password.equals(correctPassword)) {
                            UserSession userSession = new UserSession(username, role);
                            String serializedUserSession = SerializationUtil.serialize(userSession);
                            String encodedSession = URLEncoder.encode(serializedUserSession, StandardCharsets.UTF_8.toString());
                            Cookie userCookie = new Cookie("userSession", encodedSession);
                            userCookie.setPath("/");
                            response.addCookie(userCookie);

                            switch (role) {
                                case "admin":
                                    response.sendRedirect("adminPage.jsp");
                                    return;
                                case "normal":
                                    response.sendRedirect("normalPage.jsp");
                                    return;
                                case "client":
                                    response.sendRedirect("clientPage.jsp");
                                    return;
                                default:
                                    response.sendRedirect("login.jsp");
                                    return;
                            }
                        } else {
                            response.sendRedirect("login.jsp?error=password");
                        }
                    } else {
                        response.sendRedirect("login.jsp?error=username");
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException("Login failed", e);
        }
    }
}
