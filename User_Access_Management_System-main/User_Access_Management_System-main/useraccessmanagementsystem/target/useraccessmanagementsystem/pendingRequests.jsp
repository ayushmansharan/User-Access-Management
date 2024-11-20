<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, useraccessmanagementsystem.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Requests</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h2>Pending Access Requests</h2>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Employee Name</th>
                        <th>Software</th>
                        <th>Access Type</th>
                        <th>Reason</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try (Connection conn = DBConnection.getConnection()) {
                            PreparedStatement stmt = conn.prepareStatement(
                                "SELECT r.id, u.username, s.name, r.access_type, r.reason FROM requests r " +
                                "JOIN users u ON r.user_id = u.id " +
                                "JOIN software s ON r.software_id = s.id " +
                                "WHERE r.status = 'Pending'");
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("access_type") %></td>
                        <td><%= rs.getString("reason") %></td>
                        <td class="action-buttons">
                            <form action="approveRequest" method="post">
                                <input type="hidden" name="request_id" value="<%= rs.getInt("id") %>" />
                                <button type="submit" name="action" value="approve" class="btn-approve"><i class="fas fa-check-circle"></i> Approve</button>
                                <button type="submit" name="action" value="reject" class="btn-reject"><i class="fas fa-times-circle"></i> Reject</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
