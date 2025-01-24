package servlet;

import db.DBConnection;
import dto.CategoryDTO;
import dto.ProductDTO;
import dto.get.ProductGetDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.json.*;

@WebServlet(urlPatterns = "/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductGetDTO> products = new ArrayList<>();
        String query = "SELECT * FROM products";
        String search = request.getParameter("search");

        if (search != null && !search.isEmpty()) {
            query += " WHERE product_id LIKE ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            if (search != null && !search.isEmpty()) {
                pstmt.setString(1, "%" + search + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("product_id");
                    String name = rs.getString("product_name");
                    String categoryId = rs.getString("category_id");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");


                    String categoryQuery = "SELECT category_id, category_name FROM categories WHERE category_id = ?";
                    try (PreparedStatement categoryPstmt = conn.prepareStatement(categoryQuery)) {
                        categoryPstmt.setString(1, categoryId);
                        try (ResultSet categoryRs = categoryPstmt.executeQuery()) {
                            if (categoryRs.next()) {
                                String categoryName = categoryRs.getString("category_name");

                                CategoryDTO category = new CategoryDTO(categoryId, categoryName);
                                ProductGetDTO product = new ProductGetDTO(id, name, category, price, description);
                                products.add(product);
                            }
                        }
                    }
                }

                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                for (ProductGetDTO product : products) {
                    CategoryDTO category = product.getCategory();
                    JsonObject categoryJson = Json.createObjectBuilder()
                            .add("category_id", category.getCategoryId())
                            .add("category_name", category.getCategoryName())
                            .build();

                    JsonObject jsonObject = Json.createObjectBuilder()
                            .add("id", product.getId())
                            .add("name", product.getName())
                            .add("category", categoryJson)
                            .add("price", product.getPrice())
                            .add("description", product.getDescription())
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
        String name = json.getString("name");
        String category = json.getString("category");
        double price = json.getJsonNumber("price").doubleValue();
        String description = json.getString("description");

        String query = "INSERT INTO products(product_name, category_id, price, description) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, name);
            pstmt.setInt(2, Integer.parseInt(category));
            pstmt.setDouble(3, price);
            pstmt.setString(4, description);

            pstmt.executeUpdate();

            response.setStatus(HttpServletResponse.SC_CREATED);
            PrintWriter out = response.getWriter();
            out.print("{\"message\":\"Product added successfully!\"}");
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject json = jsonReader.readObject();
        String name = json.getString("name");
        String category = json.getString("category");
        double price = json.getJsonNumber("price").doubleValue();
        String description = json.getString("description");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("ok "+name+" "+category+" "+price+" "+description+" "+id);

        String query = "UPDATE products SET product_name = ?, category_id = ?, price = ?, description = ? WHERE product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, name);
            pstmt.setInt(2, Integer.parseInt(category));
            pstmt.setDouble(3, price);
            pstmt.setString(4, description);
            pstmt.setInt(5, id);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                PrintWriter out = response.getWriter();
                out.print("{\"message\":\"Product updated successfully!\"}");
                out.flush();
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                PrintWriter out = response.getWriter();
                out.print("{\"message\":\"Product not found!\"}");
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));

        String query = "DELETE FROM products WHERE product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, productId);
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                PrintWriter out = response.getWriter();
                out.print("{\"message\":\"Product deleted successfully!\"}");
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
