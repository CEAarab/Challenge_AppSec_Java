
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Chakra Petch', sans-serif;
            font-size: 16px;
            background-color: #1E232A; /* using dark theme from PDF */
            color: #FFFFFF; /* light text for dark background */
        }
        .container {
            margin-top: 100px;
            width: 700px; /* standard modal-lg width */
        }
        .btn-primary {
            background-color: #14171C; /* primary button color */
            border-color: #14171C;
            padding: 12px 24px;
        }
        .btn-primary:hover {
            background-color: #101214; /* manually darkened color */
            border-color: #101214;
        }
        .error {
            color: #E74C3C; /* error color red */
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 mt-5">
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='register.jsp';">Register</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='requestOTP.jsp';">Forget Password</button>
            </form>
            <% if ("username".equals(request.getParameter("error"))) { %>
            <div class="error">Incorrect username.</div>
            <% } else if ("password".equals(request.getParameter("error"))) { %>
            <div class="error">Incorrect password.</div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
