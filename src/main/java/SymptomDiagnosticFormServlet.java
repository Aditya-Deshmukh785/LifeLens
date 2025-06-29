import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/SymptomDiagnosticFormServlet")
public class SymptomDiagnosticFormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // 1. Collect form fields exactly as named in JSP
        String fullName          = request.getParameter("name");
        String age               = request.getParameter("age");
        String gender            = request.getParameter("gender");

        String[] selectedSymptoms = request.getParameterValues("selectedSymptoms");
        String otherSymptoms     = request.getParameter("symptoms");

        String duration          = request.getParameter("duration");
        String temperature       = request.getParameter("temperature");
        String heartRate         = request.getParameter("heartRate");
        String bp                = request.getParameter("bp");

        String dietDetails       = request.getParameter("dietDetails");
        String ateOut            = request.getParameter("ateOut");
        String junkLevel         = request.getParameter("junkLevel");
        String waterIntake       = request.getParameter("waterIntake");

        String sleepHours        = request.getParameter("sleepHours");
        String feelRested        = request.getParameter("feelRested");
        String sleepChange       = request.getParameter("sleepChange");

        String exercisedRecently = request.getParameter("exercisedRecently");
        String screenTime        = request.getParameter("screenTime");
        String recentMood        = request.getParameter("recentMood");
        String stressIncreased   = request.getParameter("stressIncreased");

        String existing          = request.getParameter("existing");
        String medications       = request.getParameter("medications");
        String allergies         = request.getParameter("allergies");
        String travelHistory     = request.getParameter("travelHistory");
        String recentIllness     = request.getParameter("recentIllness");

        // 🆕 Habits section
        String drinking          = request.getParameter("drinking");
        String smoking           = request.getParameter("smoking");
        String tobacco           = request.getParameter("tobacco");
        String drugs             = request.getParameter("drugs");

        // 2. Build JSON payload
        JSONArray symptomArray = new JSONArray();
        if (selectedSymptoms != null) {
            for (String s : selectedSymptoms) symptomArray.put(s);
        }
        if (otherSymptoms != null && !otherSymptoms.isBlank()) {
            symptomArray.put(otherSymptoms);
        }

        JSONObject payload = new JSONObject()
                .put("fullName", fullName)
                .put("age", age)
                .put("gender", gender)
                .put("symptoms", symptomArray)
                .put("duration", duration)
                .put("temperature", temperature)
                .put("heartRate", heartRate)
                .put("bloodPressure", bp)
                .put("dietDetails", dietDetails)
                .put("ateOut", ateOut)
                .put("junkLevel", junkLevel)
                .put("waterIntake", waterIntake)
                .put("sleepHours", sleepHours)
                .put("feelRested", feelRested)
                .put("sleepChange", sleepChange)
                .put("exercisedRecently", exercisedRecently)
                .put("screenTime", screenTime)
                .put("recentMood", recentMood)
                .put("stressIncreased", stressIncreased)
                .put("existingConditions", existing)
                .put("medications", medications)
                .put("allergies", allergies)
                .put("recentTravel", travelHistory)
                .put("recentIllness", recentIllness)

                // 🔥 New fields added
                .put("drinking", drinking)
                .put("smoking", smoking)
                .put("tobacco", tobacco)
                .put("drugUsage", drugs);

        // 3. POST to Flask /analyze_symptoms
        URL url = new URL("http://localhost:5000/analyze_symptoms");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(payload.toString().getBytes("UTF-8"));
        }

        // 4. Read and parse Flask response
        StringBuilder responseText = new StringBuilder();
        try (BufferedReader in = new BufferedReader(
                new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = in.readLine()) != null) {
                responseText.append(line);
            }
        }

        // Debug print
        System.out.println("🧠 Flask Response JSON:");
        System.out.println(responseText.toString());

        String suggestion;
        try {
            JSONObject jsonResponse = new JSONObject(responseText.toString());
            suggestion = jsonResponse.getString("suggestion"); // don't modify here!
        } catch (Exception e) {
            e.printStackTrace();
            suggestion = "⚠ Error while parsing AI response: " + e.getMessage();
        }


        // 5. Forward to JSP
        request.setAttribute("aiSuggestion", suggestion);
        request.getRequestDispatcher("SuggestedDiagnosticChanges.jsp")
               .forward(request, response);
    }
}
