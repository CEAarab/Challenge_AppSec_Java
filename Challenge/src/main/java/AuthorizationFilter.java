import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

@WebFilter("/adminPage")
public class AuthorizationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AuthorizationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestPath = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        if (requestPath.equals("/login.jsp") || requestPath.equals("/register.jsp") || requestPath.matches(".*\\.(css|js|png|jpg|jpeg|svg)$")) {
            chain.doFilter(request, response); // Allow public access
            return;
        }

        String cookieValue = null;
        if (httpRequest.getCookies() != null) {
            for (Cookie cookie : httpRequest.getCookies()) {
                if ("userSession".equals(cookie.getName())) {
                    cookieValue = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                    break;
                }
            }
        }

        if (cookieValue != null) {
            try {
                UserSession userSession = SerializationUtil.deserialize(cookieValue);

                if ("admin".equals(userSession.getRole())) {
                    chain.doFilter(request, response);
                    return;
                } else if ("normal".equals(userSession.getRole())) {
                    request.getRequestDispatcher("normalPage.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException | IllegalArgumentException e) {
                httpResponse.sendRedirect("login.jsp?error=invalidSession");
                return;
            }
        }

        httpResponse.sendRedirect("login.jsp?error=InvalidSession");
    }

    @Override
    public void destroy() {
        System.out.println("AuthorizationFilter destroyed");
    }
}
