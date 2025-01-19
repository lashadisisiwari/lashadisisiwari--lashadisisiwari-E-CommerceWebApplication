package servlet;

import dto.CommonResponseDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.json.Json;
import javax.json.JsonObject;
import java.io.IOException;

@WebServlet(urlPatterns = "/user")

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("do get");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println(req.getParameter("UserName"));
        System.out.println(req.getParameter("Password"));

        JsonObject jsonObject = Json.createObjectBuilder().add("success", true).build();

        resp.setStatus(200);
        resp.setContentType("application/json");
        resp.getWriter().write(jsonObject.toString());
    }
}
