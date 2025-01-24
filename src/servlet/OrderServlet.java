package servlet;

import db.DBConnection;
import dto.get.OrderDTOGet;

import javax.json.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderDTOGet> orders = new ArrayList<>();
        String query = "select orders.*,users.user_name from orders inner join users on orders.user_id=users.user_id";
        String search = request.getParameter("search");

        if (search != null && !search.isEmpty()) {
            query += " WHERE id LIKE ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            if (search != null && !search.isEmpty()) {
                pstmt.setString(1, "%" + search + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String userName = rs.getString("user_name");
                    java.sql.Date orderDate = rs.getDate("order_date");
                    double amount = rs.getDouble("total");
                    String status = rs.getString("status");

                    OrderDTOGet order = new OrderDTOGet(id, userName, orderDate, amount, status);
                    orders.add(order);
                }

                // Convert orders to JSON
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                for (OrderDTOGet order : orders) {
                    JsonObject jsonObject = Json.createObjectBuilder()
                            .add("id", order.getId())
                            .add("userName", order.getUserName())
                            .add("orderDate", order.getOrder_date().toString())
                            .add("amount", order.getAmount())
                            .add("status", order.getStatus())
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
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();

        int userId = Integer.parseInt(json.getString("user_id"));
        JsonValue totalAmountValue = json.get("total_amount");
        double totalAmount = 0;

        if (totalAmountValue.getValueType() == JsonValue.ValueType.NUMBER) {
            totalAmount = ((JsonNumber) totalAmountValue).doubleValue();
        } else if (totalAmountValue.getValueType() == JsonValue.ValueType.STRING) {
            totalAmount = Double.parseDouble(((JsonString) totalAmountValue).getString());
        }

        JsonArray cartItems = json.getJsonArray("cart_items");

        LocalDateTime orderDateTime = LocalDateTime.now();

        System.out.println("User ID: " + userId + ", Total Amount: " + totalAmount + ", Date and Time: " + orderDateTime);

        String orderQuery = "INSERT INTO orders(user_id, order_date, total, status) VALUES (?, ?, ?,'completed')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, userId);
            pstmt.setDouble(3, totalAmount);
            pstmt.setTimestamp(2, Timestamp.valueOf(orderDateTime));
            pstmt.executeUpdate();

            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            int orderId = 0;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
                System.out.println("order id : "+orderId);
            }

            // Insert cart items into the order_items table
            String itemQuery = "INSERT INTO order_details(order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement itemPstmt = conn.prepareStatement(itemQuery)) {
                for (JsonValue item : cartItems) {
                    JsonObject cartItem = (JsonObject) item;
                    int productId = cartItem.getInt("product_id");
                    int quantity = cartItem.getInt("quantity");
                    double price = cartItem.getJsonNumber("price").doubleValue();

                    updateCartDatabase(userId,productId);

                    double totalPrice=price*quantity;
                    itemPstmt.setInt(1, orderId);
                    itemPstmt.setInt(2, productId);
                    itemPstmt.setInt(3, quantity);
                    itemPstmt.setDouble(4, totalPrice);
                    itemPstmt.addBatch();
                }

                itemPstmt.executeBatch();
            }

            response.setStatus(HttpServletResponse.SC_CREATED);
            PrintWriter out = response.getWriter();
            out.print("{\"message\":\"Order placed successfully!\"}");
            out.flush();

        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"error\":\"Failed to place order.\"}");
            out.flush();
        }
    }

    private void updateCartDatabase(int userId, int productId) {
        String query = "UPDATE cart SET status='completed' where  user_id = ? && product_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, productId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
