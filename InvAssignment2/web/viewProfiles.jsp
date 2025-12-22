<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            padding: 40px;
        }
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #667eea; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .btn-delete {
            background-color: #ff4d4d; color: white; border: none;
            padding: 5px 10px; border-radius: 5px; cursor: pointer; text-decoration: none;
        }
        .nav-btn {
            display: inline-block; padding: 10px 20px; background: #667eea; color: white;
            text-decoration: none; border-radius: 5px; margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎓 Registered Students</h1>
        <a href="index.html" class="nav-btn">+ Add New Profile</a>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Program</th>
                    <th>Email</th>
                    <th>Action</th> </tr>
            </thead>
            <tbody>
                <%
                    try {
                    
                        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentprofiles");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM profile");

                        while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("studentId") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("program") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <a href="DeleteServlet?id=<%= rs.getInt("id") %>" 
                           class="btn-delete"
                           onclick="return confirm('Are you sure you want to delete this profile?')">Delete</a>
                    </td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>
            </tbody>
        </a>
    </div>
</body>
</html>