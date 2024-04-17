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
    <h1>Audit Logs</h1>
    <p>Review all system access and changes logs.</p>
    <table class="table">
        <thead>
        <tr>
            <th>Timestamp</th>
            <th>User</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<String[]> logs = new ArrayList<String[]>();
            logs.add(new String[]{"2021-01-02 13:00", "user", "Password change"});
            logs.add(new String[]{"2021-01-02 13:00", "user", "Password change"});
            logs.add(new String[]{"2021-01-02 13:00", "user", "Logged in"});
            logs.add(new String[]{"2021-01-01 12:00", "admin", "Logged in"});
            for(String[] log : logs) {
                out.println("<tr><td>" + log[0] + "</td><td>" + log[1] + "</td><td>" + log[2] + "</td></tr>");
            }
        %>
        </tbody>
    </table>
    <div class="mt-4">
        <a href="adminPage.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
