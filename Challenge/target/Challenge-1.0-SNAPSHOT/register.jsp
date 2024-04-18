<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="content-container">
    <div class="row">
        <div class="col-md-6 offset-md-3 mt-5">
            <h1>Register</h1>
            <form action="registerServlet" method="post">
                <% if (request.getParameter("error") != null) {
                    if (request.getParameter("error").equals("username_exists")) { %>
                <p style="color: red;">Username already in use. Please try another.</p>
                <% } else if (request.getParameter("error").equals("invalid_url")) { %>
                <p style="color: red;">Invalid URL provided. Please enter a valid URL.</p>
                <% }
                } %>
                <p>Username: <input type="text" name="username" required></p>
                <p>Password: <input type="password" name="password" required></p>
                <p>Recovery URL: <input type="text" name="url" placeholder="https://yourwebsite.com/receive_otp"></p>
                <p><input type="submit" value="Register"></p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
