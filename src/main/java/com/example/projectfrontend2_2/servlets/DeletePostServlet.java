package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.http.RequestMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postIdStr = request.getParameter("postId");
        if (postIdStr != null) {
            long postId = Long.parseLong(postIdStr);
            RequestMaker rqm = new RequestMaker();
            boolean success = false; // Assuming delete_post method returns boolean
            try {
                success = rqm.deletePost(postId);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            if (success) {
                // Forward the request to SelectClassroomServlet
                response.sendRedirect("./TeacherScene.jsp");

            } else {
                response.getWriter().println("Failed to delete the post.");
            }
        } else {
            response.getWriter().println("Post ID is required.");
        }
    }
}
