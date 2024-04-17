
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.nio.file.Files, java.nio.file.Paths, java.nio.charset.StandardCharsets" %>
<html>
<head>
    <title>Dashboard</title>
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
    </style>
</head>
<body>
<div class="container mt-5">
    <% String content = new String(Files.readAllBytes(Paths.get("/home/ubuntu/local.txt")), StandardCharsets.UTF_8); %>
    <h1>Welcome to Your Dashboard, <%=content %>!</h1>
    <p>Here you can view your profile, manage your settings, and access personalized content.</p>
    <div class="notification-bar">
        You have <strong>3 new notifications!</strong> Check them out <a href="/Challenge_war/notification.jsp">here</a>.
    </div>
    <div>
        <a href="#" class="btn btn-primary">View Profile</a>
        <a href="#" class="btn btn-secondary">Edit Settings</a>
        <a href="#" class="btn btn-info">Access Content</a>
    </div>
</div>
</body>
</html>
