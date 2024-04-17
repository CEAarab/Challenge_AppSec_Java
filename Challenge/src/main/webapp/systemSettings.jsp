
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
  <h1>System Settings</h1>
  <p>Adjust system configurations and parameters here.</p>
  <form action="/Challenge_war/systemSettings.jsp" method="post">
    <div class="form-group">
      <label for="maxLoginAttempts">Maximum Login Attempts:</label>
      <input type="number" class="form-control" id="maxLoginAttempts" name="maxLoginAttempts" value="5">
    </div>
    <div class="form-group">
      <label for="maintenanceMode">Maintenance Mode:</label>
      <select class="form-control" id="maintenanceMode" name="maintenanceMode">
        <option value="disabled">Disabled</option>
        <option value="enabled">Enabled</option>
      </select>
    </div>
    <button class="btn btn-primary">Update Settings</button>
  </form>
  <div class="mt-4">
    <a href="/Challenge_war/adminPage.jsp" class="btn btn-primary">Back to Dashboard</a>
  </div>
</div>
</body>
</html>
