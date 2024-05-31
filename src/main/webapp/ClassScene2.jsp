<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectfrontend2_2.DTO.ClassroomDTO" %>
<%@ page import="com.example.projectfrontend2_2.DTO.StudentDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.example.projectfrontend2_2.DTO.TeacherDTO" %>
<%
    session = request.getSession();
    StudentDTO student = (StudentDTO) session.getAttribute("studentDTO");
    List<ClassroomDTO> classrooms = (List<ClassroomDTO>) session.getAttribute("all_classrooms");
//    List<TeacherDTO> teachers = (List<TeacherDTO>) session.getAttribute("all_teachers");

    if (student == null || classrooms == null) {
        response.sendRedirect("index.jsp"); // Redirect to login page if student or classrooms are not in session
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classrooms</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .left {
            width: 30%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            background-color: #967E76;
            position: relative;
            color: white;
            font-size: 20px;
            border-radius: 0 10px 10px 0;
        }
        .left h2 {
            position: absolute;
            top: 30px;
        }
        .left button {
            position: absolute;
            bottom: 20px;
            width: 100%;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            background-color: #1133ba54;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-top: 100px;
        }
        .circle {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-color: #1133ba54; /* blue with opacity */
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px dashed black;
        }
        .circle img {
            width: 80%;
            height: 80%;
        }
        .right {
            width: 70%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            position: relative;
        }
        .right .top {
            width: 96%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2%;
            position: absolute;
            right: 0;
            top: 0;
        }
        .top h1 {
            font-size: 40px;
        }
        .top .r {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        .r button, #Logout1 {
            padding: 5px 10px;
            border-radius: 5px;
            border: none;
            margin: 3px;
            background-color: #967E76;
            color: white;
        }
        select {
            width: 80%;
            padding: 15px;
            border-radius: 4px;
            background-color: #1133ba54;
            border: none;
            margin-top: 50px;
        }
        .holder {
            width: 80%;
            height: 40vh;
            background-color: #1133ba54;
            border-radius: 4px;
            position: relative;
            margin-top: 5px;
            padding: 20px;
            color: white;
        }
        #Logout1 {
            position: absolute;
            bottom: 10px;
            right: 10px;
        }
        .right img {
            width: 100%;
            position: absolute;
            bottom: 0;
            right: 0;
            z-index: -1;
        }
        #classGrid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }

        .classCard {
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
        }

        .classCard:hover {
            background-color: #e0e0e0;
        }

        #details {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <h2>Student Portal</h2>
        <div class="circle">
            <img src="./image/student.png" />
        </div>
        <div id="name" style="margin-top: 10px;"><%= student.getName() %></div>
        <div id="id"><%= student.getStudid() %></div>
        <button id="Logout" onclick="location.href='./index.jsp'">Log Out</button>
    </div>
    <div class="right">
        <img src="./image/bg2.png" alt="">
        <div class="top">
            <h1>Classrooms</h1>
            <div class="r">
                <button id="back" onclick="location.href='./ClassScene.jsp'">Back</button>
                <button onclick="gotoStats()">Check Attendance</button>
            </div>
        </div>

        <div class="holder">
            <div id="classGrid">
                <% for (ClassroomDTO classroom : classrooms) { %>
                <div class="classCard" onclick="onCourseClick('<%= classroom.getCoursename() %>', '<%= classroom.getTeacher() %>', '<%= classroom.getId() %>')">
                    <h3 style="color: black"><%= classroom.getCoursename() %></h3>
                    <p style="color: black">Teacher: <%= classroom.getTeacher() %></p>
                    <p style="color: black">Due Assignments: <%= classroom.getAssignmentsHereID() %></p>
                </div>
                <% } %>
            </div>
        </div>
        <form id="courseForm" action="scrolscrene.jsp" method="post" style="display: none;">
            <input type="hidden" name="courseName">
            <input type="hidden" name="teacher">
            <input type="hidden" name="courseId">
        </form>

    </div>
</div>

<script>
    function onCourseClick(courseName, teacher, courseId) {
        // Assuming you have a hidden form with id "courseForm"
        var form = document.getElementById("courseForm");

        // Set the values of hidden input fields
        form.elements["courseName"].value = courseName;
        form.elements["teacher"].value = teacher;
        form.elements["courseId"].value = courseId;

        // Submit the form
        form.submit();
    }

    function goToCore() {
        // Logic for navigating to the core page with the selected course details
    }
    function gotoStats() {
        // Logic for navigating to the attendance stats page
    }
</script>
</body>
</html>
