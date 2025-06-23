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

    .nav-left {
      display: flex;
      align-items: center;
    }

    .logo {
      font-size: 1.5em;
      font-weight: bold;
      color: #22c55e;
      margin-right: 40px;
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

    .nav-right {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .profile-pic {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      border: 2px solid #22c55e;
    }

    .username {
      font-size: 0.95em;
      color: #f8fafc;
    }
    
    .menu-wrapper {
  position: relative;
  display: inline-block;
}

.menu-button {
  background-color: transparent;
  border: none;
  color: #f8fafc;
  font-size: 24px;
  cursor: pointer;
}

.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: #1e293b;
  min-width: 160px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
  border-radius: 10px;
  z-index: 1000;
  padding: 10px 0;
}

.dropdown-content a {
  color: #f8fafc;
  padding: 10px 16px;
  text-decoration: none;
  display: block;
  font-size: 0.95em;
}

.dropdown-content a:hover {
  background-color: #334155;
  color: #22c55e;
}
    

    .container {
      padding: 40px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h1 {
      font-size: 2.5em;
      margin-bottom: 20px;
    }

    .survey-wrapper {
      display: flex;
      justify-content: center;
      align-items: stretch;
      gap: 40px;
      margin-top: 40px;
      flex-wrap: wrap;
      width: 100%;
      max-width: 1000px;
    }

    .survey-column {
      background-color: #1e293b;
      border-radius: 16px;
      padding: 20px;
      flex: 1;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.3);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      min-width: 280px;
    }

    .card {
      background-color: #334155;
      border-radius: 12px;
      padding: 20px;
      text-align: center;
      transition: transform 0.3s ease;
      cursor: pointer;
    }

    .card:hover {
      transform: translateY(-5px);
      background-color: #3b475a;
    }

    .card h2 {
      color: #22c55e;
      margin-bottom: 10px;
    }

    .card p {
      font-size: 1em;
      line-height: 1.4;
    }

    .benefits {
      margin-top: 20px;
    }

    .benefits ul {
      list-style: disc;
      padding-left: 20px;
      font-size: 0.95em;
      line-height: 1.6;
    }

    a.card-link {
      text-decoration: none;
      color: inherit;
    }

    .separator {
      width: 2px;
      background-color: #334155;
    }

    @media screen and (max-width: 768px) {
      .survey-wrapper {
        flex-direction: column;
        align-items: center;
      }

      .separator {
        display: none;
      }
    }
  </style>
</head>
<body>

  <nav>
    <div class="nav-left">
      <div class="logo">LifeLens </div>
      <ul>
        <li><a href="Entry.html">Home</a></li>
        <li><a href="#">Survey</a></li>
        <li><a href="help.jsp">Help</a></li>
        <li><a href="about.jsp">About</a></li>
      </ul>
    </div>
    <div class="nav-right">
      <span class="username"><%= userName %></span>
      <img src="<%= userPicture %>" alt="Profile" class="profile-pic">
      
      <div class="menu-wrapper">
      <button class="menu-button" onclick="toggleDropdown()">☰</button>
      <div class="dropdown-content" id="userDropdown">
      <a href="UserHistory.jsp">🕘 View History</a>
      <a href="Entry.html">🚪 Logout</a>
      <a href="Feedback.jsp">💬 Feedback</a>
      </div>
      </div>
    </div>
  </nav>

  <div class="container">
    <h1>Select Your Survey Type</h1>

    <div class="survey-wrapper">
      <!-- Column 1 -->
      <div class="survey-column">
        <a href="LifestyleSurveyForm.jsp" class="card-link">
          <div class="card">
            <h2>Lifestyle Risk Assessment</h2>
            <p>Analyze your routine and find out your long-term health risk score.</p>
          </div>
        </a>
        <div class="benefits">
          <ul>
            <li>Identifies long-term health risks early</li>
            <li>Provides AI-based lifestyle improvements</li>
            <li>Tracks unhealthy patterns in sleep, diet & exercise</li>
            <li>Helps build a balanced daily routine</li>
          </ul>
        </div>
      </div>

      <!-- Vertical Separator -->
      <div class="separator"></div>

      <!-- Column 2 -->
      <div class="survey-column">
        <a href="SymptomDiagnosticForm.jsp" class="card-link">
          <div class="card">
            <h2>Symptom Diagnostic Survey</h2>
            <p>Facing issues like fatigue or bloating? Find the likely root cause.</p>
          </div>
        </a>
        <div class="benefits">
          <ul>
            <li>Links symptoms to lifestyle and diet patterns</li>
            <li>AI-based diagnosis with actionable tips</li>
            <li>Highlights food, sleep, or hydration issues</li>
            <li>Helps adjust daily habits for quick relief</li>
          </ul>
        </div>
      </div>
    </div>

  </div>
  
  <script>
  function toggleDropdown() {
    const dropdown = document.getElementById("userDropdown");
    dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
  }

  // Optional: Hide dropdown when clicking outside
  window.onclick = function(event) {
    if (!event.target.matches('.menu-button')) {
      const dropdown = document.getElementById("userDropdown");
      if (dropdown && dropdown.style.display === "block") {
        dropdown.style.display = "none";
      }
    }
  }
</script>
  

</body>
</html>
