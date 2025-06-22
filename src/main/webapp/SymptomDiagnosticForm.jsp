<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Symptom Survey | LifeLens</title>
    <style>
        body {
            background-color: #0f172a;
            color: #f8fafc;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #092249;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        nav .logo {
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
            color: #f8fafc;
            text-decoration: none;
            font-size: 1em;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #22c55e;
        }

        .form-container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #1e293b;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #f1f5f9;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #f8fafc;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: none;
            background-color: #334155;
            color: #f8fafc;
            font-size: 1em;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        .btn {
            display: block;
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background-color: #16a34a;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #15803d;
        }
    </style>
</head>
<body>

    <nav>
        <div class="logo">LifeLens 🩺</div>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="symptom_survey.jsp">Symptom Survey</a></li>
            <li><a href="#">Help</a></li>
            <li><a href="#">About</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <h2>Symptom Diagnostic Form</h2>
        <form action="SymptomProcessor.jsp" method="post">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" min="0" required>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select Gender</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>

            <label for="symptoms">Your Symptoms:</label>
            <textarea id="symptoms" name="symptoms" placeholder="e.g. headache, sore throat, fatigue..." required></textarea>

            <label for="duration">How long have you had these symptoms?</label>
            <input type="text" id="duration" name="duration" placeholder="e.g. 3 days, 1 week" required>

            <label for="existing">Any existing medical conditions?</label>
            <textarea id="existing" name="existing" placeholder="e.g. diabetes, asthma, none"></textarea>

            <button type="submit" class="btn">Submit</button>
        </form>
    </div>

</body>
</html>
