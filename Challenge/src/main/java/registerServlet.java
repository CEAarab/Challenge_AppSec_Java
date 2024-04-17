import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/secdojolab";
    private static final String USER = "root";
    private static final String PASS = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String url = request.getParameter("url");
        String role = "normal";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
            if (isUsernameExists(conn, username)) {
                response.sendRedirect("register.jsp?error=username_exists");
            } else {
                try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (username, password, recovery_url, role) VALUES (?, ?, ?, ?)")) {
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    stmt.setString(3, url);
                    stmt.setString(4, role);
                    stmt.executeUpdate();
                    response.sendRedirect("login.jsp");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Registration failed", e);
        }
    }

    private boolean isUsernameExists(Connection conn, String username) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE username = ?")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                rs.next();
                return rs.getInt(1) > 0;
            }
        }
    }
}
