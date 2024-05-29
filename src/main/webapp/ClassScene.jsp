<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.projectfrontend2_2.DTO.*" %>
<%@ page import="java.util.List" %>
<%
    session = request.getSession();
    StudentDTO studentDTO = (StudentDTO) session.getAttribute("studentDTO");
    List<ClassroomDTO> all_classrooms = (List<ClassroomDTO>) session.getAttribute("all_classrooms");

    if (studentDTO == null || all_classrooms == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #fcfcfc;
            color: #000;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .left{
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
        .left h2{
            position: absolute;
            top: 30px;
        }
        .right{
            width: 70%;
            height: 100vh;
            background: url("./image/bg2.png");
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        .header {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
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
        .content {
            width: 100%;
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
        }
        .card {
            width: 30%;
            text-align: center;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            padding: 10px;
            backdrop-filter: blur(30px);
        }
        .card img {
            width: 60%;
            height: auto;
            margin-bottom: 10px;
        }
        button {
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
    </style>
</head>
<body>
<%
    session = request.getSession();
    out.println(session.getAttribute("studentDTO"));
%>
<div class="container">
    <div class="left">
        <h2>Student Portal</h2>
        <div class="circle">
            <img src="./image/student.png" alt="User Image">
        </div>
        <div style="margin-top: 10px;"><%= studentDTO.getName() %></div>
        <div><%= studentDTO.getStudid() %></div>
        <button type="submit" style="margin-top: 50px;" onclick="location.href='./index.jsp'">Log Out</button>
    </div>
    <div class="right">
        <div class="header">Welcome Back!</div>
        <div class="content">
            <div class="card" onclick="document.forms['classForm'].submit()">
                <img src="./image/classroom.png" alt="Classroom">
                <p>Classroom</p>
            </div>
            <div class="card" onclick="document.forms['registrationForm'].submit()">
                <img src="./image/online-learning.png" alt="Registration">
                <p>Registration</p>
            </div>
        </div>
        <form name="classForm" action="ClassScene2.jsp" method="post" style="display: none;">
            <input type="hidden" name="studentId" value="<%= studentDTO.getStudid() %>">
        </form>
        <form name="registrationForm" action="course-registration.jsp" method="post" style="display: none;">
            <input type="hidden" name="studentId" value="<%= studentDTO.getStudid() %>">
        </form>
    </div>
</div>
</body>
</html>
