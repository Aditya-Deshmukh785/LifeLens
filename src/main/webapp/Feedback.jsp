<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Feedback - LifeLens</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
    min-height: 100vh;
    position: relative;
    overflow-x: hidden;
}

/* Animated background particles */
.particles {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    z-index: 1;
}

.particle {
    position: absolute;
    background: rgba(34, 197, 94, 0.3);
    border-radius: 50%;
    animation: float 6s ease-in-out infinite;
}

.particle:nth-child(1) { width: 4px; height: 4px; left: 10%; animation-delay: 0s; }
.particle:nth-child(2) { width: 6px; height: 6px; left: 20%; animation-delay: 1s; }
.particle:nth-child(3) { width: 3px; height: 3px; left: 30%; animation-delay: 2s; }
.particle:nth-child(4) { width: 5px; height: 5px; left: 40%; animation-delay: 0.5s; }
.particle:nth-child(5) { width: 4px; height: 4px; left: 60%; animation-delay: 1.5s; }
.particle:nth-child(6) { width: 6px; height: 6px; left: 70%; animation-delay: 2.5s; }
.particle:nth-child(7) { width: 3px; height: 3px; left: 80%; animation-delay: 3s; }
.particle:nth-child(8) { width: 5px; height: 5px; left: 90%; animation-delay: 0.3s; }

@keyframes float {
    0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
    10%, 90% { opacity: 1; }
    50% { transform: translateY(-100px) rotate(180deg); }
}

.container {
    position: relative;
    z-index: 2;
    padding: 40px 20px;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.feedback-wrapper {
    width: 100%;
    max-width: 700px;
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

.feedback-header {
    text-align: center;
    margin-bottom: 40px;
}

.header-icon {
    font-size: 4rem;
    margin-bottom: 20px;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
}

.feedback-title {
    font-size: 2.5rem;
    font-weight: 700;
    background: linear-gradient(135deg, #22c55e, #10b981, #06d6a0);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 10px;
}

.feedback-subtitle {
    color: #cbd5e1;
    font-size: 1.1rem;
    opacity: 0.9;
}

.feedback-form {
    background: rgba(30, 41, 59, 0.8);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(34, 197, 94, 0.2);
    padding: 40px;
    border-radius: 24px;
    box-shadow: 
        0 25px 50px -12px rgba(0, 0, 0, 0.5),
        0 0 0 1px rgba(34, 197, 94, 0.1);
    transition: all 0.3s ease;
}

.feedback-form:hover {
    transform: translateY(-5px);
    box-shadow: 
        0 35px 60px -12px rgba(0, 0, 0, 0.6),
        0 0 0 1px rgba(34, 197, 94, 0.2);
}

.form-group {
    margin-bottom: 25px;
    position: relative;
}

.form-group label {
    display: block;
    font-weight: 600;
    color: #f1f5f9;
    margin-bottom: 8px;
    font-size: 0.95rem;
    transition: color 0.3s ease;
}

.input-wrapper {
    position: relative;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 15px 20px;
    border-radius: 12px;
    border: 2px solid rgba(71, 85, 105, 0.3);
    background: rgba(15, 23, 42, 0.6);
    color: #f8fafc;
    font-size: 1rem;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
}

.form-group input::placeholder,
.form-group textarea::placeholder {
    color: #94a3b8;
    opacity: 0.7;
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #22c55e;
    background: rgba(15, 23, 42, 0.8);
    box-shadow: 0 0 0 4px rgba(34, 197, 94, 0.1);
    transform: translateY(-2px);
}

.form-group input:focus + .input-glow,
.form-group textarea:focus + .input-glow {
    opacity: 1;
}

.input-glow {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius: 12px;
    background: linear-gradient(135deg, rgba(34, 197, 94, 0.1), rgba(16, 185, 129, 0.1));
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
    z-index: -1;
}

textarea {
    resize: vertical;
    min-height: 120px;
    font-family: inherit;
}

.submit-btn {
    width: 100%;
    padding: 16px 32px;
    background: linear-gradient(135deg, #22c55e, #16a34a);
    border: none;
    border-radius: 12px;
    color: white;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    margin-top: 20px;
}

.submit-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 35px rgba(34, 197, 94, 0.4);
}

.submit-btn:active {
    transform: translateY(-1px);
}

.submit-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: left 0.5s;
}

.submit-btn:hover::before {
    left: 100%;
}

.message {
    margin-top: 25px;
    padding: 15px 20px;
    text-align: center;
    border-radius: 12px;
    font-weight: 500;
    background: linear-gradient(135deg, rgba(56, 189, 248, 0.1), rgba(59, 130, 246, 0.1));
    border: 1px solid rgba(56, 189, 248, 0.3);
    color: #60a5fa;
    animation: messageSlide 0.5s ease-out;
}

@keyframes messageSlide {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.rating-section {
    margin-bottom: 25px;
}

.star-rating {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin-top: 10px;
}

.star {
    font-size: 2rem;
    color: #475569;
    cursor: pointer;
    transition: all 0.2s ease;
    user-select: none;
}

.star:hover,
.star.active {
    color: #fbbf24;
    transform: scale(1.2);
}

.star:hover ~ .star {
    color: #475569;
    transform: scale(1);
}

.feedback-stats {
    display: flex;
    justify-content: space-around;
    margin-top: 30px;
    padding-top: 25px;
    border-top: 1px solid rgba(71, 85, 105, 0.3);
}

.stat-item {
    text-align: center;
    opacity: 0.8;
}

.stat-number {
    font-size: 1.5rem;
    font-weight: 700;
    color: #22c55e;
    display: block;
}

.stat-label {
    font-size: 0.8rem;
    color: #94a3b8;
    margin-top: 4px;
}

@media (max-width: 768px) {
    .container {
        padding: 20px 15px;
    }
    
    .feedback-form {
        padding: 25px;
    }
    
    .feedback-title {
        font-size: 2rem;
    }
    
    .feedback-stats {
        flex-direction: column;
        gap: 15px;
    }
}
</style>
</head>
<body>

<div class="particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
</div>

<div class="container">
    <div class="feedback-wrapper">
        <div class="feedback-header">
            <div class="header-icon">💬</div>
            <h1 class="feedback-title">Share Your Experience</h1>
            <p class="feedback-subtitle">Your feedback helps us make LifeLens better for everyone</p>
        </div>

        <div class="feedback-form">
            <form action="FeedbackServlet" method="post">
                <div class="form-group">
                    <label for="name">Your Name</label>
                    <div class="input-wrapper">
                        <input type="text" id="name" name="name" required placeholder="Enter your full name">
                        <div class="input-glow"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <input type="email" id="email" name="email" required placeholder="your.email@example.com">
                        <div class="input-glow"></div>
                    </div>
                </div>

                <div class="form-group rating-section">
                    <label>Rate Your Experience</label>
                    <div class="star-rating" id="starRating">
                        <span class="star" data-rating="1">★</span>
                        <span class="star" data-rating="2">★</span>
                        <span class="star" data-rating="3">★</span>
                        <span class="star" data-rating="4">★</span>
                        <span class="star" data-rating="5">★</span>
                    </div>
                    <input type="hidden" id="rating" name="rating" value="5">
                </div>

                <div class="form-group">
                    <label for="shortMessage">Quick Summary</label>
                    <div class="input-wrapper">
                        <input type="text" id="shortMessage" name="shortMessage" required placeholder="e.g., Amazing diagnostic accuracy!">
                        <div class="input-glow"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Detailed Feedback</label>
                    <div class="input-wrapper">
                        <textarea id="description" name="description" required placeholder="Tell us more about your experience with LifeLens. What did you like? What could we improve?"></textarea>
                        <div class="input-glow"></div>
                    </div>
                </div>

                <button type="submit" class="submit-btn">
                    Send Feedback ✨
                </button>
            </form>

            <% if(request.getAttribute("message") != null) { %>
            <div class="message">
                <%= request.getAttribute("message") %>
            </div>
            <% } %>

            <div class="feedback-stats">
                <div class="stat-item">
                    <span class="stat-number">1,247</span>
                    <span class="stat-label">Happy Users</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">4.8</span>
                    <span class="stat-label">Avg Rating</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">99.2%</span>
                    <span class="stat-label">Satisfaction</span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Star rating functionality
const stars = document.querySelectorAll('.star');
const ratingInput = document.getElementById('rating');

stars.forEach(star => {
    star.addEventListener('click', function() {
        const rating = this.getAttribute('data-rating');
        ratingInput.value = rating;
        
        stars.forEach((s, index) => {
            if (index < rating) {
                s.classList.add('active');
            } else {
                s.classList.remove('active');
            }
        });
    });
    
    star.addEventListener('mouseenter', function() {
        const rating = this.getAttribute('data-rating');
        
        stars.forEach((s, index) => {
            if (index < rating) {
                s.style.color = '#fbbf24';
                s.style.transform = 'scale(1.2)';
            } else {
                s.style.color = '#475569';
                s.style.transform = 'scale(1)';
            }
        });
    });
});

document.querySelector('.star-rating').addEventListener('mouseleave', function() {
    const currentRating = ratingInput.value;
    
    stars.forEach((s, index) => {
        if (index < currentRating) {
            s.style.color = '#fbbf24';
            s.style.transform = 'scale(1.2)';
        } else {
            s.style.color = '#475569';
            s.style.transform = 'scale(1)';
        }
    });
});

// Initialize with 5-star rating
document.addEventListener('DOMContentLoaded', function() {
    stars.forEach(star => star.classList.add('active'));
});

// Form submission with loading state
document.querySelector('form').addEventListener('submit', function(e) {
    const submitBtn = document.querySelector('.submit-btn');
    submitBtn.innerHTML = 'Sending... ⏳';
    submitBtn.style.background = 'linear-gradient(135deg, #6b7280, #4b5563)';
});

// Animate stats on scroll
const observerOptions = {
    threshold: 0.5
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateStats();
        }
    });
}, observerOptions);

observer.observe(document.querySelector('.feedback-stats'));

function animateStats() {
    const statNumbers = document.querySelectorAll('.stat-number');
    
    statNumbers.forEach((stat, index) => {
        const finalNumber = stat.textContent;
        stat.textContent = '0';
        
        setTimeout(() => {
            animateNumber(stat, finalNumber);
        }, index * 200);
    });
}

function animateNumber(element, target) {
    const isDecimal = target.includes('.');
    const isPercentage = target.includes('%');
    const numericTarget = parseFloat(target.replace(/[^\d.]/g, ''));
    
    let current = 0;
    const increment = numericTarget / 50;
    
    const timer = setInterval(() => {
        current += increment;
        
        if (current >= numericTarget) {
            current = numericTarget;
            clearInterval(timer);
        }
        
        let displayValue = isDecimal ? current.toFixed(1) : Math.floor(current).toLocaleString();
        if (isPercentage) displayValue += '%';
        
        element.textContent = displayValue;
    }, 40);
}
</script>

</body>
</html>