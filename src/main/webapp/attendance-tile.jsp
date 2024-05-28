<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Tile</title>
    <style>
        .attendance-tile{
            width: 100%;
            height: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #967E76;
            padding: 2px 5px;
            margin: 1px;
            border-radius: 4px;
        }
        img{
            width: 30px;
            height: auto;
        }
        .label{
            color: white;
        }
        .pabox{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .pabox button{
            width: fit-content;
            margin: 1px;
        }
    </style>
</head>
<body>
    <div class="attendance-tile">
        <img src="./image/immigration.png" alt="Immigration">
        <div class="label">ID</div>
        <div class="pabox">
            <button id="present" class="attendance-button" onclick="presentClick()">P</button>
            <button id="absent" class="attendance-button" onclick="absentClick()">A</button>
        </div>
    </div>
</body>
</html>
