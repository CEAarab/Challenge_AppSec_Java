<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
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
        h1 {
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <% String content = new String(Files.readAllBytes(Paths.get("/root/proof.txt")), StandardCharsets.UTF_8); %>
    <h1>Welcome to the Admin Dashboard, <%=content %>!</h1>
    <p>This area is restricted to administrators. Here you can manage the application settings, users, view system logs, and more.</p>
    <div class="mb-3">
        <a href="userManagement.jsp" class="btn btn-primary">Manage Users</a>
        <a href="systemSettings.jsp" class="btn btn-secondary">System Settings</a>
        <a href="auditLogs.jsp" class="btn btn-info">View Audit Logs</a>
    </div>
    <h2>Users LookUp :</h2>
    <form action="adminPage" method="post">
        <div class="form-group">
            <label for="usernameInput">Enter Username:</label>
            <input type="text" class="form-control" id="usernameInput" name="username">
        </div>
        <button type="submit" class="btn btn-danger">Query User</button>
    </form>
    <div class="mt-4">
        <a href="login.jsp" class="btn btn-danger">Logout</a>
    </div>
</div>
</body>
</html>