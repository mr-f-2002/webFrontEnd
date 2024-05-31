package com.example.projectfrontend2_2.servlet;

import com.example.projectfrontend2_2.DTO.AssignmentDTO;
import com.example.projectfrontend2_2.DTO.ClassroomDTO;
import com.example.projectfrontend2_2.DTO.TeacherDTO;
import com.example.projectfrontend2_2.http.RequestMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/AssignmentServlet")
public class AssignmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AssignmentServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the teacher and classroom details from the session
        TeacherDTO teacher = (TeacherDTO) session.getAttribute("teacher");
        ClassroomDTO cdto = (ClassroomDTO) session.getAttribute("currentClassroom");

        // Get the classroom ID
        Long classroomId = cdto.getId(); // Directly retrieve the ID from the ClassroomDTO object

        // Get assignment details from the request
        String title = request.getParameter("title");
        String instructions = request.getParameter("instructions");
        String deadlineStr = request.getParameter("deadline");
        float marks = Float.parseFloat(request.getParameter("marks"));

        // Convert deadline to LocalDateTime
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime deadline = LocalDateTime.parse(deadlineStr, formatter);

        // Create a new AssignmentDTO object
        AssignmentDTO assignmentDTO = new AssignmentDTO(
                Long.parseLong("0"), // Adjust the ID as needed
                title,
                instructions,
                Timestamp.valueOf(deadline),
                marks,
                classroomId
        );

        // Use RequestMaker to send the assignment to the backend
        RequestMaker requestMaker = new RequestMaker();
        try {
            requestMaker.create_assignment(assignmentDTO);
        } catch (InterruptedException e) {
            throw new ServletException(e);
        }

        // Redirect back to the classroom page
        response.sendRedirect(request.getContextPath() + "/scrolscrene2.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
