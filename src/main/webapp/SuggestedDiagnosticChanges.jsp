<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Diagnosis - LifeLens</title>
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
            font-size: 1.05em;
            background-color: #334155;
            padding: 24px;
            border-radius: 10px;
            color: #f8fafc;
        }

        .section-title {
            font-size: 1.4rem;
            font-weight: 800;
            color: #22c55e;
            margin-top: 25px;
            margin-bottom: 12px;
            display: block;
        }

        .greeting-text {
            font-weight: 500;
            font-size: 1.05rem;
            color: #ffffff;
            margin-bottom: 16px;
        }

        .back-button {
            display: block;
            margin: 30px auto 10px;
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

        .sub-heading {
            color: #f8fafc;
            font-weight: bold;
            font-size: 1.1rem;
            display: block;
            margin-bottom: 4px;
        }

        .output-line {
            margin-bottom: 12px;
            line-height: 1.65;
        }

        .disclaimer {
            font-size: 0.85rem;
            color: #94a3b8;
            text-align: center;
            margin-top: 25px;
        }
    </style>
</head>
<body>

<nav>
    <div class="logo">LifeLens 🩺</div>
    <ul>
        <li><a href="Entry.html">Home</a></li>
        <li><a href="SelectSurveyLoggedIN.jsp">Survey</a></li>
        <li><a href="help.jsp">Help</a></li>
        <li><a href="about.jsp">About</a></li>
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
    <h1>🧠 AI Diagnosis Result</h1>

    <div class="ai-output">
        <%
            String suggestion = (String) request.getAttribute("aiSuggestion");

            if (suggestion != null && !suggestion.trim().isEmpty()) {
                suggestion = suggestion.replaceAll("\\r", "");
                String[] lines = suggestion.split("\\n");

                for (String line : lines) {
                    line = line.trim();

                    if (line.startsWith("* ")) {
                        line = line.substring(2);
                    } else if (line.startsWith("*")) {
                        line = line.substring(1);
                    }

                    line = line.replaceAll("\\*\\*(.*?)\\*\\*", "<span class='sub-heading'>$1</span>");

                    // skip lines that look like "Disclaimer:"
                    if (!line.toLowerCase().startsWith("disclaimer:")) {
                        out.println("<div class='output-line'>" + line + "</div>");
                    }
                }
            } else {
                out.print("No diagnosis received.");
            }
        %>
    </div>

    <a href="SymptomDiagnosticForm.jsp" class="back-button">🔙 Go Back to Survey</a>
    <div class="disclaimer">
        This is an AI-generated diagnosis and should not replace professional medical advice. Please consult a doctor for clinical evaluation.
    </div>
</div>
</body>
</html>
