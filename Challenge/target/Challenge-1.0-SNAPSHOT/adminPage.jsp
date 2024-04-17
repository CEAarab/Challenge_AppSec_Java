
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.nio.file.Files, java.nio.file.Paths, java.nio.charset.StandardCharsets" %>
<html>
<head>
    <title>Admin Dashboard</title>
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
    <% String content = new String(Files.readAllBytes(Paths.get("/root/proof.txt")), StandardCharsets.UTF_8); %>
    <h1>Welcome to the Admin Dashboard, <%=content %>!</h1>
    <p>This area is restricted to administrators. Here you can manage the application settings, users, view system logs, and more.</p>
</div>
</body>
</html>
