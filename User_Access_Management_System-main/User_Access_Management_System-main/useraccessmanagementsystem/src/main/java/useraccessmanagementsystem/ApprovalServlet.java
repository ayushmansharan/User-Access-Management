package useraccessmanagementsystem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/approveRequest")
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestIdParam = request.getParameter("request_id");
        String action = request.getParameter("action");

        // Convert requestId to an integer
        int requestId;
        try {
            requestId = Integer.parseInt(requestIdParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request ID");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE requests SET status=? WHERE id=?"
            );
            stmt.setString(1, action.equalsIgnoreCase("approve") ? "Approved" : "Rejected");
            stmt.setInt(2, requestId); // Use setInt() for integer columns
            stmt.executeUpdate();
            
            response.sendRedirect("pendingRequests.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
