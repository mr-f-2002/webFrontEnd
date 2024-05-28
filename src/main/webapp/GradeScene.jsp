<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classrooms</title>
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
        .left h2{
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

        .circle{
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-color: yellow; /* blue with opacity */
            display: flex;
            align-items: center;
            justify-content: center;
            /* border: 2px dashed black; */
        }
        .circle img {
            width: 80%;
            height: 80%;
        }
        .right{
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
        .right .top{
            width: 90%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2%;
            position: absolute;
            right: 0;
            top: 0;
        }
        .top h1{
            font-size: 40px;
        }
        .top .r{
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        .r button, .holder button, #Logout1{
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
        .holder input{
            width: 80px;
            margin-left: 20px;
            border: none;
            background-color: white;
            border-radius: 4px;
            padding: 5px;
        }
        .holder button{
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <h2 >Student Portal</h2>
            <div class="circle">
                <img src="./image/exam.png"/>
            </div>
            <button id="Logout"onclick="goToHome()">Log Out</button>
        </div>
        <div class="right">
            <img src="./image/bg2.png" alt="">
            <div class="top">
                <h1 >Assignment Name</h1>
                <div class="r">
                    <button id="back" onclick="goToHome2()">Back</button>
                </div>
            </div>
            <label for="submission">Submissions</label>
            <ul id="listview"></ul>
            <label for="">Name: Niloy</label>
            <label for="files">Files:</label>
            <ul id="listview"></ul>
            <div class="holder">
                <label for="mark">Grade: </label>
                <input type="number" name="mark" id="mark">
                <label for="">/ 100</label>
                <button>Grade</button>
            </div>
        </div>
    </div>
</body>
</html>
