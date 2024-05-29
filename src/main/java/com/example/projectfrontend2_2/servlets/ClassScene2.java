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
public class ClassScene2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        StudentDTO student = (StudentDTO) session.getAttribute("student");
        if (student == null) {
            // For demonstration purposes, we mock a student if not present in session
            student = new StudentDTO();
            student.setStudid(12345L);
            student.setName("John Doe");
            session.setAttribute("student", student);
        }

        List<ClassroomDTO> classrooms = fetchClassrooms(student);
        session.setAttribute("classrooms", classrooms);

        req.getRequestDispatcher("classscene.jsp").forward(req, resp);
    }

    private List<ClassroomDTO> fetchClassrooms(StudentDTO student) {
        // Mock classrooms for demonstration purposes
        List<ClassroomDTO> classrooms = new ArrayList<>();

        ClassroomDTO classroom1 = new ClassroomDTO();
        classroom1.setId(1L);
        classroom1.setDept("CS");
        classroom1.setCoursecode(101);
        classroom1.setSemester(1);
        classroom1.setArchived(false);
        classroom1.setSession(2023);
        classroom1.setCoursename("Computer Science 101");
        classroom1.setTeacher(123L);

        ClassroomDTO classroom2 = new ClassroomDTO();
        classroom2.setId(2L);
        classroom2.setDept("ENG");
        classroom2.setCoursecode(202);
        classroom2.setSemester(2);
        classroom2.setArchived(false);
        classroom2.setSession(2023);
        classroom2.setCoursename("English Literature 202");
        classroom2.setTeacher(124L);

        classrooms.add(classroom1);
        classrooms.add(classroom2);

        return classrooms;
    }
}
