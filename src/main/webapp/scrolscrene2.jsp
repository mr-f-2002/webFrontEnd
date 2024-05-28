<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClassRoom: Redefined</title>
    <style>
        /* Add your CSS styling here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff; /* adjust as needed */
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
        .left button {
            width: 100%;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            background-color: #1133ba54;
            color: #fff;
            border: none;
            cursor: pointer;
            margin: 1px;
        }
        .left h4{
            margin: 10px 0 0 0;
            text-align: center;
        }
        .left p{
            margin: 5px 0 40px 0;
            text-align: center;
        }
        
        .right{
            width: 70%;
            padding-left: 30px;
            height: 100vh;
            display: flex;
            align-items: start;
            justify-content: start;
            flex-direction: column;
            background-color: rgba(170, 170, 170, 0.275);
        }
        .right h3{
            font-size: xx-large;
            margin-bottom: 10px;
        }
        .right textarea{
            width: 90%;
        }
        .right label{
            padding: 10px;
            width: 20%;
            font-size: 24px;
            overflow: auto;
        }
        .attachmentPanel{
            background-color: #967E76;
            width: 90%;
            padding: 10px ;
            border-radius: 5px;
            display: flex;
            color: white;
        }
        .attachmentPanel ul{
            background-color: #1133ba14;
            width: 70%;
            min-height: 100px;
            height: 100px;
            overflow: auto;
            border-radius: 5px;
            margin: 0;
            padding: 10px 0 0 30px;
        }
        .attachmentPanel .btnGroup{
            width: 10%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .right button{
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin: 3px;
            background-color: #1133ba54;
            color: white;
        }
        #postPanel{
            width: 100%;
            height: inherit;
            overflow: auto;
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
                <h4>Niloy</h4>
                <p>200041123</p>
            </div>
            <button id="post" onclick="onPostClick()">Post</button>
            <button id="post" onclick="onAssignmentClick()">Assignment</button>
            <button id="post" onclick="onAssignClick()">Assign</button>
            <button id="post" onclick="onAttendenceClick()">Attendence</button>
            <button id="logout" onclick="logout()">Log Out</button>
        </div>
        <div class="right">
            <h3>Classroom Title</h3>
            <textarea name="assignment" placeholder="Type something..." id="classTitle"></textarea>
            <div class="attachmentPanel">    
                <label for="attachments">Attachments</label>
                <ul id="attachmentList">
                    <li>No Attachment Yet!</li>
                </ul>
                <div class="btnGroup">
                    <button>+Add</button>
                    <button>Post</button>
                </div>
            </div>
            <div id="postPanel">
            
            </div>
        </div>
    </div>

    <script>
        // You can add JavaScript code here for dynamic functionality
        // For example, handling user interactions or making AJAX requests
    </script>
</body>
</html>
