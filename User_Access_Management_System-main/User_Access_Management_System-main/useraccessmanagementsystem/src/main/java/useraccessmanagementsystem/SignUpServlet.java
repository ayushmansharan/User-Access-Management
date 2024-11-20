package useraccessmanagementsystem;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (username, password, role) VALUES (?, ?, 'Employee')");
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
