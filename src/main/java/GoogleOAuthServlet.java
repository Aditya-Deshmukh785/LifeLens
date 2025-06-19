import java.io.*;
import java.net.*;
import java.util.Properties;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GoogleOAuthServlet")
public class GoogleOAuthServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Load secrets from config.properties (real path)
        Properties props = new Properties();
        String fullPath = getServletContext().getRealPath("/WEB-INF/config.properties");

        try (FileInputStream fis = new FileInputStream(fullPath)) {
            props.load(fis);
        } catch (IOException e) {
            response.getWriter().println("❌ Error loading config: " + e.getMessage());
            return;
        }

        String CLIENT_ID = props.getProperty("CLIENT_ID");
        String CLIENT_SECRET = props.getProperty("CLIENT_SECRET");
        String REDIRECT_URI = props.getProperty("REDIRECT_URI");

        // ✅ Debug prints
        System.out.println("CLIENT_ID: " + CLIENT_ID);
        System.out.println("CLIENT_SECRET: " + CLIENT_SECRET);
        System.out.println("REDIRECT_URI: " + REDIRECT_URI);

        // 🔍 Get code from query param
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            response.getWriter().println("No authorization code found.");
            return;
        }

        // Step 1: Exchange code for access token
        String tokenEndpoint = "https://oauth2.googleapis.com/token";
        String params = "code=" + URLEncoder.encode(code, "UTF-8") +
                        "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8") +
                        "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8") +
                        "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8") +
                        "&grant_type=authorization_code";

        URL url = new URL(tokenEndpoint);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.getOutputStream().write(params.getBytes("UTF-8"));

        int responseCode = conn.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            response.getWriter().println("❌ Failed to exchange code for token. HTTP response code: " + responseCode);
            return;
        }

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder responseBody = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            responseBody.append(inputLine);
        }
        in.close();

        JSONObject json = new JSONObject(responseBody.toString());

        if (!json.has("access_token")) {
            response.getWriter().println("❌ Access token not found in the token response.");
            return;
        }

        String accessToken = json.getString("access_token");

        // Step 2: Get user info
        URL userInfoURL = new URL("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken);
        HttpURLConnection userConn = (HttpURLConnection) userInfoURL.openConnection();
        userConn.setRequestMethod("GET");

        if (userConn.getResponseCode() != HttpURLConnection.HTTP_OK) {
            response.getWriter().println("❌ Failed to fetch user info.");
            return;
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(userConn.getInputStream()));
        StringBuilder userInfo = new StringBuilder();
        while ((inputLine = reader.readLine()) != null) {
            userInfo.append(inputLine);
        }
        reader.close();

        JSONObject userJSON = new JSONObject(userInfo.toString());
        String name = userJSON.optString("name", "Unknown");
        String email = userJSON.optString("email", "Not provided");
        String picture = userJSON.optString("picture", "");

        HttpSession session = request.getSession();
        session.setAttribute("userName", name);
        session.setAttribute("userEmail", email);
        session.setAttribute("userPicture", picture);

        response.sendRedirect("SelectSurveyLoggedIN.jsp");
    }
}
