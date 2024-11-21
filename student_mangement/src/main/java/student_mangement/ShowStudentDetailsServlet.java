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


@WebServlet("/StudentDetailsServlet")
public class ShowStudentDetailsServlet extends HttpServlet {
   

    String url="jdbc:postgresql://localhost:5432/studentdb?user=postgres&password=root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = (String) request.getSession().getAttribute("email");

        try {

            Class.forName("org.postgresql.Driver");
 Connection conn = DriverManager.getConnection(url);

            String sql = "SELECT * FROM register WHERE email = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
               
                request.setAttribute("student", resultSet);
                
                request.getRequestDispatcher("showStudentDetails.jsp").forward(request, response);
            } else {
                response.getWriter().println("No student found with email: " + email);
            }

           
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
