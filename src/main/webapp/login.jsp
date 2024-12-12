<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Login</title>
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #28a745;
        }
        .btn-success {
            width: 100%;
        }
        .text-center a {
            color: #28a745;
        }
        .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2 class="text-center mb-4">Welcome Back</h2>
    <form action="/login" method="post">
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">Phone Number</label>
            <input class="form-control" type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input class="form-control" type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button class="btn btn-success" type="submit">LOGIN</button>
    </form>
</div>
</body>
</html>
