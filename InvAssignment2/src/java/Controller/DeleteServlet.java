package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        
        try {
            
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentprofiles");
            
            
            // DELETE BASED ON USER ID
            String sql = "DELETE FROM profile WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            
            pstmt.executeUpdate();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Redirect back to the list
        response.sendRedirect("viewProfiles.jsp");
    }
}