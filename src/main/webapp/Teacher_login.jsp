<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Login Page</title>
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


        .center-pane form{
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        
        .center-pane .heading {
            color: rgb(255, 255, 255);
            font-size: 36px;
            font-weight: bold;
            margin: 20px;
            border-bottom: 1px solid white;
            border-radius: 2px;
        }
        
        .center-pane .sub-heading {
            color: rgb(255, 255, 255);
            font-size: 18px;
        }
        .input-container{
            width: 60%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 5px;
        }
        .input-label {
            color: white;
            font-size: 20px;
            font-weight: bold;
            width: 40%;
        }
        
        .input-field {
            width: 70%;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
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
            margin-top: 50px;
        }
        #back{
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #967E76;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="title">Classroom: Redefined</div>
<div class="container">
    <div class="center-pane">
        <div class="heading">Let's Sign In!</div>
        <form action="TeacherLoginServlet" method="post">
            <div class="input-container">
                <label class="input-label" for="teacherID">Teacher ID</label>
                <input type="text" id="teacherID" name="teacherID" class="input-field" placeholder="Teacher ID">
            </div>
            <div class="input-container">
                <label class="input-label" for="passWord">Password</label>
                <input type="password" id="passWord" name="passWord" class="input-field" placeholder="Password">
            </div>
            <button type="submit" class="button">Login</button>
        </form>
        <button id="back" onclick="goToHome()">Back</button>
    </div>
    <div class="left-pane">
        <img src="./image/ui_login.jpg" alt="Login Image">
    </div>
</div>

<script>
    function goToHome() {
        location.href='./index.jsp';
    }
</script>
</body>
</html>
