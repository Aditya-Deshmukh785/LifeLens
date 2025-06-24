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
        *, *::before, *::after {
            box-sizing: border-box;
        }

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
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: none;
            font-size: 1em;
            background-color: white;
            color: black;
        }

        textarea {
            resize: vertical;
        }

        .section {
            background-color: #334155;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .checkbox-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin: 10px 0 20px;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
        }

        .checkbox-group label span {
            margin-left: 8px;
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
            text-align: center;
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
        
        a {
            text-decoration: none;
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

        <!-- Personal Details -->
        <div class="section">
            <h2>👤 Personal Details</h2>
            <label>Full Name</label>
            <input type="text" name="name" placeholder="Ajay Kapoor" required>
            <label>Age</label>
            <input type="number" name="age" placeholder="22" required>
            <label>Gender</label>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>
        </div>

        <!-- Symptoms -->
        <div class="section">
            <h2>🧠 Symptoms (Last 3–5 Days)</h2>
            <label>Select Symptoms Experienced:</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="selectedSymptoms" value="Fatigue / Always tired"><span>Fatigue / Always tired</span></label>
                <label><input type="checkbox" name="selectedSymptoms" value="Bloating / Digestive issues"><span>Bloating / Digestive issues</span></label>
                <label><input type="checkbox" name="selectedSymptoms" value="Hair fall / Brittle nails"><span>Hair fall / Brittle nails</span></label>
                <label><input type="checkbox" name="selectedSymptoms" value="Brain fog / Low concentration"><span>Brain fog / Low concentration</span></label>
                <label><input type="checkbox" name="selectedSymptoms" value="Headaches / Sleep disturbances"><span>Headaches / Sleep disturbances</span></label>
                <label><input type="checkbox" name="selectedSymptoms" value="Sudden weight gain or loss"><span>Sudden weight gain or loss</span></label>
                <label><input type="checkbox" name="selectedSymptoms" value="Mood swings / Irritability"><span>Mood swings / Irritability</span></label>
            </div>
            <label>Other Symptoms</label>
            <textarea name="symptoms" placeholder="e.g. headache, sore throat, fatigue..." required></textarea>
            <label>Duration of Symptoms</label>
            <input type="text" name="duration" placeholder="e.g. 3 days, 1 week" required>
            <label>Body Temperature (°C)</label>
            <input type="number" name="temperature" placeholder="37" step="0.1" required>
            <label>Heart Rate</label>
            <input type="number" name="heartRate" placeholder="80 bpm" required>
            <label>Blood Pressure</label>
            <input type="text" name="bp" placeholder="e.g. 120/80" required>
        </div>

        <!-- Diet -->
        <div class="section">
            <h2>🍽 Recent Diet (Last 2 Days)</h2>
            <label>What did you mostly eat?</label>
            <textarea name="dietDetails" required></textarea>
            <label>Did you eat out or order online?</label>
            <select name="ateOut">
                <option>Yes</option>
                <option>No</option>
            </select>
            <label>Sugar or junk food consumption?</label>
            <select name="junkLevel">
                <option>None</option>
                <option>Mild</option>
                <option>High</option>
            </select>
            <label>Water intake per day (liters)</label>
            <input type="number" name="waterIntake" step="0.1">
        </div>

        <!-- Sleep -->
        <div class="section">
            <h2>💤 Sleep & Rest</h2>
            <label>Total sleep hours per night</label>
            <input type="number" name="sleepHours">
            <label>Do you wake up feeling rested?</label>
            <select name="feelRested">
                <option>Yes</option>
                <option>No</option>
            </select>
            <label>Recent changes in sleep schedule?</label>
            <select name="sleepChange">
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>

        <!-- Activity -->
        <div class="section">
            <h2>🏃 Physical & Mental Activity</h2>
            <label>Did you exercise in the last 2 days?</label>
            <select name="exercisedRecently">
                <option>Yes</option>
                <option>No</option>
            </select>
            <label>Screen time excluding work (hrs/day)</label>
            <input type="number" name="screenTime">
            <label>Mood in the last few days</label>
            <select name="recentMood">
                <option>Stable</option>
                <option>Anxious</option>
                <option>Irritable</option>
                <option>Low</option>
            </select>
            <label>Stress/workload increased?</label>
            <select name="stressIncreased">
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>

        <!-- Medical -->
        <div class="section">
            <h2>🧬 Medical Background</h2>
            <label>Any existing medical conditions?</label>
            <textarea name="existing" placeholder="e.g. diabetes, asthma, none"></textarea>
            <label>Current Medications</label>
            <textarea name="medications" placeholder="e.g. paracetamol, insulin"></textarea>
            <label>Known Allergies</label>
            <textarea name="allergies" placeholder="e.g. peanuts, pollen, none"></textarea>
            <label>Recent Travel History</label>
            <textarea name="travelHistory" placeholder="e.g. visited Delhi last week, traveled abroad recently"></textarea>
            <label>Recent illness, fever, or infection?</label>
            <select name="recentIllness">
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>

        <!-- Submit -->
        <button type="submit" class="submit-btn">Get AI Diagnosis</button>
        <a href="SelectSurveyLoggedIN.jsp" class="submit-btn">⬅ BACK</a>
        <p class="disclaimer">
            <strong>Disclaimer:</strong> This tool provides AI-based suggestions only. Always consult a certified doctor for diagnosis or treatment.
        </p>
    </form>
</div>
</body>
</html>
