<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>User Add</title>
  <style>
    body {
      background-color: #f8f9fa;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .form-container {
      background: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }
    .form-control:focus {
      box-shadow: none;
      border-color: #007bff;
    }
    .btn-primary {
      width: 100%;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2 class="text-center mb-4">Add User</h2>
  <form action="/user/create" method="post">
    <div class="mb-3">
      <label for="firstName" class="form-label">First Name</label>
      <input class="form-control" type="text" id="firstName" name="firstName" placeholder="Enter first name" required>
    </div>
    <div class="mb-3">
      <label for="lastName" class="form-label">Last Name</label>
      <input class="form-control" type="text" id="lastName" name="lastName" placeholder="Enter last name" required>
    </div>
    <div class="mb-3">
      <label for="phone" class="form-label">Phone</label>
      <input class="form-control" type="text" id="phone" name="phone" placeholder="Enter phone number" required>
    </div>
    <button class="btn btn-primary" type="submit">Submit</button>
  </form>
</div>
</body>
</html>
