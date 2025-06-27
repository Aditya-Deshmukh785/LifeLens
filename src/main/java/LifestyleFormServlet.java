import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.*;
import org.json.JSONObject;
import org.json.JSONArray;

public class LifestyleFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject jsonPayload = new JSONObject();

        // 🧍 General Info
        jsonPayload.put("fullName", request.getParameter("fullName"));
        jsonPayload.put("age", parseInt(request.getParameter("age")));
        jsonPayload.put("gender", request.getParameter("gender"));
        jsonPayload.put("height", parseDouble(request.getParameter("height")));
        jsonPayload.put("weight", parseDouble(request.getParameter("weight")));

        // 💤 Sleep Habits
        jsonPayload.put("sleepDuration", parseDouble(request.getParameter("sleepDuration")));
        jsonPayload.put("sleepTiming", request.getParameter("sleepTiming"));
        jsonPayload.put("sleepQuality", request.getParameter("sleepQuality"));

        // 🥗 Diet & Nutrition
        jsonPayload.put("mealsPerDay", parseInt(request.getParameter("mealsPerDay")));
        jsonPayload.put("snacking", request.getParameter("snacking"));
        jsonPayload.put("waterIntake", parseDouble(request.getParameter("waterIntake")));
        jsonPayload.put("junkFood", request.getParameter("junkFood"));
        jsonPayload.put("fruitVegServings", parseInt(request.getParameter("fruitVegServings")));

        // 🏃 Physical Activity
        jsonPayload.put("exerciseFrequency", request.getParameter("exerciseFrequency"));
        jsonPayload.put("exerciseDuration", parseInt(request.getParameter("exerciseDuration")));

        JSONArray activityArray = new JSONArray();
        String[] activityTypes = request.getParameterValues("activityType");
        if (activityTypes != null) {
            for (String activity : activityTypes) {
                activityArray.put(activity);
            }
        }
        jsonPayload.put("activityType", activityArray);

        jsonPayload.put("otherActivity", request.getParameter("otherActivity"));

        // 🧠 Mental Wellness
        jsonPayload.put("stress", request.getParameter("stress"));
        jsonPayload.put("screenTime", parseDouble(request.getParameter("screenTime")));
        jsonPayload.put("workLife", request.getParameter("workLife"));

        // 💼 Work & Lifestyle
        jsonPayload.put("jobType", request.getParameter("jobType"));
        jsonPayload.put("workHours", parseDouble(request.getParameter("workHours")));
        jsonPayload.put("commuteTime", parseDouble(request.getParameter("commuteTime")));

        // 🩺 Health & Deficiency
        jsonPayload.put("sickFrequency", parseInt(request.getParameter("sickFrequency")));
        jsonPayload.put("hairFall", request.getParameter("hairFall"));
        jsonPayload.put("diseaseDetails", request.getParameter("diseaseDetails"));

        // 📤 Debug: print payload
        System.out.println("Sending JSON to Flask:");
        System.out.println(jsonPayload.toString(2));

        // 🌐 HTTP Request to Flask
        String suggestion = "No suggestions generated";
        HttpURLConnection conn = null;

        try {
            URL url = new URL("http://localhost:5000/generate_suggestion");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonPayload.toString().getBytes("UTF-8"));
            }

            int responseCode = conn.getResponseCode();
            if (responseCode != 200) {
                try (BufferedReader err = new BufferedReader(
                        new InputStreamReader(conn.getErrorStream()))) {
                    String errorLine;
                    StringBuilder errorResponse = new StringBuilder();
                    while ((errorLine = err.readLine()) != null) {
                        errorResponse.append(errorLine);
                    }
                    throw new IOException("HTTP " + responseCode + ": " + errorResponse.toString());
                }
            }

            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()))) {
                StringBuilder responseText = new StringBuilder();
                String line;
                while ((line = in.readLine()) != null) {
                    responseText.append(line);
                }
                JSONObject jsonResponse = new JSONObject(responseText.toString());
                suggestion = jsonResponse.getString("suggestion").replace("\n", "<br>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            suggestion = "⚠ Error: " + e.getMessage();
        } finally {
            if (conn != null) conn.disconnect();
        }

        request.setAttribute("aiSuggestion", suggestion);
        request.getRequestDispatcher("SuggestedLifestyleChanges.jsp").forward(request, response);
    }

    private int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private double parseDouble(String value) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return 0.0;
        }
    }
}