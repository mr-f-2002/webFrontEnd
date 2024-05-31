<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Assignment</title>
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
            background-color: #1133ba54;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px dashed black;
        }
        .circle img {
            width: 70%;
            height: 70%;
        }
        .right {
            width: 50%;
            height: 100vh;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            flex-direction: column;
            position: relative;
            padding: 0 10%;
            background-color: rgba(170, 170, 170, 0.275);
        }
        .right img {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            opacity: 0.8;
        }
        .right label {
            font-weight: bold;
            padding: 5px 0;
            font-size: 18px;
            margin-top: 20px;
        }
        .right input, .right textarea {
            width: 100%;
            padding: 10px 5px;
            border-radius: 4px;
            border: none;
        }
        .right button {
            padding: 5px 10px;
            border-radius: 4px;
            border: none;
            background-color: #967E76;
            color: white;
        }
        #listview {
            background-color: white;
            width: 95%;
            min-height: 100px;
            height: 100px;
            border-radius: 4px;
            overflow-y: scroll;
        }
        #upload {
            width: 200px;
            padding: 10px;
        }
        button:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <h1>Create Assignment</h1>
        <div class="circle">
            <img src="./image/blackboard%20(2).png"/>
        </div>
        <button id="Logout" onclick="goToHome()">Log Out</button>
    </div>
    <div class="right">
        <form action="AssignmentServlet" method="post">
            <label for="title">Assignment Title:</label>
            <input type="text" id="title" name="title" placeholder="Enter Assignment Title" required />
            <label for="instr">Instructions:</label>
            <textarea id="instr" name="instruction" placeholder="Enter Necessary Instructions" required></textarea>
            <label for="dpkr">Deadline:</label>
            <input type="datetime-local" id="dpkr" name="deadline" required />
            <label for="marks">Marks:</label>
            <input type="number" id="marks" name="marks" placeholder="Enter Marks" required />
            <button id="upload" type="submit">Post</button>
        </form>
    </div>
</div>
<script>
    function goToHome() {
        window.location.href = "LogoutServlet";
    }
</script>
</body>
</html>
