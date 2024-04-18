
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
<h1>Enter OTP</h1>
<form action="recovery" method="post">
    <input type="hidden" name="action" value="reset">
    <p>Username: <input type="text" name="username"></p>
    <p>OTP: <input type="text" name="otp"></p>
    <p>New Password: <input type="password" name="newPassword"></p>
    <p><input type="submit" value="Reset Password"></p>
</form>
</div>
</div>
</div>
</body>
</html>
