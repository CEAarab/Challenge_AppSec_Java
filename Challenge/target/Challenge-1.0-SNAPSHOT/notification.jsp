
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
    <h1>Your Notifications</h1>
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action">Welcome to the platform! Get started by visiting your dashboard.</a>
        <a href="#" class="list-group-item list-group-item-action">Your password was changed successfully.</a>
        <a href="#" class="list-group-item list-group-item-action">Special offer just for you - Click here to find out more!</a>
    </div>
    <div class="mt-4">
        <a href="normalPage.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
