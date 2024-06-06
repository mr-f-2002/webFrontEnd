package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.DTO.Attendance;
import com.example.projectfrontend2_2.DTO.ClassroomDTO;
import com.example.projectfrontend2_2.http.RequestMaker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/SetDateServlet")
public class SetDateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestMaker rqm = new RequestMaker();
        String selectedDate = request.getParameter("selectedDate");

        HttpSession session = request.getSession();
        session.setAttribute("date_picked", selectedDate);
        ClassroomDTO classroom = (ClassroomDTO) session.getAttribute("currentClassroom");
        Long classid = classroom.getId();

        try {
            List<Attendance> attendanceList = rqm.fetchAttendanceByClassroomIdAndDate(classid,selectedDate);
            session.setAttribute("attendanceList", attendanceList);
            for (Attendance attendance : attendanceList) {
                System.out.println(selectedDate);
                System.out.println(attendance.getStudentid());
                System.out.println(attendance.getPresent());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
