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
    <h1>Welcome to Your Client Dashboard, [Under Construction ... We still have no clients !]</h1>
    <p>Here you can view your profile, manage your settings, and access personalized content.</p>
    <div class="notification-bar">
        You have <strong>2 new notifications!</strong> Check them out <a href="notificationclient.jsp">here</a>.
    </div>
    <div>
        <a href="#" class="btn btn-primary">View Profile</a>
        <a href="#" class="btn btn-secondary">Edit Settings</a>
        <a href="#" class="btn btn-info">Access Content</a>
    </div>
    <div class="dashboard-panel">
        <h3>Quick Links</h3>
        <ul>
            <li><a href="#">FAQs</a></li>
            <li><a href="#">Support Center</a></li>
            <li><a href="#">Download User Manual</a></li>
            <li><a href="#">Special Offers</a></li>
        </ul>
    </div>
    <div class="mt-4">
        <a href="login.jsp" class="btn btn-danger">Logout</a>
    </div>
</div>
</body>
</html>
