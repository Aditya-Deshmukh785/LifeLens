<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - LifeLens</title>
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

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        h1, h2 {
            color: #22c55e;
        }

        section {
            margin-bottom: 40px;
            background-color: #1e293b;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }

        p, li {
            font-size: 1.1em;
            line-height: 1.7;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #94a3b8;
            background-color: #092249;
            font-size: 0.9em;
        }

        a {
            color: #38bdf8;
        }

        a:hover {
            color: #22c55e;
        }

        /* Back Button Styling */
        .back-button-container {
            text-align: center;
            margin: 50px 0 30px;
        }

        .back-button {
            padding: 12px 24px;
            background-color: #16a34a;
            color: white;
            text-decoration: none;
            font-size: 1em;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            display: inline-block;
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
</nav>

<!-- About Content -->
<div class="container">
    <h1>About LifeLens</h1>

    <section>
        <h2>💡 Our Vision</h2>
        <p>LifeLens was built with a simple yet powerful mission: to empower every individual to take control of their health using the power of technology. We believe health guidance should be accessible, understandable, and personalized — and that’s exactly what LifeLens delivers.</p>
    </section>

    <section>
        <h2>🛠️ How It Works</h2>
        <ul>
            <li>You fill out a quick lifestyle survey on sleep, food, fitness, and stress.</li>
            <li>Our system analyzes your responses using predefined logic and AI recommendations.</li>
            <li>You receive instant feedback and suggestions tailored to your habits and patterns.</li>
        </ul>
    </section>

    <section>
        <h2>👨‍💻 Who We Are</h2>
        <p>We are a team of passionate computer science students and developers who care deeply about using our skills for real-world impact. This project is part of our academic and social initiative to combine technology with health awareness.</p>
    </section>

    <section>
        <h2>📫 Contact</h2>
        <p>If you'd like to collaborate, give feedback, or just say hello, email us at: <a href="mailto:support@lifelens.health">support@lifelens.health</a></p>
    </section>
</div>

<!-- Themed Back Button -->
<div class="back-button-container">
    <a href="Entry.html" class="back-button"> Go Back</a>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 LifeLens. Created with ❤️ for better living.
</footer>

</body>
</html>
