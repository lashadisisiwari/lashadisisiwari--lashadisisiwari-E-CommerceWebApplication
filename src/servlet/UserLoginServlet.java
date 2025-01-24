package servlet;

import db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/login")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();

        String email = json.getString("email");
        String password = json.getString("password");

        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    PrintWriter out = response.getWriter();

                    // Extract user data from ResultSet
                    int userId = rs.getInt("user_id");
                    String userName = rs.getString("user_name");
                    String userEmail = rs.getString("email");
                    String role = rs.getString("type");

                    // Create a JSON response with user data
                    JsonObject jsonResponse = Json.createObjectBuilder()
                            .add("message", "Login successful!")
                            .add("userId", userId)
                            .add("userName", userName)
                            .add("userEmail", userEmail)
                            .add("role", role)
                            .build();

                    out.print(jsonResponse.toString());
                    out.flush();
                } else {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\":\"Invalid email or password.\"}");
                    out.flush();
                }
            }

        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            System.err.println("Database error: " + e.getMessage());
            out.print("{\"message\":\"An error occurred while processing your request.\"}");
            out.flush();
        }
    }
}
