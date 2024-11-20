<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>Add New Software</h2>
        <form action="createSoftware" method="post">
            <label>Software Name:</label>
            <input type="text" name="name" required />
            
            <label>Description:</label>
            <textarea name="description" required></textarea>
            
            <label>Access Levels:</label>
            <input type="checkbox" name="access_levels" value="Read" /> Read
            <input type="checkbox" name="access_levels" value="Write" /> Write
            <input type="checkbox" name="access_levels" value="Admin" /> Admin
            
            <input type="submit" value="Create" class="btn-create" />
        </form>
    </div>
</body>
</html>
