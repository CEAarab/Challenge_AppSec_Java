<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<body>
<div class="content-container">
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
            users.add(new String[]{"2", "admin", "admin2035@sec-dojo.com"});
        %>
        </tbody>
    </table>
    <div class="mt-4">
        <a href="adminPage.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
