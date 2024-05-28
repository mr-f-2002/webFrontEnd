package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.DTO.ClassroomDTO;
import com.example.projectfrontend2_2.DTO.StudentDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ClassScene2")
public class ClassSceneServlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Simulate getting student and classrooms from a database or service
        StudentDTO student = (StudentDTO) session.getAttribute("student");
        List<ClassroomDTO> classrooms = (List<ClassroomDTO>) session.getAttribute("classrooms");

        // If these attributes are not set in the session, you need to set them here
        if (student == null) {
            student = getStudentFromDatabase(); // Implement this method to fetch from DB
            session.setAttribute("student", student);
        }

        if (classrooms == null) {
            classrooms = getClassroomsFromDatabase(); // Implement this method to fetch from DB
            session.setAttribute("classrooms", classrooms);
        }

        request.getRequestDispatcher("/ClassScene2.jsp").forward(request, response);
    }

    private StudentDTO getStudentFromDatabase() {
        // Mock implementation, replace with actual database fetch
        StudentDTO student = new StudentDTO();
        student.setName("Niloy");
        student.setStudid(200041123L);
        return student;
    }

    private List<ClassroomDTO> getClassroomsFromDatabase() {
        // Mock implementation, replace with actual database fetch
        List<ClassroomDTO> classrooms = new ArrayList<>();

        ClassroomDTO classroom1 = new ClassroomDTO();
        classroom1.setId(1L);
        classroom1.setDept("CSE");
        classroom1.setCoursecode(101);
        classroom1.setSemester(1);
        classroom1.setArchived(false);
        classroom1.setSession(2021);
        classroom1.setCoursename("Math 101");
        classroom1.setTeacher(123L);
        classrooms.add(classroom1);

        ClassroomDTO classroom2 = new ClassroomDTO();
        classroom2.setId(2L);
        classroom2.setDept("PHY");
        classroom2.setCoursecode(102);
        classroom2.setSemester(1);
        classroom2.setArchived(false);
        classroom2.setSession(2021);
        classroom2.setCoursename("Physics 101");
        classroom2.setTeacher(124L);
        classrooms.add(classroom2);

        return classrooms;
    }
}
