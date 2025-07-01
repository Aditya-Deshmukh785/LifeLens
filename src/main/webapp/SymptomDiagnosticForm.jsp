<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("userName");
    String userPicture = (String) session.getAttribute("userPicture");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Symptom Diagnostic - LifeLens</title>
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

        .particle:nth-child(2n) {
            background: rgba(34, 197, 94, 0.3);
        }

        .particle:nth-child(3n) {
            background: rgba(59, 130, 246, 0.3);
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
            background: linear-gradient(135deg, #22c55e, #16a34a);
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
            background: linear-gradient(135deg, #22c55e, #16a34a);
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
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 12px;
            padding: 15px 0;
        }


        .checkbox-group label {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 500;
            color: #e2e8f0;
            cursor: pointer;
            padding: 12px 16px;
            border-radius: 12px;
            background: rgba(34, 197, 94, 0.05);
            border: 1px solid rgba(34, 197, 94, 0.2);
            transition: all 0.3s ease;
            margin: 0;
        }

        .checkbox-group label:hover {
            background: rgba(34, 197, 94, 0.15);
            transform: translateY(-1px);
            border-color: rgba(34, 197, 94, 0.4);
        }

        .checkbox-group input[type="checkbox"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: #22c55e;
            border-radius: 4px;
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
            background: linear-gradient(90deg, #22c55e, #16a34a);
            z-index: 1000;
            transition: width 0.3s ease;
        }

        .severity-indicator {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 10px;
            padding: 8px 12px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 8px;
            border-left: 4px solid #22c55e;
        }

        .severity-indicator::before {
            content: '⚠️';
            font-size: 1.2em;
        }

        .vital-signs {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }

        .vital-sign {
            background: rgba(34, 197, 94, 0.05);
            padding: 15px;
            border-radius: 10px;
            border: 1px solid rgba(34, 197, 94, 0.2);
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
            
            .vital-signs {
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
            <h1>Symptom Diagnostic Survey</h1>
            <p class="form-subtitle">AI-powered symptom analysis for early health insights</p>

        </div>
        
        <div class="form-content">
            <form action="SymptomDiagnosticFormServlet" method="post" id="symptomForm">


                <!-- Personal Details -->
                <div class="section">
                    <h2>👤 Personal Details</h2>
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="Enter Your Name" required>

                    <label>Age</label>
                    <input type="number" name="age" placeholder="Enter Your Age" min="5" max="100" required>

                    <label>Gender</label>
                    <select name="gender" required>
                        <option value="">Select Gender</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>

                <!-- Symptoms -->
                <div class="section">
                    <h2>🧠 Symptoms (Last 3–5 Days)</h2>
                    <div class="severity-indicator">
                        <span>Select all symptoms you've experienced recently</span>
                    </div>
                    
                    <label>Select Symptoms Experienced:</label>
                    <div class="checkbox-group">
                        <label><input type="checkbox" name="selectedSymptoms" value="Fatigue / Always tired"><span>Fatigue / Always tired</span></label>
                        <label><input type="checkbox" name="selectedSymptoms" value="Bloating / Digestive issues"><span>Bloating / Digestive issues</span></label>
                        <label><input type="checkbox" name="selectedSymptoms" value="Hair fall / Brittle nails"><span>Hair fall / Brittle nails</span></label>
                        <label><input type="checkbox" name="selectedSymptoms" value="Brain fog / Low concentration"><span>Brain fog / Low concentration</span></label>
                        <label><input type="checkbox" name="selectedSymptoms" value="Headaches / Sleep disturbances"><span>Headaches / Sleep disturbances</span></label>
                        <label><input type="checkbox" name="selectedSymptoms" value="Sudden weight gain or loss"><span>Sudden weight gain or loss</span></label>
                        <label><input type="checkbox" name="selectedSymptoms" value="Mood swings / Irritability"><span>Mood swings / Irritability</span></label>
                    </div>

                    <label>Other Symptoms</label>
                    <textarea name="symptoms" placeholder="e.g. headache, sore throat, fatigue..." required></textarea>

                    <label>Duration of Symptoms</label>
                    <input type="text" name="duration" placeholder="e.g. 3 days, 1 week" required>

                    <div class="vital-signs">
                        <div class="vital-sign">
                            <label>Body Temperature (°C)</label>
                            <input type="number" name="temperature" placeholder="Enter Body Temperature" step="0.1" min="30" max="45" required>
                        </div>
                        <div class="vital-sign">
                            <label>Heart Rate (BPM)</label>
                            <input type="number" name="heartRate" placeholder="Enter Your Heart Rate" min="40" max="200" required>
                        </div>
                        <div class="vital-sign">
                            <label>Blood Pressure</label>
                            <input type="text" name="bp" placeholder="e.g. 120/80" required>
                        </div>
                    </div>
                </div>

                <!-- Diet -->
                <div class="section">
                    <h2>🍽️ Recent Diet (Last 2 Days)</h2>
                    <label>Food consumed (last 2 days only)</label>
                    <textarea name="dietDetails" required placeholder="e.g. Dal(Toor) and Roti(Wheat)"></textarea>

                    <label>Did you eat out or order online?</label>
                    <select name="ateOut">
                        <option>Yes</option>
                        <option>No</option>
                    </select>

                    <label>Sugar or junk food consumption?</label>
                    <select name="junkLevel">
                        <option>None</option>
                        <option>Mild</option>
                        <option>High</option>
                    </select>

                    <label>Water intake per day (liters)</label>
                    <input type="number" name="waterIntake" placeholder="Enter Your Water Intake" step="0.1" min="0.1" max="10">
                </div>

                <!-- Sleep -->
                <div class="section">
                    <h2>💤 Sleep & Rest</h2>
                    <label>Total sleep hours per night</label>
                    <input type="number" name="sleepHours" placeholder="How Many Hours You Sleep" min="0" max="24">

                    <label>Do you wake up feeling rested?</label>
                    <select name="feelRested">
                        <option>Yes</option>
                        <option>No</option>
                        <option>Kind Of</option>
                    </select>

                    <label>Recent changes in sleep schedule?</label>
                    <select name="sleepChange">
                        <option>Yes</option>
                        <option>No</option>
                    </select>
                </div>

                <!-- Activity -->
                <div class="section">
                    <h2>🏃‍♂️ Physical & Mental Activity</h2>
                    <label>Did you exercise in the last 2 days?</label>
                    <select name="exercisedRecently">
                        <option>Yes</option>
                        <option>No</option>
                    </select>

                    <label>Screen time excluding work (hrs/day)</label>
                    <input type="number" name="screenTime" placeholder="Enter Your Screen Time" min="0" max="24">

                    <label>Mood in the last few days</label>
                    <select name="recentMood">
                        <option>Stable</option>
                        <option>Anxious</option>
                        <option>Irritable</option>
                        <option>Low</option>
                    </select>

                    <label>Stress/workload increased?</label>
                    <select name="stressIncreased">
                        <option>Yes</option>
                        <option>No</option>
                    </select>
                </div>

                <!-- Medical -->
                <div class="section">
                    <h2>🧬 Medical Background</h2>
                    <label>Any existing medical conditions?</label>
                    <textarea name="existing" placeholder="e.g. diabetes, asthma, none"></textarea>

                    <label>Current Medications</label>
                    <textarea name="medications" placeholder="e.g. paracetamol, insulin"></textarea>

                    <label>Known Allergies</label>
                    <textarea name="allergies" placeholder="e.g. peanuts, pollen, none"></textarea>

                    <label>Recent Travel History</label>
                    <textarea name="travelHistory" placeholder="e.g. visited Delhi last week, traveled abroad recently"></textarea>

                    <label>Recent illness, fever, or infection?</label>
                    <select name="recentIllness">
                        <option>Yes</option>
                        <option>No</option>
                    </select>
                </div>
                
                <!-- Habits -->
                <div class="section">
                    <h2>🧪 Lifestyle Habits</h2>

                    <label>Drinking</label>
                    <select name="drinking">
                        <option value="">Select</option>
                        <option>Regular</option>
                        <option>Occasionally</option>
                        <option>Monthly</option>
                        <option>None</option>
                    </select>

                    <label>Smoking</label>
                    <select name="smoking">
                        <option value="">Select</option>
                        <option>Regular</option>
                        <option>Occasionally</option>
                        <option>Monthly</option>
                        <option>None</option>
                    </select>

                    <label>Tobacco/Chewing</label>
                    <select name="tobacco">
                        <option value="">Select</option>
                        <option>Regular</option>
                        <option>Occasionally</option>
                        <option>Monthly</option>
                        <option>None</option>
                    </select>
                    
                    <label>Consumption of any heavy prescribed/illegal drugs</label>
                    <textarea name="drugs" placeholder="e.g. Alprazolam, LSD..." required></textarea>
                </div>

                <!-- Submit -->
                <button type="submit" class="submit-btn">🔍 Get AI Diagnosis</button>
                <a href="SelectSurveyLoggedIN.jsp" class="back-btn">⬅ BACK</a>

                <div class="disclaimer">
                    <strong>⚠️ Disclaimer:</strong> This tool provides AI-based suggestions only. Always consult a certified doctor for diagnosis or treatment.
                </div>
            </form>
        </div>
    </div>

    <script>
        // Create animated background particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            for (let i = 0; i < 60; i++) {
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
            const form = document.getElementById('symptomForm');
            const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
            const checkboxGroups = form.querySelectorAll('input[type="checkbox"]');
            let completed = 0;
            let total = inputs.length;
            
            // Check regular inputs
            inputs.forEach(input => {
                if (input.value.trim() !== '') {
                    completed++;
                }
            });
            
            // Check if at least one checkbox is selected
            const checkedBoxes = Array.from(checkboxGroups).filter(cb => cb.checked);
            if (checkedBoxes.length > 0) {
                completed += 0.5; // Partial credit for checkbox selection
            }
            
            const progress = Math.min((completed / total) * 100, 100);
            document.getElementById('progressBar').style.width = progress + '%';
        }

        // Vital signs validation
        function validateVitalSigns() {
            const temp = document.querySelector('input[name="temperature"]');
            const heartRate = document.querySelector('input[name="heartRate"]');
            
            temp.addEventListener('input', function() {
                const value = parseFloat(this.value);
                if (value > 38.5) {
                    this.style.borderColor = '#22c55e';
                    this.style.boxShadow = '0 0 0 3px rgba(34, 197, 94, 0.3)';
                } else {
                    this.style.borderColor = 'rgba(34, 197, 94, 0.3)';
                    this.style.boxShadow = 'none';
                }
            });
            
            heartRate.addEventListener('input', function() {
                const value = parseInt(this.value);
                if (value > 100 || value < 60) {
                    this.style.borderColor = '#22c55e';
                    this.style.boxShadow = '0 0 0 3px rgba(34, 197, 94, 0.3)';
                } else {
                    this.style.borderColor = 'rgba(34, 197, 94, 0.3)';
                    this.style.boxShadow = 'none';
                }
            });
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            createParticles();
            validateVitalSigns();
            
            const form = document.getElementById('symptomForm');
            const inputs = form.querySelectorAll('input, select, textarea');
            
            inputs.forEach(input => {
                input.addEventListener('input', updateProgressBar);
                input.addEventListener('change', updateProgressBar);
            });
            
            updateProgressBar();
        });

        // Add smooth scroll behavior and intersection observer
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