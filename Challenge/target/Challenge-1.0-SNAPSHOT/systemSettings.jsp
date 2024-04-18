
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<body>
<div class="content-container">
  <h1>System Settings</h1>
  <p>Adjust system configurations and parameters here.</p>
  <form action="systemSettings.jsp" method="post">
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
    <a href="adminPage.jsp" class="btn btn-primary">Back to Dashboard</a>
  </div>
</div>
</body>
</html>
