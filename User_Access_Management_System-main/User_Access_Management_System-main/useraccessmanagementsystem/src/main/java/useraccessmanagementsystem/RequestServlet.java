package useraccessmanagementsystem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String softwareIdParam = request.getParameter("software_id");
        String accessType = request.getParameter("access_type");
        String reason = request.getParameter("reason");
        String username = (String) request.getSession().getAttribute("username");

        int softwareId;
        try {
            softwareId = Integer.parseInt(softwareIdParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid software ID");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
        	
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES ((SELECT id FROM users WHERE username=?), ?, ?, ?, 'Pending')");
            stmt.setString(1, username);
            stmt.setInt(2, softwareId);
            stmt.setString(3, accessType);
            stmt.setString(4, reason);
            stmt.executeUpdate();
            response.sendRedirect("requestAccess.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
