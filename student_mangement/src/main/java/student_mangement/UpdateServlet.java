package student_mangement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    private static final String URL = "jdbc:postgresql://localhost:5432/studentdb?user=postgres&password=root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
       
        String email = (String) session.getAttribute("email");

        // Retrieve updated form data
        String username = request.getParameter("username");
        String phoneno = request.getParameter("phoneno");

        try (Connection conn = DriverManager.getConnection(URL)) {
            // Update username and phone number based on email
            String sql = "UPDATE register SET username = ?, phoneno = ? WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, phoneno);
                stmt.setString(3, email);

                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    request.setAttribute("message", "Update successful.");
                } else {
                    request.setAttribute("message", "Update failed. Record not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while updating the record.");
        }

        // Forward to homepage.jsp with the message
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
    }
}
