<%@ page import="com.example.projectfrontend2_2.http.RequestMaker" %>
<%@ page import="com.example.projectfrontend2_2.DTO.StudentDTO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.projectfrontend2_2.servlets.AttendanceServlet" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="attendance-tile" style="background-color: #e5fdff; width: 473px; height: 50px; display: flex; align-items: center; padding: 5px;">
    <img src="./image/immigration.png" alt="Icon" style="height: 43px; width: 37px; margin-right: 10px;">
    <div style="flex-grow: 1;">
        <label style="font-family: 'Segoe UI Semilight'; font-size: 18px; text-align: center; display: block;">
            ${param.studentId}
        </label>
    </div>
    <form action="/createAttendance" method="post">
        <input type="hidden" name="studentId" value="${param.studentId}">
        <input type="hidden" name="action" value="present">
        <button type="submit" style="background-color: #95ace8; color: white; font-size: 15px; font-weight: bold; border: none; padding: 5px 10px; margin-right: 5px; cursor: pointer;">P</button>
    </form>
    <form action="/createAttendance" method="post">
        <input type="hidden" name="studentId" value="${param.studentId}">
        <input type="hidden" name="action" value="absent">
        <button type="submit" style="background-color: #95ace8; color: white; font-size: 15px; font-weight: bold; border: none; padding: 5px 10px; cursor: pointer;">A</button>
    </form>
</div>
