<%@ page import="java.util.ArrayList" %>
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
    </style>
</head>
<body>
<body>
<div class="container mt-5">
    <h1>User Management [Under Construction ...]</h1>
    <p>Manage all registered users from this panel.</p>
    <div class="mb-3">
        <a href="#" class="btn btn-success">Add New User</a>
        <a href="#" class="btn btn-warning">Modify User</a>
        <a href="#" class="btn btn-danger">Delete User</a>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<String[]> users = new ArrayList<String[]>();
            users.add(new String[]{"1", "user", "user@sec-dojo.com"});
            users.add(new String[]{"2", "adminSeCdOjO", "admin2035@sec-dojo.com"});
        %>
        </tbody>
    </table>
    <div class="mt-4">
        <a href="/Challenge_war/adminPage.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
