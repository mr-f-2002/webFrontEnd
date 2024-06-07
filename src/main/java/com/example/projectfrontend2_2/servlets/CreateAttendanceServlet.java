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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/createAttendance")
public class CreateAttendanceServlet extends HttpServlet {

    private RequestMaker rqm = new RequestMaker();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ClassroomDTO currentClassroom = (ClassroomDTO) session.getAttribute("currentClassroom");
        if (currentClassroom != null) {
            String studentIdStr = request.getParameter("studentId");
            if (studentIdStr != null) {
                long studentId = Long.parseLong(studentIdStr);
                long classroomId = currentClassroom.getId();

                String dateStr = (String) session.getAttribute("date_picked");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date currentDate = null;
                try {
                    currentDate = dateFormat.parse(dateStr);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
//                Date currentDate = new Date(System.currentTimeMillis());
                boolean present = request.getParameter("action").equals("present");

                // Create an Attendance object
                Attendance attendance = new Attendance(currentDate, classroomId, studentId, present);
                System.out.println(currentDate.toString() + classroomId + studentId+present + "\n\n\n");


                List<Attendance> attendanceList = null;
                try {
                    attendanceList = rqm.fetchAttendanceByClassroomIdAndDate(currentClassroom.getId(),dateStr);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                session.setAttribute("attendanceList", attendanceList);
                try {
                    rqm.create_attendance(attendance);
                    System.out.println("attendence created");
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }

//                String selectedDate = request.getParameter("selectedDate");
//                if (selectedDate == null){
//                    selectedDate = "";
//                }
//
//                HttpSession session1 = request.getSession();
//                session1.setAttribute("date_picked", selectedDate);
//                ClassroomDTO classroom = (ClassroomDTO) session1.getAttribute("currentClassroom");
//                Long classid = classroom.getId();
//                try {
//                    List<Attendance> attendanceList = rqm.fetchAttendanceByClassroomIdAndDate(classid,selectedDate);
//                    session1.setAttribute("attendanceList", attendanceList);
//                    for (Attendance attendance1 : attendanceList) {
//                        System.out.println(selectedDate);
//                        System.out.println(attendance1.getStudentid());
//                        System.out.println(attendance1.getPresent());
//                    }
//                } catch (IOException | InterruptedException e) {
//                    e.printStackTrace();
//                }
                // Redirect back to the attendance page
                response.sendRedirect(request.getContextPath() + "/attendance");
            } else {
                // Handle error if studentId parameter is missing
                response.sendRedirect(request.getContextPath() + "/attendance?error=missingStudentId");
            }
        } else {
            // Handle error if currentClassroom attribute is missing
            response.sendRedirect(request.getContextPath() + "/TeacherScene.jsp?error=noClassroomSelected");
        }
    }
}

