<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="signup" method="post">
            <div class="input-group">
                <i class="fas fa-user-plus"></i>
                <input type="text" name="username" placeholder="Choose Username" required />
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Create Password" required />
            </div>
            <input type="submit" value="Sign Up" class="btn-signup" />
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
