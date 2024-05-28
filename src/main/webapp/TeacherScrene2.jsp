<%@ page import="com.example.projectfrontend2_2.DTO.TeacherDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        .left h4 {
            margin: 10px 0 0 0;
            text-align: center;
        }

        .left p {
            margin: 5px 0 40px 0;
            text-align: center;
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
            /* blue with opacity */
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

        .right h1 {
            width: 90%;
            text-align: left;
            font-size: 40px;
        }

        .group {
            width: 80%;
            margin-top: 40px;
        }

        select {
            width: 100%;
            background-color: #967E76;
            color: white;
            padding: 10px;
            margin: 0 0 10px 0;
            border-radius: 5px;
            border: none;
        }

        .group div {
            width: 100%;
            background-color: #967E76;
            height: 250px;
            position: relative;
            border-radius: 5px;
        }

        .group div button {
            position: absolute;
            bottom: 10px;
            right: 10px;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #1133ba54;
            color: white;
        }
    </style>
</head>
<%
    TeacherDTO teacher = (TeacherDTO) session.getAttribute("teacher");
    String teacherName = "";
    if(teacher != null) {
        teacherName = teacher.getName();

    }
%>
<body>
    <div class="container">
        <div class="left">
            <h1>Teacher Portal</h1>
            <div class="circle">
                <img src="./image/student.png" alt="">
            </div>
            <div>
                <h4><%=teacherName%></h4>
            </div>
            <button id="logout" onclick="logout()">Log Out</button>
        </div>
        <div class="right">
            <img src="./image/bg2.png" alt="" id="bg">
            <h1>Classrooms</h1>
            <div class="group">
                <select name="classes" id="classes">
                    <option value="class 1">Class 1</option>
                    <option value="class 1">Class 1</option>
                </select>
                <div class="posts">
                    <button>Let's Go</button>
                </div>
            </div>
        </div>
    </div>

    <Script>

    </Script>
</body>

</html>