package com.example.projectfrontend2_2.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SetDateServlet")
public class SetDateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedDate = request.getParameter("selectedDate");

        HttpSession session = request.getSession();
        session.setAttribute("date_picked", selectedDate);
        System.out.println(session.getAttribute("date_picked"));
    }
}
