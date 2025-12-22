<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome <%= request.getAttribute("name") %> - Profile</title>
    <style>
        <!-- DESIGN CSS -->
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            min-height: 100vh;
            padding: 40px 20px;
        }
        
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .profile-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        .profile-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
            position: relative;
        }
        
        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 2em;
            font-weight: bold;
            color: white;
            margin-bottom: 15px;
            background: #f093fb;
        }
        
        .profile-header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .student-id {
            font-size: 1.1em;
            opacity: 0.9;
        }
        
        .profile-body {
            padding: 40px;
        }
        
        .profile-section {
            margin-bottom: 30px;
            padding-bottom: 25px;
            border-bottom: 2px solid #f0f0f0;
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }
        
        .profile-section.visible {
            opacity: 1;
            transform: translateY(0);
        }
        
        .profile-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        
        .section-title {
            color: #667eea;
            font-size: 1.1em;
            font-weight: 600;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .section-content {
            color: #333;
            font-size: 1.05em;
            line-height: 1.6;
            padding-left: 30px;
        }
        
        .introduction-box {
            background: #f8f9ff;
            padding: 20px;
            border-radius: 12px;
            border-left: 4px solid #667eea;
            margin-left: 30px;
            line-height: 1.8;
        }
        
        .hobbies-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-left: 30px;
        }
        
        .hobby-tag {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9em;
            display: inline-block;
            transition: all 0.3s ease;
        }
        
        .hobby-tag:hover {
            transform: scale(1.05);
        }
        
        .back-button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: white;
            color: #667eea;
            text-decoration: none;
            border-radius: 8px;
            border: 2px solid #667eea;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .back-button:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }
        
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        
        /* Social Media Links */
        .social-links {
            display: flex;
            gap: 15px;
            margin-left: 30px;
            flex-wrap: wrap;
        }
        
        .social-link {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 15px;
            background: #f8f9fa;
            border-radius: 8px;
            text-decoration: none;
            color: #333;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .social-link:hover {
            background: white;
            border-color: #667eea;
            transform: translateY(-2px);
        }
        
        .whatsapp-link:hover {
            border-color: #25D366;
        }
        
        .instagram-link:hover {
            border-color: #E4405F;
        }
        
        .email-link:hover {
            border-color: #667eea;
        }
    </style>
</head>
<body>
    <!-- AMBIK DATA DARI ProfileServlet -->
    <%
        String name = (String) request.getAttribute("name");
        String studentId = (String) request.getAttribute("studentId");
        String program = (String) request.getAttribute("program");
        String email = (String) request.getAttribute("email");
        String hobbies = (String) request.getAttribute("hobbies");
        String introduction = (String) request.getAttribute("introduction");
        String whatsapp = (String) request.getAttribute("whatsapp");
        String instagram = (String) request.getAttribute("instagram");
        
        String[] hobbyArray = hobbies.split(",");
    %>
    
    <!-- BAGI ADA PROFILE BASED ON FIRST WORDS NAMA  -->
    <div class="profile-container">
        <div class="profile-header">
            <div class="avatar">
                <%= name.substring(0, 1).toUpperCase() %>
            </div>
            <h1><%= name %></h1>
            <p class="student-id">Student ID: <%= studentId %></p>
        </div>
        
        <div class="profile-body">
            <div class="profile-section">
                <div class="section-title">
                    <span>🎓 Program</span>
                </div>
                <div class="section-content">
                    <%= program %>
                </div>
            </div>
            
            <!-- CLICK AND U CAN GET INTO USER SOCIAL  -->
            <div class="profile-section">
                <div class="section-title">
                    <span>📞 Contact Information</span>
                </div>
                <div class="social-links">
                    <% if (email != null && !email.isEmpty()) { %>
                        <a href="mailto:<%= email %>" class="social-link email-link">
                            <span>📧</span>
                            <span><%= email %></span>
                        </a>
                    <% } %>
                    
                    <% if (whatsapp != null && !whatsapp.isEmpty()) { %>
                        <a href="https://wa.me/<%= whatsapp.replace("+", "") %>" class="social-link whatsapp-link" target="_blank">
                            <span>💚</span>
                            <span><%= whatsapp %></span>
                        </a>
                    <% } %>
                </div>
            </div>

            <div class="profile-section">
                <div class="section-title">
                    <span>🌐 Social Media</span>
                </div>
                <div class="social-links">
                    <% if (instagram != null && !instagram.isEmpty()) { %>
                        <a href="https://instagram.com/<%= instagram.replace("@", "") %>" class="social-link instagram-link" target="_blank">
                            <span>📷</span>
                            <span><%= instagram %></span>
                        </a>
                    <% } %>
                </div>
            </div>

            <div class="profile-section">
                <div class="section-title">
                    <span>🎯 Hobbies & Interests</span>
                </div>
                <div class="hobbies-container">
                    <% for (String hobby : hobbyArray) { %>
                        <span class="hobby-tag">
                            <%= hobby.trim() %>
                        </span>
                    <% } %>
                </div>
            </div>

            <div class="profile-section">
                <div class="section-title">
                    <span>💭 About Me</span>
                </div>
                <div class="introduction-box">
                    <%= introduction %>
                </div>
            </div>
            
            <div class="button-container">
                <a href="index.html" class="back-button">
                    ← Create Another Profile
                </a>
            </div>
        </div>
    </div>

    <script>
        // SCROLL ANIMATION
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('.profile-section').forEach(section => {
            observer.observe(section);
        });

        // UNTUK ANIMATION DELAY
        document.querySelectorAll('.profile-section').forEach((section, index) => {
            section.style.transitionDelay = `${index * 0.1}s`;
        });
    </script>
</body>
</html>