import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.*;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/adminPage")
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        if (username.contains("admin")) {
            username = "user";
        }
        username = username.replace("OR", "");
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = null;
        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        }
        Document doc = null;
        try {
            doc = builder.parse(new File(getServletContext().getRealPath("users.xml")));
        } catch (SAXException e) {
            throw new RuntimeException(e);
        }
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        XPathExpression expr = null;
        try {
            expr = xpath.compile("/users/user[username/text()='" + username + "']");
        } catch (XPathExpressionException e) {
            throw new RuntimeException(e);
        }

        NodeList nl = null;
        try {
            nl = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
        } catch (XPathExpressionException e) {
            throw new RuntimeException(e);
        }
        for (int i = 0; i < nl.getLength(); i++) {
            Node currentItem = nl.item(i);
            NodeList children = currentItem.getChildNodes();
            for (int j = 0; j < children.getLength(); j++) {
                Node child = children.item(j);
                response.getWriter().write(child.getNodeName() + ": " + child.getTextContent());
            }
        }
    }



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String sessionData = null;

        for (Cookie cookie : cookies) {
            if ("userSession".equals(cookie.getName())) {
                sessionData = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                break;
            }
        }

        if (sessionData != null) {
            try {
                UserSession userSession = SerializationUtil.deserialize(sessionData);
                String userType = userSession.getRole();

                if ("admin".equals(userType)) {
                    request.getRequestDispatcher("adminPage.jsp").forward(request, response);
                } else if ("normal".equals(userType)){
                    response.sendRedirect("normalPage.jsp?error=notAdmin");
                } else {
                    response.sendRedirect("login.jsp?error=InvalidSession");
                }
            } catch (ClassNotFoundException | IOException e) {
                response.sendRedirect("login.jsp?error=true");
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
