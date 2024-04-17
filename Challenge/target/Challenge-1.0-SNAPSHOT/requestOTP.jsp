
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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
    <% if (request.getParameter("error") != null && "unregistered".equals(request.getParameter("error"))) { %>
<p>Error: The username is not registered!</p>
    <% } %>

<body>
<% if (request.getParameter("error") != null && "unregistered".equals(request.getParameter("error"))) { %>
<p>Error: The username is not registered!</p>
<% } %>

<h1>Request OTP</h1>
<form action="recovery" method="post">
    <input type="hidden" name="action" value="request">
    <p>Username: <input type="text" name="username"></p>
    <p><input type="submit" value="Request OTP"></p>
</form>
</div>
</div>
</div>
</body>
</html>