import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import java.util.Random;

@WebServlet("/recovery")
public class RecoveryServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/secdojolab";
    private static final String USER = "root";
    private static final String PASS = "root";
    private static final String ALPHANUMERIC_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final long minSeed = 0;
    private static final long maxSeed = 1000000;
    private static final long seed = minSeed + (long) (Math.random() * ((maxSeed - minSeed) + 1));
    private static final Random random = new Random(seed);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("request".equals(action)) {
            String username = request.getParameter("username");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                 PreparedStatement checkUserStmt = conn.prepareStatement("SELECT COUNT(*) AS userCount FROM users WHERE username = ?")) {

                checkUserStmt.setString(1, username);
                ResultSet rs = checkUserStmt.executeQuery();
                if (rs.next() && rs.getInt("userCount") > 0) {
                    String otp = generateOTP(random);
                    try (PreparedStatement stmt = conn.prepareStatement("UPDATE users SET otp = ? WHERE username = ?");
                         PreparedStatement getUrlStmt = conn.prepareStatement("SELECT recovery_url FROM users WHERE username = ?")) {

                        stmt.setString(1, otp);
                        stmt.setString(2, username);
                        stmt.executeUpdate();

                        getUrlStmt.setString(1, username);
                        ResultSet rsUrl = getUrlStmt.executeQuery();
                        if (rsUrl.next()) {
                            sendOTPToUrl(rsUrl.getString("recovery_url"), otp);
                            response.sendRedirect("enterOTP.jsp?status=success");
                        }
                    }
                } else {
                    response.sendRedirect("requestOTP.jsp?error=unregistered");
                }
            } catch (SQLException e) {
                throw new ServletException("Database connection error", e);
            }
        } else if ("reset".equals(action)) {
            String username = request.getParameter("username");
            String otp = request.getParameter("otp");
            String newPassword = request.getParameter("newPassword");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                 PreparedStatement selectStmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND otp = ?");
                 PreparedStatement updateStmt = conn.prepareStatement("UPDATE users SET password = ?, otp = NULL WHERE username = ?")) {
                selectStmt.setString(1, username);
                selectStmt.setString(2, otp);
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    updateStmt.setString(1, newPassword);
                    updateStmt.setString(2, username);
                    updateStmt.executeUpdate();
                    response.sendRedirect("login.jsp?reset=true");
                } else {
                    response.sendRedirect("enterOTP.jsp?error=true");
                }
            } catch (SQLException e) {
                throw new ServletException("Password reset failed", e);
            }
        }
    }

    private void sendOTPToUrl(String urlString, String otp) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        try (DataOutputStream wr = new DataOutputStream(conn.getOutputStream())) {
            wr.writeBytes("otp=" + otp);
            wr.flush();
        }
        int responseCode = conn.getResponseCode();
        System.out.println("Response to URL " + urlString + ": " + responseCode);
    }


    public static String generateOTP(Random rand) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 6 ; i++) {
            builder.append(ALPHANUMERIC_CHARS.charAt(rand.nextInt(ALPHANUMERIC_CHARS.length())));
        }
        return builder.toString();
    }
}
