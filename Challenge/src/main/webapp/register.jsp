<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        body {
            font-family: 'Chakra Petch', sans-serif;
            font-size: 16px;
            background-color: #1E232A;
            color: #FFFFFF;
        }
        .container {
            margin-top: 100px;
            width: 700px;
        }
        .btn-primary {
            background-color: #14171C;
            border-color: #14171C;
            padding: 12px 24px;
        }
        .btn-primary:hover {
            background-color: #101214;
            border-color: #101214;
        }
        .error {
            color: #E74C3C;
        }
    </style>
</head>
<body>
<div class="container">
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
