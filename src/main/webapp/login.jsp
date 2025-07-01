<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login - LifeLens</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: linear-gradient(135deg, #0f172a 0%, #1e293b 25%, #334155 50%, #1e293b 75%, #0f172a 100%);
    background-size: 400% 400%;
    animation: gradientShift 8s ease infinite;
    color: #f8fafc;
    font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
    height: 100vh;
    overflow: hidden;
    position: relative;
}

@keyframes gradientShift {
    0%, 100% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
}

/* Animated background particles */
.particles {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    z-index: 1;
}

.particle {
    position: absolute;
    background: rgba(34, 197, 94, 0.1);
    border-radius: 50%;
    animation: float 6s ease-in-out infinite;
}

.particle:nth-child(1) { width: 20px; height: 20px; left: 10%; animation-delay: 0s; }
.particle:nth-child(2) { width: 15px; height: 15px; left: 20%; animation-delay: 1s; }
.particle:nth-child(3) { width: 25px; height: 25px; left: 30%; animation-delay: 2s; }
.particle:nth-child(4) { width: 18px; height: 18px; left: 40%; animation-delay: 3s; }
.particle:nth-child(5) { width: 22px; height: 22px; left: 50%; animation-delay: 4s; }
.particle:nth-child(6) { width: 16px; height: 16px; left: 60%; animation-delay: 5s; }
.particle:nth-child(7) { width: 24px; height: 24px; left: 70%; animation-delay: 1.5s; }
.particle:nth-child(8) { width: 19px; height: 19px; left: 80%; animation-delay: 2.5s; }
.particle:nth-child(9) { width: 21px; height: 21px; left: 90%; animation-delay: 3.5s; }

@keyframes float {
    0%, 100% { 
        transform: translateY(100vh) rotate(0deg);
        opacity: 0;
    }
    10% { opacity: 1; }
    90% { opacity: 1; }
    50% { 
        transform: translateY(-10vh) rotate(180deg);
        opacity: 0.7;
    }
}

/* Main container */
.main-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    position: relative;
    z-index: 2;
}

.login-container {
    background: rgba(30, 41, 59, 0.95);
    backdrop-filter: blur(20px);
    padding: 50px 40px;
    border-radius: 24px;
    box-shadow: 
        0 20px 60px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(34, 197, 94, 0.1),
        inset 0 1px 0 rgba(255, 255, 255, 0.1);
    text-align: center;
    width: 450px;
    max-width: 90vw;
    position: relative;
    animation: containerSlideIn 1s ease-out;
    overflow: hidden;
}

@keyframes containerSlideIn {
    0% {
        opacity: 0;
        transform: translateY(50px) scale(0.9);
    }
    100% {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

/* Glowing border effect */
.login-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius: 24px;
    padding: 2px;
    background: linear-gradient(45deg, #22c55e, #3b82f6, #8b5cf6, #22c55e);
    background-size: 400% 400%;
    animation: gradientRotate 4s ease infinite;
    mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
    mask-composite: exclude;
    -webkit-mask-composite: xor;
    z-index: -1;
}

@keyframes gradientRotate {
    0%, 100% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
}

/* Header styling */
.header {
    margin-bottom: 30px;
    animation: headerFadeIn 1.2s ease-out 0.3s both;
}

@keyframes headerFadeIn {
    0% {
        opacity: 0;
        transform: translateY(-20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.logo {
    font-size: 3.5rem;
    margin-bottom: 10px;
    animation: logoFloat 3s ease-in-out infinite;
}

@keyframes logoFloat {
    0%, 100% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
}

h2 {
    color: #22c55e;
    font-size: 2.2rem;
    font-weight: 700;
    margin-bottom: 8px;
    background: linear-gradient(135deg, #22c55e, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.subtitle {
    color: #cbd5e1;
    font-size: 1.1rem;
    font-weight: 400;
    opacity: 0.9;
}

/* Google button styling */
.google-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    background: linear-gradient(135deg, #4285F4 0%, #357ae8 100%);
    color: white;
    padding: 16px 32px;
    border: none;
    border-radius: 12px;
    text-decoration: none;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
    min-width: 280px;
    animation: buttonSlideIn 1.4s ease-out 0.6s both;
    box-shadow: 0 8px 25px rgba(66, 133, 244, 0.3);
}

@keyframes buttonSlideIn {
    0% {
        opacity: 0;
        transform: translateY(30px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.google-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: left 0.6s;
}

.google-btn:hover::before {
    left: 100%;
}

.google-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 35px rgba(66, 133, 244, 0.4);
    background: linear-gradient(135deg, #357ae8 0%, #2563eb 100%);
}

.google-btn:active {
    transform: translateY(-1px);
}

.google-icon {
    width: 24px;
    height: 24px;
    background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 48 48'%3E%3Cpath fill='%23EA4335' d='M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z'/%3E%3Cpath fill='%2334A853' d='M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z'/%3E%3Cpath fill='%234285F4' d='M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z'/%3E%3Cpath fill='%23FBBC05' d='M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z'/%3E%3Cpath fill='none' d='M0 0h48v48H0z'/%3E%3C/svg%3E") center/contain no-repeat;
}

/* Security note */
.note {
    margin-top: 30px;
    font-size: 0.95rem;
    color: #94a3b8;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    animation: noteSlideIn 1.6s ease-out 0.9s both;
}

@keyframes noteSlideIn {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.security-icon {
    color: #22c55e;
    font-size: 1.1rem;
}

/* Pulse effect for the container */
@keyframes pulse {
    0%, 100% { box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(34, 197, 94, 0.1); }
    50% { box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(34, 197, 94, 0.3); }
}

.login-container:hover {
    animation: pulse 2s ease-in-out infinite;
}

/* Responsive design */
@media (max-width: 480px) {
    .login-container {
        padding: 40px 30px;
        width: 95vw;
    }
    
    h2 {
        font-size: 1.8rem;
    }
    
    .google-btn {
        min-width: 250px;
        padding: 14px 28px;
    }
}

/* Additional visual enhancements */
.feature-highlight {
    position: absolute;
    top: -50px;
    right: -50px;
    width: 100px;
    height: 100px;
    background: radial-gradient(circle, rgba(34, 197, 94, 0.1) 0%, transparent 70%);
    border-radius: 50%;
    animation: highlightPulse 4s ease-in-out infinite;
}

@keyframes highlightPulse {
    0%, 100% { transform: scale(1); opacity: 0.5; }
    50% { transform: scale(1.2); opacity: 0.8; }
}
</style>
</head>
<body>

<!-- Animated background particles -->
<div class="particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
</div>

<div class="main-container">
    <div class="login-container">
        <div class="feature-highlight"></div>
        
        <div class="header">
            <div class="logo">🩺</div>
            <h2>LifeLens</h2>
            <p class="subtitle">Your Personal Health Companion</p>
        </div>

        <a class="google-btn"
           href="https://accounts.google.com/o/oauth2/v2/auth?scope=openid%20email%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FLifeLens%2FGoogleOAuthServlet&response_type=code&client_id=193964380377-4325skno0dmpg1ka3bpq09se8j8ig5pm.apps.googleusercontent.com&access_type=offline">
            <div class="google-icon"></div>
            Continue with Google
        </a>

        <div class="note">
            <span class="security-icon">🔒</span>
            Secured by Google OAuth 2.0
        </div>
    </div>
</div>

</body>
</html>