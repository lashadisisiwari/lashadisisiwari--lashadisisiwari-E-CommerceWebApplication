package servlet;

import db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/cart")
public class cartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();

        int userId = Integer.parseInt(json.getString("user_id"));
        int productId = Integer.parseInt(json.getString("product_id"));
        int quantity = json.containsKey("quantity") ? json.getInt("quantity") : 1;
        double price = json.getJsonNumber("price").doubleValue();

        System.out.println("data : "+userId+" "+productId+" "+quantity+" "+price);

        System.out.println("data "+userId+" "+productId+" "+quantity+" "+price);

        String query = "INSERT INTO cart(user_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, quantity);
            pstmt.setDouble(4, price);

            pstmt.executeUpdate();

            response.setStatus(HttpServletResponse.SC_CREATED);
            PrintWriter out = response.getWriter();
            out.print("{\"message\":\"Item added to cart successfully!\"}");
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"error\":\"Failed to add item to cart.\"}");
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        String search = request.getParameter("search");
        String query = "SELECT c.cart_id, c.user_id, c.product_id, c.quantity, p.price, p.product_name " +
        "FROM cart c INNER JOIN products p ON c.product_id = p.product_id";

        if (search != null && !search.isEmpty()) {
            query += " WHERE c.status='pending' AND (c.user_id LIKE ? OR p.product_name LIKE ?)";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            if (search != null && !search.isEmpty()) {
                pstmt.setString(1, "%" + search + "%");
                pstmt.setString(2, "%" + search + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();

                while (rs.next()) {
                    JsonObject jsonObject = Json.createObjectBuilder()
                            .add("cart_id", rs.getInt("cart_id"))
                            .add("user_id", rs.getInt("user_id"))
                            .add("product_id", rs.getInt("product_id"))
                            .add("product_name", rs.getString("product_name"))
                            .add("quantity", rs.getInt("quantity"))
                            .add("price", rs.getDouble("price"))
                            .build();

                    jsonArrayBuilder.add(jsonObject);
                }

                response.setStatus(HttpServletResponse.SC_OK);
                PrintWriter out = response.getWriter();
                out.print(jsonArrayBuilder.build().toString());
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"error\":\"Failed to retrieve cart items.\"}");
            out.flush();
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");


        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();

        int quantity = json.getInt("quantity");
        int userId = Integer.parseInt(json.getString("user_id"));
        int productId = json.getInt("product_id");
        int price = json.getInt("price");


        String query = "UPDATE cart SET quantity = ?, price = ? WHERE user_id = ? && product_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, quantity);
            pstmt.setInt(2, price*quantity);
            pstmt.setInt(3, userId);
            pstmt.setInt(4, productId);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().print("{\"message\":\"Quantity updated successfully!\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{\"error\":\"Failed to update quantity.\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\":\"Failed to update quantity.\"}");
        }
    }


    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();
        int userId = Integer.parseInt(json.getString("user_id"));
        int productId = json.getInt("product_id");

        String query = "DELETE FROM cart WHERE user_id = ? && product_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, productId);
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                PrintWriter out = response.getWriter();
                out.print("{\"message\":\"deleted successfully!\"}");
                out.flush();
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}
