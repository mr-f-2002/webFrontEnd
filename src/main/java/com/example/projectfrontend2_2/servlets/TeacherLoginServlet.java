package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.DTO.ClassroomDTO;
import com.example.projectfrontend2_2.DTO.LoginDTO;
import com.example.projectfrontend2_2.DTO.TeacherDTO;
import com.example.projectfrontend2_2.http.RequestMaker;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet(name = "TeacherLoginServlet", value = "/TeacherLoginServlet")
public class TeacherLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Teacher servlet accessed");
        String teacherID = req.getParameter("teacherID");
        String password = req.getParameter("passWord");

        LoginDTO ldto = new LoginDTO();
        ldto.setCommon_id(Long.parseLong(teacherID));
        ldto.setPassword(password);

        RequestMaker rqm = new RequestMaker();
        TeacherDTO tdto = null;
        try {
            tdto = rqm.login_attempt_teacher(ldto, "/login/teacher");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        if (tdto != null && tdto.getTeachid().equals(ldto.getCommon_id()) && tdto.getPassword().equals(ldto.getPassword())) {
            HttpSession session = req.getSession();
            session.setAttribute("teacher", tdto);

            List<ClassroomDTO> classes = fetchTeacherClasses(tdto, rqm);
            session.setAttribute("classes", classes);

            resp.sendRedirect("TeacherScene.jsp");
        } else {
            resp.sendRedirect("Teacher_login.jsp?error=invalid");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        TeacherDTO teacher = (TeacherDTO) session.getAttribute("teacher");

        if (teacher == null) {
            resp.sendRedirect("Teacher_login.jsp");
        } else {
            RequestMaker rqm = new RequestMaker();
            List<ClassroomDTO> classes = fetchTeacherClasses(teacher, rqm);
            session.setAttribute("classes", classes);

            resp.sendRedirect("TeacherScene.jsp");
        }
    }

    private List<ClassroomDTO> fetchTeacherClasses(TeacherDTO teacher, RequestMaker rqm) {
        Set<Long> classIds = teacher.getClassrooms_id();
        List<ClassroomDTO> classes = new ArrayList<>();
        for (Long classId : classIds) {
            try {
                ClassroomDTO classroom = rqm.fetch_classroom(classId);
                if (classroom != null) {
                    classes.add(classroom);
                }
            } catch (InterruptedException | IOException e) {
                e.printStackTrace();
            }
        }
        return classes;
    }
}
