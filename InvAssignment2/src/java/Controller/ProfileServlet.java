package Controller;

import java.io.IOException;
import java.sql.*; // REQUIRED FOR JDBC
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import Controller.ProfileBean; // REQUIRED: You must create this class (see Step 2)

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. RETRIEVE DATA
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String introduction = request.getParameter("introduction");
        String whatsapp = request.getParameter("whatsapp");
        String instagram = request.getParameter("instagram");
        
        // 2. CREATE PROFILEBEAN OBJECT 
        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntroduction(introduction);
        profile.setWhatsapp(whatsapp);
        profile.setInstagram(instagram);

        // 3. INSERT INTO DATABASE 
        try {
            
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentprofiles");
            
            String sql = "INSERT INTO profile (name, studentId, program, email, whatsapp, instagram, hobbies, introduction) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            // Set values from the Bean object
            stmt.setString(1, profile.getName());
            stmt.setString(2, profile.getStudentId());
            stmt.setString(3, profile.getProgram());
            stmt.setString(4, profile.getEmail());
            stmt.setString(5, profile.getWhatsapp());
            stmt.setString(6, profile.getInstagram());
            stmt.setString(7, profile.getHobbies());
            stmt.setString(8, profile.getIntroduction());
            
            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // 4. FORWARD TO JSP
        
        request.setAttribute("profile", profile); 
        
        
        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("program", program);
        request.setAttribute("email", email);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("introduction", introduction);
        request.setAttribute("whatsapp", whatsapp);
        request.setAttribute("instagram", instagram);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}