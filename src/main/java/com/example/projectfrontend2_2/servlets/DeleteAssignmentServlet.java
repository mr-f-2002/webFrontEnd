package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.http.RequestMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteAssignmentServlet")
public class DeleteAssignmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String assignmentIdStr = request.getParameter("assignmentId");
        if (assignmentIdStr != null) {
            long assignmentId = Long.parseLong(assignmentIdStr);
            RequestMaker rqm = new RequestMaker();
            boolean success = false; // Assuming deleteAssignment method returns boolean
            try {
                success = rqm.deleteAssignment(assignmentId);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            if (success) {
                response.sendRedirect("./TeacherScene.jsp");
            } else {
                response.getWriter().println("Failed to delete the assignment.");
            }
        } else {
            response.getWriter().println("Assignment ID is required.");
        }
    }
}
