package student_mangement;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
   

    String url="jdbc:postgresql://localhost:5432/studentdb?user=postgres&password=root";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

       PrintWriter out = response.getWriter();

     
        try {
       
            Class.forName("org.postgresql.Driver");

            
            Connection conn = DriverManager.getConnection(url);

           
            String sql = "SELECT * FROM register WHERE email = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);

       
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	HttpSession session = request.getSession();
                session.setAttribute("email", resultSet.getString("email"));
         
                response.sendRedirect("homepage.jsp");
            } else {
                // Show error message if login fails
//                out.println("<h2>Invalid username or password</h2>");
//                out.println("<a href='login.jsp'>Try Again !!</a>");
            	 request.setAttribute("error", "  Invalid Email or password.");
                 request.getRequestDispatcher("login.jsp").forward(request, response);
            }

           
         
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h2>Database error: " + e.getMessage() + "</h2>");
        } finally {
            out.close();
        }
    }
}
