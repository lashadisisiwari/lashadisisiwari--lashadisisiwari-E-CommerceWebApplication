package servlet;

import db.DBConnection;
import dto.get.OrderDetailsDTO;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order_details")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderDetailsDTO> orderDetailsList = new ArrayList<>();
        String query = "SELECT order_details.*, products.product_name FROM order_details INNER JOIN products ON order_details.product_id = products.product_id WHERE order_details.order_id = ?";
        String orderId = request.getParameter("orderId");

        if (orderId == null || orderId.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing or invalid orderId parameter");
            return;
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, Integer.parseInt(orderId));

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    String name = rs.getString("product_name");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");

                    OrderDetailsDTO orderDetail = new OrderDetailsDTO(order_id, name, quantity, price);
                    orderDetailsList.add(orderDetail);
                }

                // Convert order details to JSON
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                for (OrderDetailsDTO detail : orderDetailsList) {
                    JsonObject jsonObject = Json.createObjectBuilder()
                            .add("orderId", detail.getOrder_id())
                            .add("productName", detail.getName())
                            .add("quantity", detail.getQuantity())
                            .add("price", detail.getPrice())
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
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid orderId format");
        }
    }
}
