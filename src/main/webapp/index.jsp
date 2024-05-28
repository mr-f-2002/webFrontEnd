<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }
        
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
            background-color: #ffffff;
        }
        
        .left-pane {
            padding: 20px;
            width: 50%;
        }
        
        .left-pane img {
            width: 80%;
            height: auto;
        }
        
        .title {
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            padding: 20px;
            width: 100%;
        }
        
        .center-pane {
            padding: 20px;
            background-color: #967E76;
            width: 50%;
            height: 60%;
            border-radius: 10px;
            margin: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        
        .center-pane .heading {
            color: rgb(255, 255, 255);
            font-size: 36px;
            font-weight: bold;
            padding: 20px;
        }
        
        .center-pane .sub-heading {
            color: rgb(255, 255, 255);
            font-size: 18px;
        }
        
        .button {
            background-color: #ffffff;
            color: #967E76;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="title">Classroom: Redefined</div>
    <div class="container">
        <div class="center-pane">
            <div class="heading">Let's Sign In!</div>
            <div class="sub-heading">Are you a?</div>
            <button class="button" onclick="goToStudentPortal()">Student</button>
            <button class="button" onclick="goToTeacherPortal()">Teacher</button>
        </div>
        <div class="left-pane">
            <img src="./image/ui_login.jpg" alt="Login Image">
        </div>
    </div>

    <script>
        function goToStudentPortal() {
            location.href='./Student_login.jsp';
        }

        function goToTeacherPortal() {
            location.href='./Teacher_login.jsp';
        }
    </script>
</body>
</html>
