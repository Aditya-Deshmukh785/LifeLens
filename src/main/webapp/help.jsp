<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help - LifeLens</title>
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
            animation: float 6s ease-in-out infinite;
        }

        .particle:nth-child(1) { width: 4px; height: 4px; top: 20%; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 6px; height: 6px; top: 60%; left: 80%; animation-delay: 2s; }
        .particle:nth-child(3) { width: 3px; height: 3px; top: 80%; left: 20%; animation-delay: 4s; }
        .particle:nth-child(4) { width: 5px; height: 5px; top: 30%; left: 70%; animation-delay: 1s; }
        .particle:nth-child(5) { width: 4px; height: 4px; top: 70%; left: 60%; animation-delay: 3s; }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); opacity: 0.7; }
            50% { transform: translateY(-20px) rotate(180deg); opacity: 1; }
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
            font-size: 3.5em;
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
            font-size: 1.3em;
            color: #cbd5e1;
            max-width: 600px;
            margin: 0 auto 40px;
            animation: slideInFromBottom 1s ease-out 0.3s both;
            line-height: 1.6;
        }

        @keyframes slideInFromTop {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideInFromBottom {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .feature-card {
            background: linear-gradient(135deg, rgba(30, 41, 59, 0.8) 0%, rgba(15, 23, 42, 0.9) 100%);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: 20px;
            padding: 40px;
            position: relative;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            cursor: pointer;
            animation: fadeInUp 0.8s ease-out;
        }

        .feature-card:nth-child(1) { animation-delay: 0.1s; }
        .feature-card:nth-child(2) { animation-delay: 0.2s; }
        .feature-card:nth-child(3) { animation-delay: 0.3s; }
        .feature-card:nth-child(4) { animation-delay: 0.4s; }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .feature-card:hover {
            transform: translateY(-10px) scale(1.02);
            border-color: #22c55e;
            box-shadow: 0 25px 50px rgba(34, 197, 94, 0.2);
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(34, 197, 94, 0.1), transparent);
            transition: left 0.6s;
        }

        .feature-card:hover::before {
            left: 100%;
        }

        .feature-icon {
            font-size: 3em;
            margin-bottom: 20px;
            display: block;
            filter: drop-shadow(0 0 10px rgba(34, 197, 94, 0.5));
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }

        .feature-title {
            font-size: 1.5em;
            font-weight: 700;
            color: #22c55e;
            margin-bottom: 15px;
        }

        .feature-description {
            color: #cbd5e1;
            line-height: 1.6;
            font-size: 1.1em;
        }

        .steps-section {
            background: linear-gradient(135deg, rgba(30, 41, 59, 0.6) 0%, rgba(15, 23, 42, 0.8) 100%);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: 25px;
            padding: 50px;
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
        }

        .steps-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(34, 197, 94, 0.03) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .section-title {
            font-size: 2.5em;
            font-weight: 700;
            color: #22c55e;
            text-align: center;
            margin-bottom: 40px;
            position: relative;
        }

        .steps-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
            position: relative;
        }

        .step {
            flex: 1;
            min-width: 250px;
            text-align: center;
            position: relative;
            z-index: 10;
        }

        .step-number {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(45deg, #22c55e, #38bdf8);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8em;
            font-weight: 700;
            color: #0f172a;
            margin: 0 auto 20px;
            box-shadow: 0 10px 30px rgba(34, 197, 94, 0.3);
            animation: stepPulse 3s ease-in-out infinite;
        }

        .step:nth-child(1) .step-number { animation-delay: 0s; }
        .step:nth-child(2) .step-number { animation-delay: 1s; }
        .step:nth-child(3) .step-number { animation-delay: 2s; }

        @keyframes stepPulse {
            0%, 100% { transform: scale(1); box-shadow: 0 10px 30px rgba(34, 197, 94, 0.3); }
            50% { transform: scale(1.1); box-shadow: 0 15px 40px rgba(34, 197, 94, 0.5); }
        }

        .step-title {
            font-size: 1.3em;
            font-weight: 600;
            color: #38bdf8;
            margin-bottom: 10px;
        }

        .step-description {
            color: #cbd5e1;
            line-height: 1.5;
        }

        .faq-section {
            margin-bottom: 60px;
        }

        .faq-item {
            background: linear-gradient(135deg, rgba(30, 41, 59, 0.7) 0%, rgba(15, 23, 42, 0.9) 100%);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: 15px;
            margin-bottom: 20px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .faq-question {
            padding: 25px;
            font-size: 1.2em;
            font-weight: 600;
            color: #22c55e;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: all 0.3s ease;
        }

        .faq-question:hover {
            background: rgba(34, 197, 94, 0.1);
        }

        .faq-answer {
            padding: 0 25px 25px;
            color: #cbd5e1;
            line-height: 1.6;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease, padding 0.3s ease;
        }

        .faq-item.active .faq-answer {
            max-height: 200px;
        }

        .faq-toggle {
            font-size: 1.5em;
            transition: transform 0.3s ease;
        }

        .faq-item.active .faq-toggle {
            transform: rotate(180deg);
        }

        .cta-section {
            text-align: center;
            padding: 60px 40px;
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.1) 0%, rgba(56, 189, 248, 0.1) 100%);
            border-radius: 25px;
            border: 1px solid rgba(34, 197, 94, 0.3);
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
        }

        .cta-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            animation: shine 3s ease-in-out infinite;
        }

        @keyframes shine {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 18px 40px;
            background: linear-gradient(45deg, #16a34a, #22c55e);
            color: white;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 10px 30px rgba(34, 197, 94, 0.3);
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
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 20px 40px rgba(34, 197, 94, 0.4);
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
            font-size: 1em;
            position: relative;
        }

        .contact-info {
            background: linear-gradient(135deg, rgba(30, 41, 59, 0.6) 0%, rgba(15, 23, 42, 0.8) 100%);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            margin-bottom: 40px;
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

        @media (max-width: 768px) {
            .hero-title { font-size: 2.5em; }
            .features-grid { grid-template-columns: 1fr; }
            .steps-container { flex-direction: column; }
            .container { padding: 40px 15px; }
            nav { padding: 12px 20px; }
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
    </div>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">LifeLens 🩺</div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Hero Section -->
        <div class="hero-section">
            <h1 class="hero-title">Help & Support</h1>
            <p class="hero-subtitle">Welcome to your AI-powered health companion. Discover how LifeLens transforms your health journey with personalized insights and intelligent recommendations.</p>
        </div>

        <!-- Features Grid -->
        <div class="features-grid">
            <div class="feature-card">
                <span class="feature-icon">🔍</span>
                <h3 class="feature-title">What is LifeLens?</h3>
                <p class="feature-description">Your AI-powered health companion that provides personalized lifestyle insights based on your responses to intelligent surveys. Transform your health understanding—completely free.</p>
            </div>

            <div class="feature-card">
                <span class="feature-icon">🧠</span>
                <h3 class="feature-title">Smart Features</h3>
                <div class="feature-description">
                    • Tailored health suggestions based on your lifestyle<br>
                    • Easy-to-understand insights – no medical jargon<br>
                    • Lightning-fast, browser-based experience<br>
                    • 100% privacy protection – no login required
                </div>
            </div>

            <div class="feature-card">
                <span class="feature-icon">⚡</span>
                <h3 class="feature-title">Instant Results</h3>
                <p class="feature-description">Get immediate, personalized health insights the moment you complete your survey. Our AI processes your responses in real-time to deliver actionable recommendations.</p>
            </div>


        </div>

        <!-- Getting Started Section -->
        <div class="steps-section">
            <h2 class="section-title">🚀 Getting Started</h2>
            <div class="steps-container">
                <div class="step">
                    <div class="step-number">1</div>
                    <h3 class="step-title">Start Your Journey</h3>
                    <p class="step-description">Visit our home page and click "START YOUR JOURNEY" to begin your personalized health assessment.</p>
                </div>
                <div class="step">
                    <div class="step-number">2</div>
                    <h3 class="step-title">Choose Your Path</h3>
                    <p class="step-description">Select between Symptom Diagnostic or Lifestyle Survey, then answer our intelligent questions.</p>
                </div>
                <div class="step">
                    <div class="step-number">3</div>
                    <h3 class="step-title">Get Insights</h3>
                    <p class="step-description">Receive instant, personalized health insights and recommendations tailored just for you.</p>
                </div>
            </div>
        </div>

        <!-- FAQ Section -->
        <div class="faq-section">
            <h2 class="section-title">❓ Frequently Asked Questions</h2>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFAQ(this)">
                    Is LifeLens a replacement for a doctor?
                    <span class="faq-toggle">▲</span>
                </div>
                <div class="faq-answer">
                    No. LifeLens is designed for informational and awareness purposes only. Our AI provides insights to help you understand your health patterns, but always consult a healthcare professional for medical advice, diagnosis, or treatment.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFAQ(this)">
                    Do I need to create an account?
                    <span class="faq-toggle">▲</span>
                </div>
                <div class="faq-answer">
                    Not at all! You can use LifeLens completely free without any registration. However, future versions may include optional user accounts for tracking your health journey over time.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFAQ(this)">
                    How accurate are the health insights?
                    <span class="faq-toggle">▲</span>
                </div>
                <div class="faq-answer">
                    Our AI uses advanced algorithms to analyze your responses and provide evidence-based insights. While highly sophisticated, these are educational tools designed to increase health awareness, not replace professional medical evaluation.
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="contact-info">
            <h2 class="section-title">📬 Need More Help?</h2>
            <p style="color: #cbd5e1; margin-bottom: 25px; font-size: 1.1em;">Have feedback or facing issues? We're here to help you make the most of your LifeLens experience.</p>
            <a href="https://mail.google.com/mail/?view=cm&fs=1&to=aipoweredlifelens@gmail.com" target="_blank" class="contact-email">aipoweredlifelens@gmail.com</a>
        </div>

        <!-- Call to Action -->
        <div class="cta-section">
            <a href="Entry.html" class="back-button">
                <span>🏠</span>
                Start Your Health Journey
            </a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 LifeLens. Designed with ❤️ to make health simple and accessible for everyone.</p>
    </footer>

    <script>
        function toggleFAQ(element) {
            const faqItem = element.parentElement;
            const isActive = faqItem.classList.contains('active');
            
            // Close all FAQ items
            document.querySelectorAll('.faq-item').forEach(item => {
                item.classList.remove('active');
            });
            
            // If this item wasn't active, open it
            if (!isActive) {
                faqItem.classList.add('active');
            }
        }

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
        document.querySelectorAll('.feature-card, .faq-item').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(30px)';
            el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(el);
        });

        // Add smooth scrolling for better UX
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>