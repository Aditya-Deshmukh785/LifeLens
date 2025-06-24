import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.*;

public class LifestyleFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 📋 General Info
        String fullName = request.getParameter("fullName");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");

        // 🛏 Sleep Habits
        String sleepDuration = request.getParameter("sleepDuration");
        String sleepTiming = request.getParameter("sleepTiming");
        String sleepQuality = request.getParameter("sleepQuality");

        // 🍽️ Diet & Nutrition
        String mealsPerDay = request.getParameter("mealsPerDay");
        String snacking = request.getParameter("snacking");
        String waterIntake = request.getParameter("waterIntake");
        String junkFood = request.getParameter("junkFood");
        String fruitVegServings = request.getParameter("fruitVegServings");

        // 🏃 Physical Activities
        String exerciseFrequency = request.getParameter("exerciseFrequency");
        String exerciseDuration = request.getParameter("exerciseDuration");
        String[] activityType = request.getParameterValues("activityType");

        // 🧠 Mental Wellness
        String stress = request.getParameter("stress");
        String screenTime = request.getParameter("screenTime");
        String workLife = request.getParameter("workLife");

        // 💼 Lifestyle & Work
        String jobType = request.getParameter("jobType");
        String workHours = request.getParameter("workHours");
        String commuteTime = request.getParameter("commuteTime");

        // ⚠️ Deficiency Check
        String sickFrequency = request.getParameter("sickFrequency");
        String hairFall = request.getParameter("hairFall");
        String diseaseDetails = request.getParameter("diseaseDetails");

        // Convert activityType[] to comma-separated string
        String activityString = "";
        if (activityType != null) {
            activityString = String.join("\", \"", activityType);
        }

        // 🧾 1. Construct JSON Payload
        String jsonInput = String.format(
            "{" +
                "\"fullName\":\"%s\", \"age\":\"%s\", \"gender\":\"%s\", " +
                "\"height\":\"%s\", \"weight\":\"%s\", " +
                "\"sleepDuration\":\"%s\", \"sleepTiming\":\"%s\", \"sleepQuality\":\"%s\", " +
                "\"mealsPerDay\":\"%s\", \"snacking\":\"%s\", \"waterIntake\":\"%s\", \"junkFood\":\"%s\", \"fruitVegServings\":\"%s\", " +
                "\"exerciseFrequency\":\"%s\", \"exerciseDuration\":\"%s\", \"activityType\":[\"%s\"], " +
                "\"stress\":\"%s\", \"screenTime\":\"%s\", \"workLife\":\"%s\", " +
                "\"jobType\":\"%s\", \"workHours\":\"%s\", \"commuteTime\":\"%s\", " +
                "\"sickFrequency\":\"%s\", \"hairFall\":\"%s\", \"diseaseDetails\":\"%s\"" +
            "}",
            fullName, age, gender, height, weight,
            sleepDuration, sleepTiming, sleepQuality,
            mealsPerDay, snacking, waterIntake, junkFood, fruitVegServings,
            exerciseFrequency, exerciseDuration, activityString,
            stress, screenTime, workLife,
            jobType, workHours, commuteTime,
            sickFrequency, hairFall, diseaseDetails
        );

        
        URL url = new URL("http://localhost:5000/generate_suggestion");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonInput.getBytes("UTF-8"));
            os.flush();
        }

        
        StringBuilder responseText = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = in.readLine()) != null) {
                responseText.append(line);
            }
        }

        
        String suggestionJson = responseText.toString();
        String suggestion = suggestionJson.replace("{\"suggestion\":\"", "")
                                          .replace("\"}", "")
                                          .replace("\\n", "<br>") // format for HTML
                                          .replace("\\\"", "\"");

        
        request.setAttribute("aiSuggestion", suggestion);
        request.getRequestDispatcher("SuggestedLifestyleChanges.jsp").forward(request, response);
        
    }
}
