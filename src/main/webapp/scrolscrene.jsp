<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
                body{
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container{
            display: flex;
            align-items: center;
            justify-content: center;
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
        .left h1{
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
        #logout{
            position: absolute;
            bottom: 20px;
        }
        .circle{
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
        .right{
            width: 70%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            background-color: rgba(170, 170, 170, 0.275);
        }
        .right .top{
            width: 90%;
            height: 10%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2%;
        }
        .top h1{
            font-size: 40px;
        }
        .top .r{
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        .r button, #Logout1, #postBtn{
            padding: 5px 10px;
            border-radius: 5px;
            border: none;
            margin: 3px;
            background-color: #967E76;
            color: white;
        }
        #Logout1{
            position: absolute;
            bottom: 10px;
            right: 10px;
        }
        .right img{
            width: 100%;
            position: absolute;
            bottom: 0;
            right: 0;
            z-index: -1;
        }
        .right label{
            font-weight: bold;
            padding: 5px 0;
            font-size: 18px;
            margin-top: 20px;
        }
        #listview{
            background-color: white;
            width: 95%;
            min-height: 100px;
            height: 100px;
            border-radius: 4px;
            overflow-y: scroll;
        }
        textarea{
            width: 100%;
            margin-left: 20px;
            border: none;
            background-color: white;
            border-radius: 4px;
            padding: 5px;
        }
        #postBtn{
            margin-left: 20px;
        }
        #scroll{
            width: 100%;
            background-color: white;
            min-height: 82%;
            margin-top: 3%;

        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <h1>Student Portal</h1>
            <div class="circle">
                <img src="./image/student.png" alt="">
            </div>
            <div id="postCount">0</div>
            <button id="post" onclick="onPostClick()">Post</button>
            <button id="post" onclick="onAssignmentClick()">Assignment</button>
            <button id="logout">Log Out</button>
        </div>
        <div class="right">
            <img src="./image/bg2.png" alt="">
            <div class="top">
                <h1 >Classroom Title</h1>
                <div class="r">
                    <button id="back" onclick="goToHome2()">Back</button>
                </div>
            </div>
            <div style="width: 100%; height: 5%; display: flex;">
                <textarea type="text" placeholder="Type something..." name="post" id="post"></textarea>
                <button id="postBtn" onclick="onPostClick()">Post</button>
            </div>
            <div id="scroll"></div>
        </div>
    </div>

    <Script>
        function goToHome() {
            // Implement your function logic here
        }

        function goToHome2() {
            // Implement your function logic here
        }

        function create_post() {
            // Implement your function logic here
        }

        function onPostClick() {
            // Implement your function logic here
        }

        function onAssignmentClick() {
            // Implement your function logic here
        }
    </Script>
</body>
</html>