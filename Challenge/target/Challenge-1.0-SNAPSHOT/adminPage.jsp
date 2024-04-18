<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="content-container">
    <% String content = new String(Files.readAllBytes(Paths.get("/home/local.txt")), StandardCharsets.UTF_8); %>
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