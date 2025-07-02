<%@ page session="true" %>
<%
    String userName = (String) session.getAttribute("userName");
    String userPicture = (String) session.getAttribute("userPicture");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Select Survey - LifeLens</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
      color: #f8fafc;
      min-height: 100vh;
      overflow-x: hidden;
    }

    /* Animated background particles */
    .bg-particles {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 1;
    }

    .particle {
      position: absolute;
      width: 4px;
      height: 4px;
      background: rgba(34, 197, 94, 0.3);
      border-radius: 50%;
      animation: float 6s ease-in-out infinite;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0.3; }
      50% { transform: translateY(-20px) rotate(180deg); opacity: 0.8; }
    }

    nav {
      background: rgba(9, 34, 73, 0.95);
      backdrop-filter: blur(10px);
      padding: 16px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
      z-index: 100;
      border-bottom: 1px solid rgba(34, 197, 94, 0.2);
    }

    .nav-left {
      display: flex;
      align-items: center;
    }

    .logo {
      font-size: 1.8em;
      font-weight: 800;
      color: #22c55e;
      margin-right: 40px;
      text-shadow: 0 0 20px rgba(34, 197, 94, 0.3);
      animation: pulse 2s ease-in-out infinite;
    }

    @keyframes pulse {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.05); }
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 35px;
      margin: 0;
      padding: 0;
    }

    nav ul li a {
      text-decoration: none;
      color: #f8fafc;
      font-size: 1em;
      font-weight: 500;
      padding: 8px 16px;
      border-radius: 8px;
      transition: all 0.3s ease;
      position: relative;
    }

    nav ul li a:hover {
      color: #22c55e;
      background: rgba(34, 197, 94, 0.1);
      transform: translateY(-2px);
    }

    .nav-right {
      display: flex;
      align-items: center;
      gap: 16px;
    }

    .profile-section {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 8px 16px;
      background: rgba(34, 197, 94, 0.1);
      border-radius: 50px;
      border: 1px solid rgba(34, 197, 94, 0.2);
      transition: all 0.3s ease;
    }

    .profile-section:hover {
      background: rgba(34, 197, 94, 0.15);
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(34, 197, 94, 0.2);
    }

    .profile-pic {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      border: 2px solid #22c55e;
      object-fit: cover;
      transition: all 0.3s ease;
      box-shadow: 0 0 15px rgba(34, 197, 94, 0.3);
    }

    .profile-pic:hover {
      transform: scale(1.1);
      box-shadow: 0 0 25px rgba(34, 197, 94, 0.5);
    }

    .username {
      font-size: 0.95em;
      color: #f8fafc;
      font-weight: 600;
    }

    .menu-wrapper {
      position: relative;
      display: inline-block;
    }

    .menu-button {
      background: linear-gradient(135deg, #22c55e, #10b981);
      border: none;
      color: white;
      font-size: 20px;
      cursor: pointer;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
    }

    .menu-button:hover {
      transform: translateY(-2px) scale(1.05);
      box-shadow: 0 8px 25px rgba(34, 197, 94, 0.4);
      background: linear-gradient(135deg, #16a34a, #059669);
    }

    .dropdown-content {
      display: none;
      position: absolute;
      right: 0;
      top: 50px;
      background: rgba(30, 41, 59, 0.95);
      backdrop-filter: blur(10px);
      min-width: 200px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
      border-radius: 16px;
      z-index: 1000;
      padding: 12px 0;
      border: 1px solid rgba(34, 197, 94, 0.2);
      animation: dropdownSlide 0.3s ease-out;
    }

    @keyframes dropdownSlide {
      0% { opacity: 0; transform: translateY(-10px) scale(0.95); }
      100% { opacity: 1; transform: translateY(0) scale(1); }
    }

    .dropdown-content a {
      color: #f8fafc;
      padding: 12px 20px;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 0.95em;
      transition: all 0.3s ease;
    }

    .dropdown-content a:hover {
      background: rgba(34, 197, 94, 0.1);
      color: #22c55e;
      transform: translateX(5px);
    }

    .container {
      padding: 60px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      position: relative;
      z-index: 10;
    }

    .welcome-section {
      text-align: center;
      margin-bottom: 40px;
      animation: fadeIn 1s ease-out;
    }

    .welcome-text {
      font-size: 1.4em;
      color: #94a3b8;
      margin-bottom: 10px;
    }

    .user-name-highlight {
      color: #22c55e;
      font-weight: 700;
      text-shadow: 0 0 10px rgba(34, 197, 94, 0.3);
    }

    h1 {
      font-size: 3.5em;
      margin-bottom: 20px;
      background: linear-gradient(135deg, #22c55e 0%, #10b981 50%, #059669 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      text-align: center;
      animation: slideDown 1s ease-out;
      font-weight: 800;
      letter-spacing: -1px;
    }

    @keyframes slideDown {
      0% { transform: translateY(-50px); opacity: 0; }
      100% { transform: translateY(0); opacity: 1; }
    }

    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(20px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    .subtitle {
      font-size: 1.2em;
      color: #94a3b8;
      text-align: center;
      margin-bottom: 40px;
      animation: fadeIn 1s ease-out 0.3s both;
    }

    .survey-wrapper {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 60px;
      margin-top: 40px;
      width: 100%;
      max-width: 1200px;
      animation: fadeInUp 1s ease-out 0.6s both;
    }

    @keyframes fadeInUp {
      0% { opacity: 0; transform: translateY(40px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    .survey-column {
      background: linear-gradient(145deg, rgba(30, 41, 59, 0.8), rgba(51, 65, 85, 0.6));
      border-radius: 24px;
      padding: 40px 30px;
      box-shadow: 
        0 20px 40px rgba(0, 0, 0, 0.3),
        0 0 0 1px rgba(34, 197, 94, 0.1);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      position: relative;
      overflow: hidden;
      transition: all 0.4s ease;
      backdrop-filter: blur(10px);
    }

    .survey-column::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #22c55e, #10b981, #059669);
      transform: scaleX(0);
      transition: transform 0.4s ease;
    }

    .survey-column:hover::before {
      transform: scaleX(1);
    }

    .survey-column:hover {
      transform: translateY(-10px) scale(1.02);
      box-shadow: 
        0 30px 60px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(34, 197, 94, 0.3),
        0 0 40px rgba(34, 197, 94, 0.1);
    }

    .card {
      background: linear-gradient(135deg, rgba(51, 65, 85, 0.9), rgba(59, 71, 90, 0.7));
      border-radius: 16px;
      padding: 30px;
      text-align: center;
      transition: all 0.3s ease;
      cursor: pointer;
      border: 1px solid rgba(34, 197, 94, 0.2);
      position: relative;
      overflow: hidden;
    }

    .card::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: linear-gradient(45deg, transparent, rgba(34, 197, 94, 0.1), transparent);
      transform: rotate(45deg);
      transition: all 0.6s ease;
      opacity: 0;
    }

    .card:hover::before {
      animation: shimmer 1.5s ease-in-out;
    }

    @keyframes shimmer {
      0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); opacity: 0; }
      50% { opacity: 1; }
      100% { transform: translateX(100%) translateY(100%) rotate(45deg); opacity: 0; }
    }

    .card h2 {
      color: #22c55e;
      margin-bottom: 15px;
      font-size: 1.6em;
      font-weight: 700;
      position: relative;
      z-index: 2;
    }

    .card p {
      font-size: 1.1em;
      line-height: 1.6;
      color: #cbd5e1;
      position: relative;
      z-index: 2;
    }

    .benefits {
      margin-top: 30px;
      animation: fadeInUp 1s ease-out 0.9s both;
    }

    .benefits h3 {
      color: #22c55e;
      font-size: 1.3em;
      margin-bottom: 20px;
      font-weight: 600;
    }

    .benefits ul {
      list-style: none;
      padding: 0;
      font-size: 1em;
      line-height: 1.8;
    }

    .benefits li {
      padding: 8px 0;
      padding-left: 30px;
      position: relative;
      color: #e2e8f0;
      transition: all 0.3s ease;
    }

    .benefits li:hover {
      color: #22c55e;
      transform: translateX(5px);
    }

    .benefits li::before {
      content: '✓';
      position: absolute;
      left: 0;
      color: #22c55e;
      font-weight: bold;
      font-size: 1.2em;
    }

    a.card-link {
      text-decoration: none;
      color: inherit;
      display: block;
    }

    .icon {
      font-size: 3em;
      margin-bottom: 20px;
      display: block;
    }

    .lifestyle-icon {
      background: linear-gradient(135deg, #22c55e, #10b981);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .diagnostic-icon {
      background: linear-gradient(135deg, #3b82f6, #1d4ed8);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .quick-stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
      margin-top: 60px;
      width: 100%;
      max-width: 1200px;
      animation: fadeIn 1s ease-out 1.2s both;
    }

    .stat-card {
      background: rgba(30, 41, 59, 0.6);
      border-radius: 16px;
      padding: 20px;
      text-align: center;
      border: 1px solid rgba(34, 197, 94, 0.2);
      transition: all 0.3s ease;
    }

    .stat-card:hover {
      transform: translateY(-5px);
      background: rgba(30, 41, 59, 0.8);
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    }

    .stat-number {
      font-size: 2em;
      font-weight: 700;
      color: #22c55e;
      margin-bottom: 5px;
    }

    .stat-label {
      color: #94a3b8;
      font-size: 0.9em;
    }

    @media screen and (max-width: 968px) {
      .survey-wrapper {
        grid-template-columns: 1fr;
        gap: 40px;
        max-width: 600px;
      }
      
      h1 {
        font-size: 2.8em;
      }
      
      nav {
        padding: 14px 20px;
      }
      
      nav ul {
        gap: 20px;
      }

      .nav-left {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }

      .logo {
        margin-right: 0;
      }
    }

    @media screen and (max-width: 640px) {
      h1 {
        font-size: 2.2em;
      }
      
      .survey-column {
        padding: 30px 20px;
      }
      
      .nav-left ul {
        flex-direction: column;
        gap: 10px;
      }

      .profile-section {
        flex-direction: column;
        gap: 8px;
      }
    }
  </style>
</head>
<body>
  <div class="bg-particles"></div>

  <nav>
    <div class="nav-left">
      <div class="logo">LifeLens 🩺</div>
      <ul>
        <li><a href="Entry.html">Home</a></li>
        <li><a href="#">Survey</a></li>
        <li><a href="help.jsp">Help</a></li>
        <li><a href="about.jsp">About</a></li>
      </ul>
    </div>
    <div class="nav-right">
      <div class="profile-section">
        <span class="username"><%= userName %></span>
        <img src="<%= userPicture %>" alt="Profile" class="profile-pic">
      </div>
      
      <div class="menu-wrapper">
        <button class="menu-button" onclick="toggleDropdown()">☰</button>
        <div class="dropdown-content" id="userDropdown">
          <a href="Entry.html">🚪 Logout</a>
          <a href="https://mail.google.com/mail/?view=cm&fs=1&to=aipoweredlifelens@gmail.com&su=Feedback&body=Dear%20LifeLens%20Team%2C%0A%0AHere%20is%20my%20feedback..." target="_blank">💬 Feedback</a>
        </div>
      </div>
    </div>
  </nav>

  <div class="container">
    <div class="welcome-section">
      <p class="welcome-text">Welcome, <span class="user-name-highlight"><%= userName %></span>!</p>
    </div>

    <h1>Choose Your Health Journey</h1>
    <p class="subtitle">Continue your wellness journey with AI-powered health assessments</p>

    <div class="survey-wrapper">
      <!-- Lifestyle Assessment Column -->
      <div class="survey-column">
        <a href="LifestyleSurveyForm.jsp" class="card-link">
          <div class="card">
            <span class="icon lifestyle-icon">🌱</span>
            <h2>Lifestyle Risk Assessment</h2>
            <p>Analyze your daily routines and discover your long-term health risk score with personalized recommendations.</p>
          </div>
        </a>
        <div class="benefits">
          <h3>Key Benefits</h3>
          <ul>
            <li>Early identification of long-term health risks</li>
            <li>AI-powered lifestyle improvement suggestions</li>
            <li>Pattern analysis for sleep, diet & exercise</li>
            <li>Personalized daily routine optimization</li>
            <li>Progress tracking and goal setting</li>
          </ul>
        </div>
      </div>

      <!-- Symptom Diagnostic Column -->
      <div class="survey-column">
        <a href="SymptomDiagnosticForm.jsp" class="card-link">
          <div class="card">
            <span class="icon diagnostic-icon">🔍</span>
            <h2>Symptom Diagnostic Survey</h2>
            <p>Experiencing fatigue, bloating, or other symptoms? Discover potential root causes and get actionable solutions.</p>
          </div>
        </a>
        <div class="benefits">
          <h3>Key Benefits</h3>
          <ul>
            <li>Connect symptoms to lifestyle patterns</li>
            <li>AI-based diagnosis with actionable tips</li>
            <li>Identify food, sleep, or hydration issues</li>
            <li>Quick relief through habit adjustments</li>
            <li>Comprehensive symptom tracking</li>
          </ul>
        </div>
      </div>
    </div>

    <div class="quick-stats">
      <div class="stat-card">
        <div class="stat-number">2</div>
        <div class="stat-label">Available Surveys</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">24/7</div>
        <div class="stat-label">AI Support</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">100%</div>
        <div class="stat-label">Personalized</div>
      </div>
    </div>
  </div>

  <script>
    // Create floating particles
    function createParticles() {
      const container = document.querySelector('.bg-particles');
      const particleCount = 50;

      for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        
        // Random position
        particle.style.left = Math.random() * 100 + '%';
        particle.style.top = Math.random() * 100 + '%';
        
        // Random animation delay
        particle.style.animationDelay = Math.random() * 6 + 's';
        particle.style.animationDuration = (Math.random() * 3 + 4) + 's';
        
        container.appendChild(particle);
      }
    }

    // Dropdown functionality
    function toggleDropdown() {
      const dropdown = document.getElementById("userDropdown");
      dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }

    // Hide dropdown when clicking outside
    window.onclick = function(event) {
      if (!event.target.matches('.menu-button')) {
        const dropdown = document.getElementById("userDropdown");
        if (dropdown && dropdown.style.display === "block") {
          dropdown.style.display = "none";
        }
      }
    }

    // Add smooth scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
          behavior: 'smooth'
        });
      });
    });

    // Add card interaction effects
    document.querySelectorAll('.card').forEach(card => {
      card.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-5px) scale(1.02)';
      });
      
      card.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0) scale(1)';
      });
    });

    // Initialize particles when page loads
    window.addEventListener('load', createParticles);

    // Add scroll-based animations
    const observerOptions = {
      threshold: 0.1,
      rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.style.opacity = '1';
          entry.target.style.transform = 'translateY(0)';
        }
      });
    }, observerOptions);

    // Observe elements for scroll animations
    document.querySelectorAll('.survey-column, .benefits, .stat-card').forEach(el => {
      observer.observe(el);
    });
  </script>

</body>
</html>