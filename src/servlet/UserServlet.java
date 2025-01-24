package servlet;

import db.DBConnection;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.json.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();

        String userName = json.getString("user_name");
        String email = json.getString("email");
        String password = json.getString("password");
        String contact = json.getString("contact");

        String query = "INSERT INTO users(user_name, email, password, contact) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, userName);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, contact);

            pstmt.executeUpdate();

            response.setStatus(HttpServletResponse.SC_CREATED);
            PrintWriter out = response.getWriter();
            out.print("{\"message\":\"User registered successfully!\"}");
            out.flush();
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            System.out.println(e.getMessage());
            String message = e.getMessage();
            out.print("{\"message\":\"" + message + "\"}");
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserDTO> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        String search = request.getParameter("search");

        if (search != null && !search.isEmpty()) {
            query += " WHERE user_name LIKE ? OR email LIKE ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            if (search != null && !search.isEmpty()) {
                pstmt.setString(1, "%" + search + "%");
                pstmt.setString(2, "%" + search + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String userId = rs.getString("user_id");
                    String userName = rs.getString("user_name");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String contact = rs.getString("contact");
                    String type = rs.getString("type");
                    String status = rs.getString("status");

                    UserDTO user = new UserDTO(userId, userName, email, password, contact, type, status);
                    users.add(user);
                }

                // Convert users to JSON
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                for (UserDTO user : users) {
                    JsonObject jsonObject = Json.createObjectBuilder()
                            .add("user_id", user.getUser_id())
                            .add("user_name", user.getUser_name())
                            .add("email", user.getEmail())
                            .add("password", user.getPassword()) // Ensure password handling security
                            .add("contact", user.getContact())
                            .add("type", user.getType())
                            .add("status", user.getStatus())
                            .build();

                    jsonArrayBuilder.add(jsonObject);
                }

                JsonArray jsonArray = jsonArrayBuilder.build();

                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(jsonArray.toString());
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"message\":\"An error occurred while retrieving users.\"}");
            out.flush();
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();

        String userId = json.getString("userId");

        String query = "UPDATE users SET status = CASE WHEN status = 'active' THEN 'inactive' ELSE 'active' END WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, userId);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                PrintWriter out = response.getWriter();
                out.print("{\"message\":\"Status updated successfully\"}");
                out.flush();
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.print("{\"message\":\"User not found\"}");
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"message\":\"An error occurred while updating the status.\"}");
            out.flush();
        }
    }
}
