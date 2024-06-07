package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.DTO.ClassroomDTO;
import com.example.projectfrontend2_2.DTO.StudentDTO;
import com.example.projectfrontend2_2.http.RequestMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/attendance")
public class AttendanceServlet extends HttpServlet {

    private RequestMaker rqm = new RequestMaker();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ClassroomDTO currentClassroom = (ClassroomDTO) session.getAttribute("currentClassroom");



        if (currentClassroom != null) {
            LocalDate currentDate = LocalDate.now(); // Assuming current date by default
            String dateParam = request.getParameter("date");
            if (dateParam != null && !dateParam.isEmpty()) {
                currentDate = LocalDate.parse(dateParam);
            }



            // Fetch students for the current classroom
            List<Long> studentIds = new ArrayList<>(currentClassroom.getStudents());
            List<StudentDTO> studentDTOS = new ArrayList<>();
            for (Long id : studentIds) {
                try {
                    StudentDTO student = rqm.fetch_student(id);
                    if (student != null) {
                        studentDTOS.add(student);
                    }
                } catch (IOException | InterruptedException e) {
                    e.printStackTrace();
                }
            }

            studentDTOS.sort((a, b) -> Math.toIntExact(a.getStudid() - b.getStudid()));

            session.setAttribute("students", studentDTOS);
            request.setAttribute("currentDate", currentDate);
            request.getRequestDispatcher("/Attendance.jsp").forward(request, response);
        } else {
            response.sendRedirect("TeacherScene.jsp?error=noClassroomSelected");
        }
    }
}
