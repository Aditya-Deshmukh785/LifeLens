<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Feedback - LifeLens</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #0f172a;
      color: #f8fafc;
      padding: 40px;
    }

    .feedback-form {
      max-width: 600px;
      margin: 0 auto;
      background-color: #1e293b;
      padding: 30px;
      border-radius: 16px;
      box-shadow: 0 0 12px rgba(0,0,0,0.4);
    }

    h2 {
      text-align: center;
      color: #22c55e;
    }

    label {
      display: block;
      margin-top: 20px;
      font-weight: bold;
    }

    textarea, input[type="text"], input[type="email"] {
      width: 100%;
      padding: 10px;
      border-radius: 8px;
      border: none;
      margin-top: 8px;
      background-color: white;
      color: black;
    }

    textarea {
      resize: vertical;
      height: 120px;
    }

    button {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #22c55e;
      border: none;
      border-radius: 8px;
      font-size: 1em;
      cursor: pointer;
    }

    button:hover {
      background-color: #16a34a;
    }

    .message {
      margin-top: 20px;
      text-align: center;
      color: #38bdf8;
    }
  </style>
</head>
<body>

  <div class="feedback-form">
    <h2>💬 Send Us Your Feedback</h2>
    <form action="FeedbackServlet" method="post">
      <label for="name">Name</label>
      <input type="text" id="name" name="name" required placeholder="Enter your name">

      <label for="email">Email</label>
      <input type="email" id="email" name="email" required placeholder="Enter your email">

      <label for="shortMessage">Short Message</label>
      <input type="text" id="shortMessage" name="shortMessage" required placeholder="e.g. App is really helpful!">

      <label for="description">Detailed Feedback</label>
      <textarea id="description" name="description" required placeholder="Write your detailed feedback here..."></textarea>

      <button type="submit">Submit Feedback</button>
    </form>

    <div class="message">
      <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>
  </div>

</body>
</html>
