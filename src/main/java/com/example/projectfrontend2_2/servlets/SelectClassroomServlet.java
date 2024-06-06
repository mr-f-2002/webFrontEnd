package com.example.projectfrontend2_2.servlets;

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

@WebServlet(name = "SelectClassroomServlet", value = "/SelectClassroomServlet")
public class SelectClassroomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String classIdStr = req.getParameter("classId");
        if (classIdStr != null) {
            long classId = Long.parseLong(classIdStr);
            RequestMaker rqm = new RequestMaker();
            try {
                ClassroomDTO classroom = rqm.fetch_classroom(classId);
                HttpSession session = req.getSession();
                session.setAttribute("currentClassroom", classroom);
                resp.sendRedirect("scrolscene2.jsp");
            } catch (InterruptedException e) {
                e.printStackTrace();
                resp.sendRedirect("TeacherScene.jsp?error=classFetchFailed");
            }
        } else {
            resp.sendRedirect("TeacherScene.jsp?error=invalidClassId");
        }
    }
}
