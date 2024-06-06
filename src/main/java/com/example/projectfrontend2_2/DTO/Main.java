package com.example.projectfrontend2_2.DTO;

import com.example.projectfrontend2_2.http.RequestMaker;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

public class Main {

    public static void main(String[] args) throws UnsupportedEncodingException {
        RequestMaker requestMaker = new RequestMaker();

        // Sample classroomId and date
        Long classroomId = 6001L;
        String dateStr = "2024-06-06";

        // Parse the date string to Date object
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


        // Format the date string for URL
        String formattedDateStr = URLEncoder.encode(dateStr, "UTF-8");

        // Call the method to fetch attendance
        try {
            List<Attendance> attendanceList = requestMaker.fetchAttendanceByClassroomIdAndDate(classroomId,formattedDateStr);       // Print the fetched attendance
            for (Attendance attendance : attendanceList) {
                System.out.println(attendance.getStudentid());
                System.out.println(attendance.getPresent());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
