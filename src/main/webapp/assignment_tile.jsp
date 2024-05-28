<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignment Tile</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        
        .container {
            max-width: 642px;
            background-color: #323232;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            align-items: center;
            padding: 1%;
        }
        .text-pane{
            width: 68%;
            padding: 0 20px;
        }
        .label {
            font-size: 23px;
            font-weight: 600;
            color: #ffffff;
        }
        
        .date-label {
            font-size: 15px;
            color: #ffffff;
        }
        
        .assignment-title {
            font-size: 16px;
            color: #ffffff;
            word-wrap: break-word;
        }
        
        .due-pane {
            background-color: #424242;
            border: 1px solid #000000;
            border-radius: 3px;
            padding: 5px;
            display: flex;
            min-width: 20%;
            width: 20%;
        }
        
        .due-label {
            font-size: 17px;
            font-weight: 600;
            color: #ffffff;
        }
        
        .due-text {
            margin-left: 5px;
            font-size: 16px;
            font-weight: 600;
            color: #a2ff00;
        }
        
        .image {
            width: 10%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <img class="image" src="./image/files.png" alt="Files Image">
        <div class="text-pane">
            <div class="label">Mr. X</div>
            <div class="date-label">September 27, 2002</div>
            <div class="assignment-title">Random Text</div>
        </div>
        <div class="due-pane">
            <div class="due-label">Due in :</div>
            <div class="due-text">2 Days</div>
        </div>
    </div>
</body>
</html>
