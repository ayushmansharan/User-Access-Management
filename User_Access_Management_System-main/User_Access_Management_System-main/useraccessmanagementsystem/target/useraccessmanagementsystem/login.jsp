<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>User Login</h2>
        <form action="login" method="post">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Enter Username" required />
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Enter Password" required />
            </div>
            <input type="submit" value="Login" class="btn-login" />
        </form>
        <p>Don't have an account? <a href="signup.jsp">Create one</a></p>
    </div>
</body>
</html>
