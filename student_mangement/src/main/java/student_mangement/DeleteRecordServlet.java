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

@WebServlet("/DeleteRecordServlet")
public class DeleteRecordServlet extends HttpServlet {

    private static final String URL = "jdbc:postgresql://localhost:5432/studentdb?user=postgres&password=root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Check if email is null
        

        try (Connection conn = DriverManager.getConnection(URL)) {
            String sql = "DELETE FROM register WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    request.setAttribute("message", "Record deleted successfully.");
                    session.invalidate(); // Invalidate session after deletion if user record is deleted
                } else {
                    request.setAttribute("message", "Record not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while deleting the record.");
        }

        // Forward back to the original page with the message
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
