
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="content-container">
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