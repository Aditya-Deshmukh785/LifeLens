<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("userName");
    String userPicture = (String) session.getAttribute("userPicture");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Symptom Diagnostic - LifeLens</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0f172a;
            color: #f8fafc;
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

        .profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
        }

        .form-container {
            max-width: 800px;
            margin: 40px auto;
            background-color: #1e293b;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        h1, h2 {
            color: #22c55e;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: 500;
        }

        input, select, textarea {
            padding: 10px;
            border-radius: 6px;
            border: none;
            font-size: 1em;
            width: 100%;
            background-color: white;
            color: #f8fafc;
        }

        textarea {
            resize: vertical;
        }

        .section {
            background-color: #334155;
            padding: 20px;
            border-radius: 10px;
        }

        .submit-btn {
            background-color: #22c55e;
            color: #0f172a;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            padding: 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #1cb74d;
        }

        .disclaimer {
            text-align: center;
            font-size: 0.9em;
            color: #cbd5e1;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">LifeLens 🩺</div>
        <div class="profile">
            <span><%= userName %></span>
            <img src="<%= userPicture %>" alt="User Picture">
        </div>
    </nav>

    <div class="form-container">
        <h1>Symptom Diagnostic Survey</h1>
        <form action="SymptomProcessor.jsp" method="post">
            <div class="section">
                <h2>👤 Personal Details</h2>
                <label>Full Name</label>
                <input type="text" name="name" required>

                <label>Age</label>
                <input type="number" name="age" min="0" required>

                <label>Gender</label>
                <select name="gender" required>
                    <option value="">Select Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="section">
                <h2>🩺 Symptom Information</h2>
                <label>Your Symptoms</label>
                <textarea name="symptoms" placeholder="e.g. headacge,sore throat, faituge..." required></textarea>

                <label>Duration of Symptoms</label>
                <input type="text" name="duration" placeholder="e.g. 3 days, 1 week" required>
            </div>

            <div class="section">
                <h2>📋 Medical Background</h2>
                <label>Any existing medical conditions?</label>
                <textarea name="existing" placeholder="e.g. diabetes, asthma, none"></textarea>
            </div>

            <button type="submit" class="submit-btn">Get Diagnostic Suggestions</button>
            <a href="SelectSurvey.html" class="submit-btn" style="text-align:center; display:block; text-decoration:none;">BACK</a>

            <p class="disclaimer">
                <strong>Disclaimer:</strong> This tool provides AI-based insights only. For any health condition, consult a qualified medical professional.
            </p>
        </form>
    </div>
</body>
</html>
