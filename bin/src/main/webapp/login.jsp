<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - LifeLens</title>
    <style>
        body {
            background-color: #0f172a;
            color: #f8fafc;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #1e293b;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 400px;
        }

        h2 {
            color: #22c55e;
            margin-bottom: 20px;
        }

        .google-btn {
            display: inline-block;
            background-color: #4285F4;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 1em;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .google-btn:hover {
            background-color: #357ae8;
        }

        .note {
            margin-top: 20px;
            font-size: 0.9em;
            color: #cbd5e1;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Welcome to LifeLens 🩺</h2>
        <p>Login with Google to take your personalized survey</p>
        
     <a class="google-btn" 
   href="https://accounts.google.com/o/oauth2/v2/auth?scope=openid%20email%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FLifeLens%2FGoogleOAuthServlet&response_type=code&client_id=193964380377-4325skno0dmpg1ka3bpq09se8j8ig5pm.apps.googleusercontent.com&access_type=offline">
   Login with Google
</a>



        <p class="note">Secure login via Google OAuth 2.0</p>
    </div>

</body>
</html>
