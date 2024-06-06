package com.example.projectfrontend2_2.servlets;


import com.example.projectfrontend2_2.DTO.*;
import com.example.projectfrontend2_2.http.RequestMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/CourseRegistrationServlet")
public class CourseRegistrationServlet extends HttpServlet {

    private RequestMaker requestMaker = new RequestMaker();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ClassroomDTO> classrooms = requestMaker.fetch_all_classroom();
            request.setAttribute("classrooms", classrooms);

            // Assuming student details are set in session or passed as request parameters
            request.setAttribute("student", request.getSession().getAttribute("student"));

            request.getRequestDispatcher("courseRegistration.jsp").forward(request, response);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long classId = Long.parseLong(request.getParameter("courseId"));
        StudentDTO student = (StudentDTO) request.getSession().getAttribute("studentDTO");
        Long studentId = student.getStudid();

        CourseRegDTO courseRegDTO = new CourseRegDTO(classId, studentId);

        try {
            requestMaker.course_register_attempt(courseRegDTO);
            response.sendRedirect("./Student_login.jsp");
        } catch (InterruptedException e) {
            e.printStackTrace();
            response.sendRedirect("/course-registration.jsp");

        }
    }
}
