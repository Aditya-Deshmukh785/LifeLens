<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help - LifeLens</title>
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

        ul {
            padding-left: 20px;
        }

        ul li {
            margin-bottom: 10px;
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
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="logo">LifeLens 🩺</div>
    <ul>
        <li><a href="Entry.html">Home</a></li>
        <li><a href="login.jsp">Survey</a></li>
        <li><a href="help.jsp">Help</a></li>
        <li><a href="#">About</a></li>
    </ul>
</nav>

<!-- Help Content -->
<div class="container">
    <h1>Help & Support</h1>

    <section>
        <h2>🔍 What is LifeLens?</h2>
        <p>LifeLens is your AI-powered health companion that provides personalized lifestyle insights based on your responses to a simple survey. It helps you understand your habits and suggests ways to improve your health—completely free.</p>
    </section>

    <section>
        <h2>🚀 Getting Started</h2>
        <ul>
            <li><strong>Step 1:</strong> Go to the <a href="Entry.html">Home page</a> and click "Click Here To Start".</li>
            <li><strong>Step 2:</strong> Select your survey category and begin answering questions.</li>
            <li><strong>Step 3:</strong> Once submitted, your health insights will be shown instantly.</li>
        </ul>
    </section>

    <section>
        <h2>🧠 Features</h2>
        <ul>
            <li>💡 Tailored health suggestions based on your lifestyle.</li>
            <li>📊 Easy-to-understand output – no medical jargon.</li>
            <li>⚡ Fast, lightweight, and completely browser-based.</li>
            <li>🔒 No login required for basic usage. 100% privacy.</li>
        </ul>
    </section>

    <section>
        <h2>❓ Frequently Asked Questions</h2>
        <p><strong>Q:</strong> Is LifeLens a replacement for a doctor?<br>
           <strong>A:</strong> No. LifeLens is designed for informational and awareness purposes only. Always consult a professional for medical advice.</p>

        <p><strong>Q:</strong> Do I need to sign up?<br>
           <strong>A:</strong> No, you can use it freely. However, future versions may include user accounts for history tracking.</p>
    </section>

    <section>
        <h2>📬 Contact Us</h2>
        <p>If you have feedback or face issues, please email us at <a href="mailto:support@lifelens.health">support@lifelens.health</a>.</p>
    </section>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 LifeLens. Designed with ❤️ to make health simple.
</footer>

</body>
</html>
