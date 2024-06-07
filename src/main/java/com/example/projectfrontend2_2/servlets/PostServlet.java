package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.DTO.ClassroomDTO;
import com.example.projectfrontend2_2.DTO.PostDTO;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PostServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the teacher and classroom details from the session
        TeacherDTO teacher = (TeacherDTO) session.getAttribute("teacher");
        ClassroomDTO cdto = (ClassroomDTO) session.getAttribute("currentClassroom");

        // Get the classroom ID
        Long classroomId = cdto.getId(); // Directly retrieve the ID from the ClassroomDTO object

        // Get the post text and attachment links from the request
        String postText = request.getParameter("assignment");
        String[] attachmentLinks = request.getParameterValues("link");

        // Prepare the list of attachment links
        List<String> links = new ArrayList<>();
        if (attachmentLinks != null) {
            for (String link : attachmentLinks) {
                if (link != null && !link.trim().isEmpty()) {
                    links.add(link);
                }
            }
        }

        // Create a new PostDTO object
        PostDTO postDTO = new PostDTO(
                Long.parseLong("0"), // Adjust the ID as needed
                postText,
                Timestamp.valueOf(LocalDateTime.now()),
                teacher.getName(),
                new ArrayList<>(links),
                classroomId
        );

        // Use RequestMaker to send the post to the backend
        RequestMaker requestMaker = new RequestMaker();
        try {
            requestMaker.create_post(postDTO);
        } catch (InterruptedException e) {
            throw new ServletException(e);
        }

        // Redirect back to the classroom page
        response.sendRedirect(request.getContextPath() + "/TeacherScene.jsp");
    }


}
