<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - LifeLens</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
            color: #f8fafc;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
            overflow-x: hidden;
            position: relative;
        }

        /* Animated Background Particles */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .particle {
            position: absolute;
            background: radial-gradient(circle, #22c55e 0%, transparent 70%);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite;
        }

        .particle:nth-child(1) { width: 6px; height: 6px; top: 15%; left: 15%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 4px; height: 4px; top: 70%; left: 85%; animation-delay: 2.5s; }
        .particle:nth-child(3) { width: 5px; height: 5px; top: 85%; left: 25%; animation-delay: 5s; }
        .particle:nth-child(4) { width: 3px; height: 3px; top: 25%; left: 75%; animation-delay: 1.5s; }
        .particle:nth-child(5) { width: 4px; height: 4px; top: 60%; left: 60%; animation-delay: 3.5s; }
        .particle:nth-child(6) { width: 5px; height: 5px; top: 40%; left: 10%; animation-delay: 6s; }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); opacity: 0.6; }
            50% { transform: translateY(-30px) rotate(180deg); opacity: 1; }
        }

        nav {
            background: rgba(9, 34, 73, 0.95);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(34, 197, 94, 0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 40px;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        nav .logo {
            font-size: 1.8em;
            font-weight: 700;
            background: linear-gradient(45deg, #22c55e, #38bdf8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 0 20px rgba(34, 197, 94, 0.3);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 20px;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 80px;
            position: relative;
        }

        .hero-title {
            font-size: 4em;
            font-weight: 800;
            background: linear-gradient(45deg, #22c55e, #38bdf8, #a855f7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 20px;
            animation: slideInFromTop 1s ease-out;
            text-shadow: 0 0 40px rgba(34, 197, 94, 0.3);
        }

        .hero-subtitle {
            font-size: 1.4em;
            color: #cbd5e1;
            max-width: 700px;
            margin: 0 auto 40px;
            animation: slideInFromBottom 1s ease-out 0.3s both;
            line-height: 1.6;
            font-weight: 300;
        }

        @keyframes slideInFromTop {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideInFromBottom {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .about-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 40px;
            margin-bottom: 80px;
        }

        .about-card {
            background: linear-gradient(135deg, rgba(30, 41, 59, 0.8) 0%, rgba(15, 23, 42, 0.9) 100%);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: 25px;
            padding: 50px 40px;
            position: relative;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            cursor: pointer;
            animation: fadeInUp 0.8s ease-out;
        }

        .about-card:nth-child(1) { animation-delay: 0.1s; }
        .about-card:nth-child(2) { animation-delay: 0.3s; }
        .about-card:nth-child(3) { animation-delay: 0.5s; }
        .about-card:nth-child(4) { animation-delay: 0.7s; }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .about-card:hover {
            transform: translateY(-15px) scale(1.03);
            border-color: #22c55e;
            box-shadow: 0 30px 60px rgba(34, 197, 94, 0.25);
        }

        .about-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(34, 197, 94, 0.1), transparent);
            transition: left 0.7s;
        }

        .about-card:hover::before {
            left: 100%;
        }

        .card-icon {
            font-size: 4em;
            margin-bottom: 25px;
            display: block;
            filter: drop-shadow(0 0 20px rgba(34, 197, 94, 0.5));
            animation: bounce 3s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-15px); }
            60% { transform: translateY(-8px); }
        }

        .card-title {
            font-size: 2em;
            font-weight: 700;
            color: #22c55e;
            margin-bottom: 20px;
            text-align: center;
        }

        .card-content {
            color: #cbd5e1;
            line-height: 1.7;
            font-size: 1.1em;
        }

        .card-content ul {
            list-style: none;
            padding: 0;
        }

        .card-content li {
            margin-bottom: 15px;
            padding-left: 25px;
            position: relative;
        }

        .card-content li::before {
            content: '✦';
            position: absolute;
            left: 0;
            color: #22c55e;
            font-size: 1.2em;
            animation: sparkle 2s ease-in-out infinite;
        }

        .card-content li:nth-child(2)::before { animation-delay: 0.5s; }
        .card-content li:nth-child(3)::before { animation-delay: 1s; }

        @keyframes sparkle {
            0%, 100% { transform: scale(1) rotate(0deg); opacity: 0.7; }
            50% { transform: scale(1.2) rotate(180deg); opacity: 1; }
        }

        .team-showcase {
            background: linear-gradient(135deg, rgba(30, 41, 59, 0.6) 0%, rgba(15, 23, 42, 0.8) 100%);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: 30px;
            padding: 60px 50px;
            margin-bottom: 60px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .team-showcase::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(34, 197, 94, 0.05) 0%, transparent 70%);
            animation: rotate 25s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .team-title {
            font-size: 2.5em;
            font-weight: 700;
            background: linear-gradient(45deg, #22c55e, #38bdf8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 30px;
            position: relative;
            z-index: 10;
        }

        .team-description {
            font-size: 1.3em;
            color: #cbd5e1;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 10;
        }

        .contact-section {
            background: linear-gradient(135deg, rgba(56, 189, 248, 0.1) 0%, rgba(34, 197, 94, 0.1) 100%);
            border: 1px solid rgba(34, 197, 94, 0.3);
            border-radius: 25px;
            padding: 50px 40px;
            text-align: center;
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
        }

        .contact-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            animation: shine 4s ease-in-out infinite;
        }

        @keyframes shine {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .contact-title {
            font-size: 2.2em;
            font-weight: 700;
            color: #22c55e;
            margin-bottom: 20px;
        }

        .contact-text {
            font-size: 1.2em;
            color: #cbd5e1;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .contact-email {
            color: #38bdf8;
            font-size: 1.3em;
            font-weight: 600;
            text-decoration: none;
            padding: 15px 30px;
            border: 2px solid #38bdf8;
            border-radius: 50px;
            display: inline-block;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .contact-email::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: #38bdf8;
            transition: left 0.8s ease;
            z-index: -1;
        }

        .contact-email:hover {
            color: #0f172a;
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(56, 189, 248, 0.3);
        }

        .contact-email:hover::before {
            left: 0;
        }

        .cta-section {
            text-align: center;
            margin-bottom: 60px;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 20px 45px;
            background: linear-gradient(45deg, #16a34a, #22c55e);
            color: white;
            text-decoration: none;
            font-size: 1.2em;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 15px 35px rgba(34, 197, 94, 0.3);
            position: relative;
            overflow: hidden;
        }

        .back-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }

        .back-button:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 25px 50px rgba(34, 197, 94, 0.4);
            color: white;
        }

        .back-button:hover::before {
            left: 100%;
        }

        footer {
            text-align: center;
            padding: 40px 20px;
            color: #64748b;
            background: linear-gradient(135deg, rgba(9, 34, 73, 0.8) 0%, rgba(15, 23, 42, 0.9) 100%);
            backdrop-filter: blur(20px);
            border-top: 1px solid rgba(34, 197, 94, 0.2);
            font-size: 1.1em;
            position: relative;
        }

        @media (max-width: 768px) {
            .hero-title { font-size: 2.8em; }
            .about-grid { grid-template-columns: 1fr; gap: 30px; }
            .about-card { padding: 40px 30px; }
            .container { padding: 40px 15px; }
            nav { padding: 12px 20px; }
            .team-showcase { padding: 40px 30px; }
        }
    </style>
</head>
<body>
    <!-- Animated Background Particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">LifeLens 🩺</div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Hero Section -->
        <div class="hero-section">
            <h1 class="hero-title">About LifeLens</h1>
            <p class="hero-subtitle">Discover the story behind your AI-powered health companion and the passionate team dedicated to revolutionizing personal wellness through technology.</p>
        </div>

        <!-- About Cards Grid -->
        <div class="about-grid">
            <div class="about-card">
                <span class="card-icon">💡</span>
                <h2 class="card-title">Our Vision</h2>
                <div class="card-content">
                    <p>LifeLens was built with a simple yet powerful mission: to empower every individual to take control of their health using the power of technology. We believe health guidance should be accessible, understandable, and personalized — and that's exactly what LifeLens delivers.</p>
                </div>
            </div>

            <div class="about-card">
                <span class="card-icon">🛠️</span>
                <h2 class="card-title">How It Works</h2>
                <div class="card-content">
                    <ul>
                        <li>You fill out a quick lifestyle survey on sleep, food, fitness, and stress</li>
                        <li>Our system analyzes your responses using predefined logic and AI recommendations</li>
                        <li>You receive instant feedback and suggestions tailored to your habits and patterns</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Team Showcase -->
        <div class="team-showcase">
            <h2 class="team-title">👨‍💻 Who We Are</h2>
            <p class="team-description">We are a team of passionate computer science students and developers who care deeply about using our skills for real-world impact. This project is part of our academic and social initiative to combine technology with health awareness, creating solutions that make a meaningful difference in people's lives.</p>
        </div>

        <!-- Contact Section -->
        <div class="contact-section">
            <h2 class="contact-title">📫 Let's Connect</h2>
            <p class="contact-text">If you'd like to collaborate, give feedback, or just say hello, we'd love to hear from you!</p>
            <a href="https://mail.google.com/mail/?view=cm&fs=1&to=aipoweredlifelens@gmail.com" target="_blank" class="contact-email">aipoweredlifelens@gmail.com</a>
        </div>

        <!-- Call to Action -->
        <div class="cta-section">
            <a href="SelectSurveyLoggedIN.jsp" class="back-button">
                <span>🏠</span>
                Go To Survey
            </a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 LifeLens. Created with ❤️ for better living and healthier futures.</p>
    </footer>

    <script>
        // Add scroll animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        // Observe elements for animation
        document.querySelectorAll('.about-card, .team-showcase, .contact-section').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(30px)';
            el.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
            observer.observe(el);
        });

        // Add smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });

        // Add dynamic particle movement on mouse move
        document.addEventListener('mousemove', (e) => {
            const particles = document.querySelectorAll('.particle');
            const mouseX = e.clientX / window.innerWidth;
            const mouseY = e.clientY / window.innerHeight;
            
            particles.forEach((particle, index) => {
                const speed = (index + 1) * 0.5;
                const x = mouseX * speed;
                const y = mouseY * speed;
                particle.style.transform += ` translate(${x}px, ${y}px)`;
            });
        });
    </script>
</body>
</html>