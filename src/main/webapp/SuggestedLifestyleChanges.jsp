<% out.println("DEBUG: " + request.getAttribute("aiSuggestion")); %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Suggestions - LifeLens</title>
    <style>
        body {
            margin: 0;
            background-color: #0f172a;
            color: #f8fafc;
            font-family: 'Segoe UI', sans-serif;
        }

        nav {
            background-color: #092249;
            padding: 14px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5em;
            font-weight: bold;
            color: #22c55e;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 30px;
            margin: 0;
            padding: 0;
        }

        nav ul li a {
            text-decoration: none;
            color: #f8fafc;
            font-size: 1em;
        }

        nav ul li a:hover {
            color: #22c55e;
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #22c55e;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background-color: #1e293b;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
        }

        h1 {
            color: #22c55e;
            text-align: center;
            margin-bottom: 30px;
        }

        .ai-output {
            line-height: 1.8;
            font-size: 1.1em;
            background-color: #334155;
            padding: 20px;
            border-radius: 10px;
            color: #f8fafc;
        }

        .back-button {
            display: block;
            margin: 30px auto 0;
            padding: 12px 24px;
            background-color: #22c55e;
            color: #0f172a;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            font-size: 1em;
        }

        .back-button:hover {
            background-color: #15803d;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">LifeLens 🩺</div>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="SelectSurveyLoggedIN.jsp">Survey</a></li>
            <li><a href="#">Help</a></li>
            <li><a href="#">About</a></li>
        </ul>
        <div class="profile-info">
            <span><%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "" %></span>
            <%
                String pic = (String) session.getAttribute("userPicture");
                if (pic != null && !pic.isEmpty()) {
            %>
                <img src="<%= pic %>" alt="Profile">
            <%
                }
            %>
        </div>
    </nav>

    <div class="container">
        <h1>🧠 AI-Powered Lifestyle Insight</h1>

        <div class="ai-output">
            <%= request.getAttribute("aiSuggestion") != null ? request.getAttribute("aiSuggestion") : "No suggestion received." %>
        </div>

        <a href="LifestyleSurveyForm" class="back-button">🔙 Go Back to Survey</a>
    </div>

</body>
</html>
