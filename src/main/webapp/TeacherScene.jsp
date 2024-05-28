<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectfrontend2_2.DTO.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Portal</title>
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
        .left h1 {
            position: absolute;
            top: 30px;
        }
        .left h4 {
            margin: 10px 0 0 0;
            text-align: center;
        }
        .left p {
            margin: 5px 0 40px 0;
            text-align: center;
        }
        .left button {
            width: 100%;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            background-color: #1133ba54;
            color: #fff;
            border: none;
            cursor: pointer;
            margin: 5px;
        }
        #logout {
            position: absolute;
            bottom: 20px;
        }
        .circle {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-color: #1133ba54;
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
            flex-direction: column;
            background-color: rgba(170, 170, 170, 0.275);
            position: relative;
        }
        .right #bg {
            width: 100%;
            position: absolute;
            bottom: 0;
            right: 0;
            z-index: -1;
        }
        .classes {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }
        .class {
            width: 120px;
            margin: 10px;
            border-radius: 5px;
            padding: 10px 0;
            background-color: #967E76;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
        }
        .class img {
            width: 60%;
        }
        .class p {
            margin: 0;
            padding: 0;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <h1>Teacher Portal</h1>
        <div class="circle">
            <img src="./image/student.png" alt="">
        </div>
        <div>
            <%
                TeacherDTO teacher = (TeacherDTO) session.getAttribute("teacher");
                if (teacher != null) {
            %>
            <h4><%= teacher.getName() %></h4>
            <p><%= teacher.getTeachid() %></p>
            <p><%= teacher.getDesignation() %></p>
            <% } %>
        </div>
        <button id="logout" onclick="logout()">Log Out</button>
    </div>
    <div class="right">
        <img src="./image/bg2.png" alt="" id="bg">
        <h1>Welcome Back</h1>
        <div class="classes">
            <%
                List<ClassroomDTO> classes = (List<ClassroomDTO>) session.getAttribute("classes");
                if (classes != null && !classes.isEmpty()) {
                    for (ClassroomDTO classDTO : classes) {
            %>
            <div class="class">
                <img src="./image/classroom.png" alt="">
                <p class="name"><%= classDTO.getCoursename() %></p>
            </div>
            <%
                }
            } else {
            %>
            <p>No classes available.</p>
            <%
                }
            %>
        </div>
    </div>
</div>

<script>
    function logout() {
        location.href = './index.jsp';
    }
</script>
</body>
</html>