import java.io.*;
import java.net.*;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GoogleOAuthServlet")
public class GoogleOAuthServlet extends HttpServlet {

    private static final String CLIENT_ID = "193964380377-4325skno0dmpg1ka3bpq09se8j8ig5pm.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/LifeLens/GoogleOAuthServlet";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        URI tokenURI = URI.create(tokenEndpoint);
        URL url = tokenURI.toURL();

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.getOutputStream().write(params.getBytes("UTF-8"));

        // Check for error in token response
        int responseCode = conn.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            response.getWriter().println("Failed to exchange code for token. HTTP response code: " + responseCode);
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
            response.getWriter().println("Access token not found in the token response.");
            return;
        }

        String accessToken = json.getString("access_token");

        // Step 2: Get user info
        URI userInfoURI = URI.create("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken);
        URL userInfoURL = userInfoURI.toURL();

        HttpURLConnection userConn = (HttpURLConnection) userInfoURL.openConnection();
        userConn.setRequestMethod("GET");

        if (userConn.getResponseCode() != HttpURLConnection.HTTP_OK) {
            response.getWriter().println("Failed to fetch user info.");
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
