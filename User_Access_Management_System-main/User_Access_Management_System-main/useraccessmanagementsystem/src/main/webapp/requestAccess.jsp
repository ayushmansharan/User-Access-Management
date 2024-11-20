<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, useraccessmanagementsystem.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>Request Software Access</h2>
        <form action="requestAccess" method="post">
            <label>Software Name:</label>
            <select name="software_id" required>
                <%
                    try (Connection conn = DBConnection.getConnection()) {
                        PreparedStatement stmt = conn.prepareStatement("SELECT id, name FROM software");
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("name") + "</option>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            
            <label>Access Type:</label>
            <select name="access_type" required>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select>
            
            <label>Reason:</label>
            <textarea name="reason" required placeholder="Explain why you need access..."></textarea>
            
            <input type="submit" value="Submit Request" class="btn-submit" />
        </form>
    </div>
</body>
</html>
