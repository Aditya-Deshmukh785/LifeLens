<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: #0f0f23;
            color: #ffffff;
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
            z-index: -1;
        }

        .particle {
            position: absolute;
            width: 2px;
            height: 2px;
            background: rgba(34, 197, 94, 0.3);
            border-radius: 50%;
            animation: float 8s infinite linear;
        }

        @keyframes float {
            0% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100px) rotate(360deg); opacity: 0; }
        }

        nav {
            background: rgba(9, 34, 73, 0.9);
            backdrop-filter: blur(20px);
            padding: 16px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(34, 197, 94, 0.2);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 1.8em;
            font-weight: 800;
            background: linear-gradient(135deg, #22c55e, #10b981);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 16px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 25px;
            border: 1px solid rgba(34, 197, 94, 0.3);
            transition: all 0.3s ease;
        }

        .profile:hover {
            background: rgba(34, 197, 94, 0.2);
            transform: translateY(-1px);
        }

        .profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid rgba(34, 197, 94, 0.5);
        }

        .form-container {
            max-width: 900px;
            margin: 40px auto;
            background: linear-gradient(145deg, rgba(30, 41, 59, 0.9), rgba(51, 65, 85, 0.8));
            backdrop-filter: blur(20px);
            border-radius: 24px;
            border: 1px solid rgba(34, 197, 94, 0.2);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            animation: slideUp 0.8s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-header {
            background: linear-gradient(135deg, #22c55e, #10b981);
            padding: 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .form-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        h1 {
            font-size: 2.5em;
            font-weight: 900;
            color: #0f172a;
            margin-bottom: 10px;
            position: relative;
            z-index: 2;
        }

        .form-subtitle {
            color: rgba(15, 23, 42, 0.8);
            font-size: 1.1em;
            position: relative;
            z-index: 2;
        }

        .form-content {
            padding: 30px;
        }

        .section {
            background: linear-gradient(145deg, rgba(51, 65, 85, 0.6), rgba(71, 85, 105, 0.4));
            margin-bottom: 25px;
            padding: 25px;
            border-radius: 16px;
            border: 1px solid rgba(34, 197, 94, 0.15);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .section::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(34, 197, 94, 0.1), transparent);
            transition: left 0.5s;
        }

        .section:hover::before {
            left: 100%;
        }

        .section:hover {
            transform: translateY(-2px);
            border-color: rgba(34, 197, 94, 0.3);
            box-shadow: 0 10px 30px rgba(34, 197, 94, 0.1);
        }

        .section h2 {
            color: #22c55e;
            font-size: 1.4em;
            font-weight: 700;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section h2::after {
            content: '';
            flex: 1;
            height: 2px;
            background: linear-gradient(90deg, #22c55e, transparent);
            border-radius: 1px;
        }

        label {
            display: block;
            margin: 15px 0 8px 0;
            font-weight: 600;
            color: #e2e8f0;
            font-size: 0.95em;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid rgba(34, 197, 94, 0.3);
            border-radius: 12px;
            background: rgba(15, 23, 42, 0.6);
            color: #ffffff;
            font-size: 1em;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #22c55e;
            box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.2);
            transform: translateY(-1px);
        }

        input::placeholder, textarea::placeholder {
            color: rgba(226, 232, 240, 0.5);
        }

        select:invalid {
            color: rgba(226, 232, 240, 0.5);
        }

        select option {
            background: #1e293b;
            color: #ffffff;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        .checkbox-group {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 12px;
            padding: 15px 0;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
            color: #e2e8f0;
            cursor: pointer;
            padding: 10px 15px;
            border-radius: 10px;
            background: rgba(34, 197, 94, 0.05);
            border: 1px solid rgba(34, 197, 94, 0.2);
            transition: all 0.3s ease;
            margin: 0;
        }

        .checkbox-group label:hover {
            background: rgba(34, 197, 94, 0.15);
            transform: translateY(-1px);
        }

        .checkbox-group input[type="checkbox"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: #22c55e;
        }

        .checkbox-group input[type="checkbox"]:checked + span {
            color: #22c55e;
            font-weight: 600;
        }

        .submit-btn, .back-btn {
            background: linear-gradient(135deg, #22c55e, #10b981);
            color: #0f172a;
            font-weight: 700;
            border: none;
            border-radius: 12px;
            padding: 16px 32px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 15px 10px 15px 0;
            font-size: 1.1em;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .submit-btn::before, .back-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .submit-btn:hover::before, .back-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover, .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(34, 197, 94, 0.3);
        }

        .submit-btn {
            background: linear-gradient(135deg, #22c55e, #059669);
            width: 100%;
            margin-bottom: 20px;
        }

        .checkbox-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding-left: 10px;
            margin-top: 8px;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: normal;
            color: #f8fafc;
            cursor: pointer;
            padding: 5px 0;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin: 0;
            cursor: pointer;
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

        .progress-bar {
            position: fixed;
            top: 0;
            left: 0;
            height: 3px;
            background: linear-gradient(90deg, #22c55e, #10b981);
            z-index: 1000;
            transition: width 0.3s ease;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            nav {
                padding: 12px 20px;
            }
            
            .logo {
                font-size: 1.4em;
            }
            
            .form-container {
                margin: 20px;
                border-radius: 16px;
            }
            
            .form-header {
                padding: 20px;
            }
            
            h1 {
                font-size: 2em;
            }
            
            .form-content {
                padding: 20px;
            }
            
            .section {
                padding: 20px;
            }
            
            .checkbox-group {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Animated background particles -->
    <div class="bg-particles" id="particles"></div>
    
    <!-- Progress bar -->
    <div class="progress-bar" id="progressBar"></div>

    <nav>
        <div class="logo">LifeLens 🩺</div>
        <div class="profile">
            <span><%= userName %></span>
            <img src="<%= userPicture %>" alt="User Picture">
        </div>
    </nav>

    <div class="form-container">

        <div class="form-header">
            <h1>Lifestyle Risk Assessment</h1>
            <p class="form-subtitle">Discover personalized insights for a healthier you</p>
        </div>
        
        <div class="form-content">
            <form action="LifestyleFormServlet" method="post" id="lifestyleForm">

                <!-- General Info -->
                <div class="section">
                    <h2>📋 General Information</h2>
                    <label>Full Name</label>
                    <input type="text" name="fullName" placeholder="Enter Your Name" required>

                    <label>Age</label>
                    <input type="number" name="age" placeholder="Enter Your Age" min="5" max="100" required>

                    <label>Gender</label>
                    <select name="gender" required>
                        <option value="" disabled selected hidden>Select Gender</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>

                    <label>Height (cm)</label>
                    <input type="number" name="height" placeholder="Enter Your Height" min="50" max="300" required>

                    <label>Weight (kg)</label>
                    <input type="number" name="weight" placeholder="Enter Your Weight" min="10" max="300" required>
                </div>

                <!-- Sleep -->
                <div class="section">
                    <h2>🌙 Sleep Habits</h2>
                    <label>Average sleep duration (hrs)</label>
                    <input type="number" name="sleepDuration" placeholder="Your Sleep Duration" min="1" max="24" required>

                    <label>Sleep timing (e.g. 10 PM - 6 AM)</label>
                    <input type="text" name="sleepTiming" placeholder="Your Sleep Hours" required>

                    <label>Sleep quality</label>
                    <select name="sleepQuality" required>
                        <option value="" disabled selected hidden>Select Sleep Quality</option>
                        <option>Poor</option>
                        <option>Fair</option>
                        <option>Good</option>
                        <option>Excellent</option>
                    </select>
                </div>

                <!-- Diet -->
                <div class="section">
                    <h2>🍽️ Diet & Nutrition</h2>
                    <label>Number of meals per day</label>
                    <select name="mealsPerDay" required>
                        <option value="" disabled selected hidden>Select number of meals</option>
                        <option>1</option><option>2</option><option>3</option><option>4</option><option>5+</option>
                    </select>

                    <label>Snacking frequency</label>
                    <select name="snacking" required>
                        <option value="" disabled selected hidden>Select snacking frequency</option>
                        <option>Never</option><option>Sometimes</option><option>Frequently</option>
                    </select>

                    <label>Water intake (liters/day)</label>
                    <input type="number" name="waterIntake" step="0.1" min="0.1" max="10" placeholder="Enter daily water intake" required>

                    <label>Junk food consumption</label>
                    <select name="junkFood" required>
                        <option value="" disabled selected hidden>Select frequency</option>
                        <option>Never</option><option>Rarely</option><option>Often</option><option>Daily</option>
                    </select>

                    <label>Fruit/vegetable servings per day</label>
                    <input type="number" name="fruitVegServings" placeholder="Enter servings per day" required>
                </div>

                <!-- Physical -->
                <div class="section">
                    <h2>🏃‍♂️ Physical Activities</h2>
                    <label>Exercise frequency/week</label>
                    <select name="exerciseFrequency" required>
                        <option value="" disabled selected hidden>Select frequency</option>
                        <option>None</option><option>1-2 days</option><option>3-5 days</option><option>Daily</option>
                    </select>

                    <label>Exercise duration (minutes)</label>
                    <input type="number" name="exerciseDuration" placeholder="Enter duration in minutes">

                    <label>Type of activity</label>
                    <div class="checkbox-group">
                        <label><input type="checkbox" name="activityType" value="Walking"><span>Walking</span></label>
                        <label><input type="checkbox" name="activityType" value="Gym"><span>Gym</span></label>
                        <label><input type="checkbox" name="activityType" value="Yoga"><span>Yoga</span></label>
                        <label><input type="checkbox" name="activityType" value="Sports"><span>Sports</span></label>
                        <label><input type="checkbox" name="activityType" value="None"><span>None</span></label>
                    </div>

                    <label>Any Other Activity</label>
                    <input type="text" name="otherActivity" placeholder="e.g. Cycling, Dancing">
                </div>

                <!-- Mental Wellness -->
                <div class="section">
                    <h2>🧠 Mental Wellness</h2>
                    <label>Stress level</label>
                    <select name="stress" required>
                        <option value="" disabled selected hidden>Select stress level</option>
                        <option>Low</option><option>Moderate</option><option>High</option>
                    </select>

                    <label>Screen time (non-work hrs/day)</label>
                    <input type="number" name="screenTime" placeholder="Enter daily screen time" min="0" max="24">

                    <label>Work-life balance rating</label>
                    <select name="workLife" required>
                        <option value="" disabled selected hidden>Select balance rating</option>
                        <option>Poor</option><option>Fair</option><option>Good</option><option>Excellent</option>
                    </select>
                </div>

                <!-- Work & Lifestyle -->
                <div class="section">
                    <h2>💼 Lifestyle & Work</h2>
                    <label>Type of job</label>
                    <select name="jobType" required>
                        <option value="" disabled selected hidden>Select job type</option>
                        <option>Sedentary</option><option>Semi-active</option><option>Active</option>
                    </select>

                    <label>Working hours/day</label>
                    <input type="number" name="workHours" placeholder="Enter working hours" min="0" max="24">

                    <label>Commute time (minutes)</label>
                    <input type="number" name="commuteTime" placeholder="Enter commute time" min="0" max="300">
                </div>

                <!-- Deficiency -->
                <div class="section">
                    <h2>⚕️ Health & Deficiency Check</h2>
                    <label>How often do you fall sick in a year?</label>
                    <input type="number" name="sickFrequency" placeholder="Times per year" min="0" max="30">

                    <label>Do you experience hair fall?</label>
                    <select name="hairFall" required>
                        <option value="" disabled selected hidden>Select one</option>
                        <option>Yes</option><option>No</option>
                    </select>

                    <label>Any major disease (present or past)?</label>
                    <textarea name="diseaseDetails" rows="3" placeholder="Mention if any..."></textarea>
                </div>

                <button type="submit" class="submit-btn">✨ Get AI Generated Suggestions</button>
                <a href="SelectSurveyLoggedIN.jsp" class="back-btn">⬅ Back</a>

                <div class="disclaimer">
                    <strong>⚠️ Disclaimer:</strong> This survey is not a medical diagnosis tool. It uses AI to offer lifestyle suggestions based on your responses. Please consult a medical professional for health concerns.
                </div>
            </form>
        </div>
    </div>

    <script>
        // Create animated background particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            for (let i = 0; i < 50; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 8 + 's';
                particle.style.animationDuration = (Math.random() * 3 + 6) + 's';
                particlesContainer.appendChild(particle);
            }
        }

        // Update progress bar based on form completion
        function updateProgressBar() {
            const form = document.getElementById('lifestyleForm');
            const inputs = form.querySelectorAll('input[required], select[required]');
            let completed = 0;
            
            inputs.forEach(input => {
                if (input.value.trim() !== '') {
                    completed++;
                }
            });
            
            const progress = (completed / inputs.length) * 100;
            document.getElementById('progressBar').style.width = progress + '%';
        }

        // Add event listeners for progress tracking
        document.addEventListener('DOMContentLoaded', function() {
            createParticles();
            
            const form = document.getElementById('lifestyleForm');
            const inputs = form.querySelectorAll('input, select, textarea');
            
            inputs.forEach(input => {
                input.addEventListener('input', updateProgressBar);
                input.addEventListener('change', updateProgressBar);
            });
            
            updateProgressBar();
        });

        // Add smooth scroll behavior for better UX
        document.addEventListener('DOMContentLoaded', function() {
            const sections = document.querySelectorAll('.section');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, { threshold: 0.1 });
            
            sections.forEach(section => {
                section.style.opacity = '0';
                section.style.transform = 'translateY(20px)';
                section.style.transition = 'all 0.6s ease';
                observer.observe(section);
            });
        });
    </script>
</body>
</html>