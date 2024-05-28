<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectfrontend2_2.DTO.ClassroomDTO" %>
<%@ page import="com.example.projectfrontend2_2.DTO.StudentDTO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
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
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <h2>Student Portal</h2>
        <div class="circle">
            <img src="./image/student.png" />
        </div>
        <%
            session = request.getSession();
            StudentDTO student = (StudentDTO) session.getAttribute("student");
            List<ClassroomDTO> classrooms = (List<ClassroomDTO>) session.getAttribute("classrooms");
            if (student != null) {
        %>
        <div id="name" style="margin-top: 10px;"><%= student.getName() %></div>
        <div id="id"><%= student.getStudid() %></div>
        <% } %>
        <button id="Logout" onclick="logout()">Log Out</button>
    </div>
    <div class="right">
        <img src="./image/bg2.png" alt="">
        <div class="top">
            <h1>Classrooms</h1>
            <div class="r">
                <button id="back" onclick="goToHome()">Back</button>
                <button onclick="gotoStats()">Check Attendance</button>
            </div>
        </div>
        <select id="courses" onchange="onCourseClick()">
            <option selected disabled>Select a classroom</option>
            <%
                if (classrooms != null) {
                    for (ClassroomDTO classroom : classrooms) {
            %>
            <option value="<%= classroom.getCoursename() %>" data-teacher="<%= classroom.getTeacher() %>"><%= classroom.getDept() %> <%= classroom.getCoursecode() %></option>
            <%
                    }
                }
            %>
        </select>
        <div class="holder">
            <div id="txt"></div>
            <div id="course"></div>
            <div id="teacher"></div>
            <div id="due_ass"></div>
            <button id="Logout1" onclick="goToCore()">Let's Go</button>
        </div>
    </div>
</div>

<script>
    function logout() {
        location.href = './LogoutServlet';
    }

    function goToHome() {
        location.href = './ClassScene';
    }

    function gotoStats() {
        location.href = './Stats';
    }

    function goToCore() {
        var course = document.getElementById('course').innerText;
        if (course) {
            location.href = './Core?course=' + course;
        }
    }

    function onCourseClick() {
        var courses = document.getElementById('courses');
        var selectedOption = courses.options[courses.selectedIndex];
        var courseName = selectedOption.value;
        var teacher = selectedOption.getAttribute('data-teacher');

        document.getElementById('txt').innerText = selectedOption.text;
        document.getElementById('course').innerText = courseName;
        document.getElementById('teacher').innerText = 'Teacher ID: ' + teacher;
        document.getElementById('due_ass').innerText = 'Nothing due';
    }
</script>
</body>
</html>
