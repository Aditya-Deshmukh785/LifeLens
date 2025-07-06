# 🩺 LifeLens – AI-Powered Lifestyle & Health Insight Web App

👉 **Live Demo**: [https://lifelens-frontend-deploy-2.onrender.com](https://lifelens-frontend-deploy-2.onrender.com)

LifeLens is a smart web application that uses **AI** to provide **personalized health and lifestyle suggestions**. Through intuitive surveys and smart diagnostics, users can understand potential lifestyle risks or get guidance based on their symptoms — all backed by AI analysis.

---

## 🧠 Why We Built LifeLens

Modern lifestyles are full of stress, irregular routines, and poor habits. People often:

- Don’t realize their habits are hurting them.
- Ignore early symptoms of health issues.
- Lack access to immediate personalized guidance.

🚀 **LifeLens bridges that gap** by analyzing user responses and delivering custom lifestyle tips or possible causes of their symptoms using **AI-based insights**.

---

## ✨ Features

- 🔐 **Google Sign-In** for easy and secure access
- 📋 **Two smart surveys**:
  1. **Lifestyle Risk Assessment** – checks your daily habits and flags potential risks
  2. **Symptom Diagnostic** – lets users describe health symptoms to get AI-based cause predictions
- 🤖 **AI-generated personalized suggestions**
- 🌙 Clean, dark-themed responsive UI
- 🔄 Seamless integration of frontend (JSP/Servlets) with backend AI (Flask + GPT API)

---

## 🛠️ Technologies Used

**Frontend:**
- JSP, Servlets (Java EE)
- HTML, CSS, JavaScript

**Backend:**
- Python Flask API
- OpenAI GPT model for generating suggestions

**Deployment:**
- Java app on **Render (Tomcat Server)**
- Flask app on **Render (Python Service)**

---

## 🧪 How It Works (Flow)

1. **User visits** `entry.html` → picks a survey
2. **Signs in** with Google
3. Fills the selected form:
   - Lifestyle or
   - Symptom survey
4. Data is POSTed to the Flask backend
5. GPT processes input → sends suggestions back
6. Servlet displays suggestions on a styled JSP page

---

## 🚀 Getting Started Locally

### Prerequisites
- Java 17+
- Apache Tomcat 10+
- Python 3.10+
- Flask & OpenAI Python SDK
- MySQL (optional for storing users)

### Run Java App
1. Import the project in Eclipse/IntelliJ
2. Deploy it on your local Tomcat server
3. Make sure `config.properties` contains your Google OAuth credentials

### Run Flask App
```bash
cd lifelens-backend
pip install -r requirements.txt
python app.py

