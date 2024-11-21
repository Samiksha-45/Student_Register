package student_mangement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {

    String url = "jdbc:postgresql://localhost:5432/studentdb?user=postgres&password=root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");
        String stid = request.getParameter("stid");
        String password = request.getParameter("password");

        try {
            // Load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(url);

            // Check if the email or student ID already exists
            String checkSql = "SELECT COUNT(*) FROM register WHERE email = ? OR phoneno = ?";
            PreparedStatement checkStatement = conn.prepareStatement(checkSql);
            checkStatement.setString(1, email);
            checkStatement.setString(2, phoneno);
            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            if (count > 0) {
                // Duplicate entry found, set error message
                request.setAttribute("Message", "Registration failed. Email or Student ID already exists.");
            } else {
                // No duplicate found, proceed with insertion
                String sql = "INSERT INTO register (username, email, phoneno, stid, password) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, email);
                statement.setString(3, phoneno);
                statement.setString(4, stid);
                statement.setString(5, password); // Consider hashing the password in production

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("Message", "Registration successful! Please login.");
                } else {
                    request.setAttribute("Message", "Registration failed. Please try again.");
                }
                
            }

            
            conn.close();

            // Forward to login.jsp with message
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
