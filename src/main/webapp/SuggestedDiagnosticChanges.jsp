
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Diagnosis - LifeLens</title>
    <style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        margin: 0;
        background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
        color: #f8fafc;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        position: relative;
        overflow-x: hidden;
    }

    /* Animated background particles */
    body::before {
        content: '';
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: 
            radial-gradient(circle at 20% 50%, rgba(34, 197, 94, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 40% 80%, rgba(168, 85, 247, 0.1) 0%, transparent 50%);
        animation: float 20s ease-in-out infinite;
        pointer-events: none;
        z-index: -1;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px) rotate(0deg); }
        33% { transform: translateY(-20px) rotate(1deg); }
        66% { transform: translateY(10px) rotate(-1deg); }
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

    .profile-info {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 8px 16px;
        background: rgba(34, 197, 94, 0.1);
        border-radius: 25px;
        border: 1px solid rgba(34, 197, 94, 0.3);
    }

    .profile-info img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        border: 2px solid #22c55e;
        box-shadow: 0 0 15px rgba(34, 197, 94, 0.4);
        transition: all 0.3s ease;
    }

    .profile-info img:hover {
        transform: scale(1.1);
        box-shadow: 0 0 25px rgba(34, 197, 94, 0.6);
    }

    .container {
        max-width: 950px;
        margin: 40px auto;
        padding: 40px;
        background: rgba(30, 41, 59, 0.8);
        backdrop-filter: blur(15px);
        border-radius: 20px;
        box-shadow: 
            0 20px 40px rgba(0, 0, 0, 0.4),
            0 0 0 1px rgba(34, 197, 94, 0.1),
            inset 0 1px 0 rgba(255, 255, 255, 0.05);
        position: relative;
        animation: slideUp 0.8s ease-out;
    }

    @keyframes slideUp {
        from {
            opacity: 0;
            transform: translateY(50px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 2px;
        background: linear-gradient(90deg, transparent, #22c55e, #3b82f6, #a855f7, transparent);
        border-radius: 20px 20px 0 0;
        animation: shimmer 3s ease-in-out infinite;
    }

    @keyframes shimmer {
        0% { opacity: 0.5; }
        50% { opacity: 1; }
        100% { opacity: 0.5; }
    }

    h1 {
        background: linear-gradient(45deg, #22c55e, #3b82f6, #a855f7);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        text-align: center;
        margin-bottom: 40px;
        font-size: 2.2em;
        font-weight: 800;
        position: relative;
        animation: titleGlow 3s ease-in-out infinite;
    }

    @keyframes titleGlow {
        0%, 100% { filter: drop-shadow(0 0 10px rgba(34, 197, 94, 0.3)); }
        50% { filter: drop-shadow(0 0 20px rgba(59, 130, 246, 0.5)); }
    }

    .ai-output {
        line-height: 1.8;
        font-size: 1.1em;
        background: linear-gradient(145deg, rgba(51, 65, 85, 0.8), rgba(30, 41, 59, 0.8));
        padding: 30px;
        border-radius: 15px;
        color: #f8fafc;
        position: relative;
        border: 1px solid rgba(34, 197, 94, 0.2);
        box-shadow: 
            inset 0 1px 0 rgba(255, 255, 255, 0.05),
            0 10px 30px rgba(0, 0, 0, 0.3);
        animation: contentFade 1s ease-out 0.3s both;
    }

    @keyframes contentFade {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .ai-output::before {
        content: '🤖';
        position: absolute;
        top: -15px;
        left: 25px;
        background: linear-gradient(45deg, #22c55e, #3b82f6);
        padding: 8px 12px;
        border-radius: 12px;
        font-size: 1.2em;
        box-shadow: 0 4px 15px rgba(34, 197, 94, 0.4);
        animation: bounce 2s ease-in-out infinite;
    }

    @keyframes bounce {
        0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
        40% { transform: translateY(-10px); }
        60% { transform: translateY(-5px); }
    }

    .sub-heading {
        color: #fcfcfc !important;
        font-weight: 700 !important;
        font-size: 1.2rem !important;
        display: block;
        margin: 20px 0 8px 0;
        text-shadow: 0 0 10px rgba(34, 197, 94, 0.3);
        position: relative;
        padding-left: 20px;
    }

    .sub-heading::before {
        content: '▶';
        position: absolute;
        left: 0;
        color: #3b82f6;
        animation: pulse 2s ease-in-out infinite;
    }

    @keyframes pulse {
        0%, 100% { opacity: 1; transform: scale(1); }
        50% { opacity: 0.7; transform: scale(0.95); }
    }

    .output-line {
        margin-bottom: 16px;
        line-height: 1.7;
        padding: 8px 0;
        border-left: 2px solid transparent;
        padding-left: 15px;
        transition: all 0.3s ease;
        position: relative;
    }

    .output-line:hover {
        border-left-color: rgba(34, 197, 94, 0.5);
        padding-left: 20px;
        background: rgba(34, 197, 94, 0.05);
        border-radius: 8px;
        transform: translateX(5px);
    }

    .button-container {
        display: flex;
        justify-content: center;
        gap: 25px;
        margin-top: 40px;
        animation: buttonsSlide 1s ease-out 0.6s both;
    }

    @keyframes buttonsSlide {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .back-button, .print-button {
        padding: 14px 28px;
        background: linear-gradient(45deg, #22c55e, #16a34a);
        color: #0f172a;
        font-weight: 700;
        border: none;
        border-radius: 12px;
        text-align: center;
        text-decoration: none;
        font-size: 1em;
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        position: relative;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .back-button::before, .print-button::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: left 0.6s;
    }

    .back-button:hover, .print-button:hover {
        background: linear-gradient(45deg, #16a34a, #15803d);
        transform: translateY(-3px) scale(1.05);
        box-shadow: 0 8px 25px rgba(34, 197, 94, 0.5);
    }

    .back-button:hover::before, .print-button:hover::before {
        left: 100%;
    }

    .back-button:active, .print-button:active {
        transform: translateY(-1px) scale(1.02);
    }

    .disclaimer {
        text-align: center;
        font-size: 0.9em;
        color: rgba(203, 213, 225, 0.8);
        margin-top: 25px;
        padding: 20px;
        background: rgba(239, 68, 68, 0.1);
        border-radius: 12px;
        border: 1px solid rgba(239, 68, 68, 0.3);
    }

    /* Loading animation for content */
    .ai-output.loading {
        position: relative;
    }

    .ai-output.loading::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(90deg, transparent, rgba(34, 197, 94, 0.1), transparent);
        animation: loading 2s ease-in-out infinite;
    }

    @keyframes loading {
        0% { transform: translateX(-100%); }
        100% { transform: translateX(100%); }
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .container {
            margin: 20px;
            padding: 25px;
        }
        
        .button-container {
            flex-direction: column;
            align-items: center;
        }
        
        nav {
            padding: 12px 20px;
        }
        
        nav ul {
            gap: 15px;
        }
        
        h1 {
            font-size: 1.8em;
        }
    }

    @media print {
        .no-print, nav, .profile-info, .button-container {
            display: none !important;
        }

        body, html {
            background: #0f172a !important;
            color: #f8fafc !important;
            -webkit-print-color-adjust: exact !important;
            print-color-adjust: exact !important;
        }

        .container {
            background: #1e293b !important;
            color: #f8fafc !important;
            box-shadow: none !important;
            padding: 30px !important;
            animation: none !important;
        }

        .ai-output {
            background: #334155 !important;
            animation: none !important;
        }

        .sub-heading {
            color: #fcfcfc !important;
        }

        .disclaimer {
            display: block !important;
            color: #94a3b8 !important;
            animation: none !important;
        }

        * {
            animation: none !important;
            transition: none !important;
        }
    }

    </style>
</head>
<body>


<!-- Navigation Bar -->
<nav>
    <div class="nav-left">
      <div class="logo">LifeLens 🩺</div>
      <ul>

        <li><a href="Entry.html">Home</a></li>
        <li><a href="SelectSurveyLoggedIN.jsp">Survey</a></li>
        <li><a href="help.jsp">Help</a></li>
        <li><a href="about.jsp">About</a></li>

      </ul>
    </div>
    <div class="nav-right">
      <div class="profile-info">
        <span><%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "" %></span>
        <%
            String pic = (String) session.getAttribute("userPicture");
            if (pic != null && !pic.isEmpty()) {
        %>
            <img src="<%= pic %>" alt="Profile">
        <%
            }
        %>

      </div>
    </div>
    
</nav>

<!-- Main Content -->
<div class="container" id="report-content">

    <h1>🧠 AI Diagnosis Result</h1>

    <div class="ai-output">
        <%
            String suggestion = (String) request.getAttribute("aiSuggestion");

            if (suggestion != null && !suggestion.trim().isEmpty()) {

                suggestion = suggestion.replaceAll("\\r", "");
                String[] lines = suggestion.split("\\n");

                for (String line : lines) {
                    line = line.trim();

                    
                    // Skip empty lines
                    if (line.isEmpty()) {
                        continue;
                    }

                    // Remove all asterisks at the beginning of lines
                    line = line.replaceAll("^\\*+\\s*", "");
                    
                    // Convert text wrapped in **text** to sub-headings
                    line = line.replaceAll("\\*\\*([^*]+)\\*\\*", "<span class='sub-heading'>$1</span>");
                    
                    // Remove any remaining asterisks
                    line = line.replaceAll("\\*", "");

                    // Skip disclaimer lines (they're shown separately)
                    if (!line.toLowerCase().startsWith("disclaimer")) {

                        out.println("<div class='output-line'>" + line + "</div>");
                    }
                }
            } else {

                out.print("<div class='output-line'>No diagnosis received.</div>");
            }
        %>
    </div>


    <!-- BUTTONS SIDE-BY-SIDE -->
    <div class="no-print button-container">
        <a href="SelectSurveyLoggedIN.jsp" class="back-button">🔙 Go Back to Survey</a>
        <button onclick="window.print()" class="print-button">
            📄 Save as PDF
        </button>
    </div>

    <!-- ✅ Disclaimer (shown always + printed) -->
    <div class="disclaimer">
        <strong>⚠️ Disclaimer:</strong> This is an AI-generated diagnosis and should not replace professional medical advice. Please consult a doctor for clinical evaluation.
    </div>
</div>

<script>
// Add smooth scrolling effect
document.addEventListener('DOMContentLoaded', function() {
    // Add stagger animation to output lines
    const outputLines = document.querySelectorAll('.output-line');
    outputLines.forEach((line, index) => {
        line.style.animationDelay = `${0.1 * index}s`;
        line.style.animation = 'contentFade 0.6s ease-out both';
    });

    // Add hover effect to AI output
    const aiOutput = document.querySelector('.ai-output');
    aiOutput.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-2px)';
        this.style.boxShadow = '0 15px 40px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.1)';
    });

    aiOutput.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0)';
        this.style.boxShadow = 'inset 0 1px 0 rgba(255, 255, 255, 0.05), 0 10px 30px rgba(0, 0, 0, 0.3)';
    });

    // Add click effect to buttons
    const buttons = document.querySelectorAll('.back-button, .print-button');
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            ripple.style.position = 'absolute';
            ripple.style.borderRadius = '50%';
            ripple.style.background = 'rgba(255, 255, 255, 0.5)';
            ripple.style.transform = 'scale(0)';
            ripple.style.animation = 'ripple 0.6s linear';
            ripple.style.left = (e.offsetX - 10) + 'px';
            ripple.style.top = (e.offsetY - 10) + 'px';
            ripple.style.width = ripple.style.height = '20px';
            
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
});

// Add ripple animation
const style = document.createElement('style');
style.textContent = `
    @keyframes ripple {
        to {
            transform: scale(4);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);
</script>

</body>
