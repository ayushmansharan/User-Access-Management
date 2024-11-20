package useraccessmanagementsystem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevels = request.getParameter("access_levels");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)");
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, accessLevels);
            stmt.executeUpdate();
            response.sendRedirect("createSoftware.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
