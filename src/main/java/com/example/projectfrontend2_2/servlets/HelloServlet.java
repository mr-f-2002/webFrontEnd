package com.example.projectfrontend2_2.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        if(request.getAttribute("bal") != null){
            String bal = request.getAttribute("bal").toString();
            out.print("<h4>The value is: " + bal + "</h4>");
        }else{
            out.print("<h4>Failed to identify session</h4>");
        }

        response.setContentType("text/html");

        if (session.getAttribute("reqNum") == null) {
            session = request.getSession(true);
            session.setAttribute("reqNum",0);
            out.println("<h1>Welcome, new session!</h1>");
        } else {
            session.setAttribute("reqNum",Integer.parseInt(session.getAttribute("reqNum").toString())+1);
            out.println("<h1>Welcome back!</h1>");
        }


        out.println("<h2>Information on your session</h2>");
        out.println("<table border=\"1\">");
        out.println("<tr><th>Info Type</th><th>Value</th></tr>");
        out.println("<tr><th>ID</th><th>" + session.getId() + "</th></tr>");
        out.println("<tr><th>Creation Time</th><th>" + session.getCreationTime() + "</th></tr>");
        out.println("<tr><th>Time of Last Access</th><th>" + session.getLastAccessedTime() + "</th></tr>");
        out.println("<tr><th>Number of Previous Accesses</th><th>"+session.getAttribute("reqNum")+"</th></tr>");
        out.println("</table>");


    }
}