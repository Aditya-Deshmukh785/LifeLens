<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userName = (String) session.getAttribute("userName");
    String userPicture = (String) session.getAttribute("userPicture");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lifestyle Survey - LifeLens</title>
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
            margin-bottom: 5px;
            font-weight: 500;
        }

        input, select, textarea {
            padding: 10px;
            border-radius: 6px;
            border: none;
            font-size: 1em;
            width: 100%;
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
                        text-align: center;
            
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
        <h1>Lifestyle Risk Assessment</h1>
        <form action="SuggestedLifestyleChanges.jsp" method="post">
            <div class="section">
                <h2>📋 General Information</h2>
                <label>Full Name</label>
                <input type="text" name="fullName" required>

                <label>Age</label>
                <input type="number" name="age" required>

                <label>Gender</label>
                <select name="gender" required>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>

                <label>Height (cm)</label>
                <input type="number" name="height" required>

                <label>Weight (kg)</label>
                <input type="number" name="weight" required>
            </div>

            <div class="section">
                <h2>🍿 Sleep Habits</h2>
                <label>Average sleep duration (hrs)</label>
                <input type="number" name="sleepDuration" required>

                <label>Sleep timing (e.g. 10 PM - 6 AM)</label>
                <input type="text" name="sleepTiming" required>

                <label>Sleep quality</label>
                <select name="sleepQuality">
                    <option>Poor</option>
                    <option>Fair</option>
                    <option>Good</option>
                    <option>Excellent</option>
                </select>
            </div>

            <div class="section">
                <h2>🍽️ Diet & Nutrition</h2>
                <label>Number of meals per day</label>
                <select name="mealsPerDay">
                    <option>1</option><option>2</option><option>3</option><option>4</option><option>5+</option>
                </select>

                <label>Snacking frequency</label>
                <select name="snacking">
                    <option>Never</option><option>Sometimes</option><option>Frequently</option>
                </select>

                <label>Water intake (liters/day)</label>
                <input type="number" name="waterIntake" step="0.1">

                <label>Junk food consumption</label>
                <select name="junkFood">
                    <option>Never</option><option>Rarely</option><option>Often</option><option>Daily</option>
                </select>

                <label>Fruit/vegetable servings per day</label>
                <input type="number" name="fruitVegServings">
            </div>

            <div class="section">
                <h2>🏃‍ Physical Activities</h2>
                <label>Exercise frequency/week</label>
                <select name="exerciseFrequency">
                    <option>None</option><option>1-2 days</option><option>3-5 days</option><option>Daily</option>
                </select>

                <label>Exercise duration (minutes)</label>
                <input type="number" name="exerciseDuration">

                <label>Type of activity</label>
                <select name="activityType" multiple>
                    <option>Walking</option><option>Gym</option><option>Yoga</option><option>Sports</option><option>None</option>
                </select>
            </div>

            <div class="section">
                <h2>🫠 Mental Wellness</h2>
                <label>Stress level</label>
                <select name="stress">
                    <option>Low</option><option>Moderate</option><option>High</option>
                </select>

                <label>Screen time (non-work hrs/day)</label>
                <input type="number" name="screenTime">

                <label>Work-life balance rating</label>
                <select name="workLife">
                    <option>Poor</option><option>Fair</option><option>Good</option><option>Excellent</option>
                </select>
            </div>

            <div class="section">
                <h2>💼 Lifestyle & Work</h2>
                <label>Type of job</label>
                <select name="jobType">
                    <option>Sedentary</option><option>Semi-active</option><option>Active</option>
                </select>

                <label>Working hours/day</label>
                <input type="number" name="workHours">

                <label>Commute time (minutes)</label>
                <input type="number" name="commuteTime">
            </div>

            <div class="section">
                <h2>⚠️ Health & Deficiency Check</h2>
                <label>How often do you fall sick in a year?</label>
                <input type="number" name="sickFrequency">

                <label>Do you experience hair fall?</label>
                <select name="hairFall">
                    <option>Yes</option><option>No</option>
                </select>

                <label>Any major disease (present or past)?</label>
                <textarea name="diseaseDetails" rows="3"></textarea>
            </div>

            <button type="submit" class="submit-btn">Get AI Generated Suggestions</button>
            <a href="SelectSurveyLoggedIN.jsp" class="submit-btn">BACK</a>
            <!-- <button type="submit" class="submit-btn">BACK</button>  -->

            <p class="disclaimer">
                <strong>Disclaimer:</strong> This survey is not a medical diagnosis tool. It uses AI to offer lifestyle suggestions based on your responses. Please consult a medical professional for health concerns.
            </p>
        </form>
    </div>
</body>
</html>
