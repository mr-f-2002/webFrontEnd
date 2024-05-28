<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignment Submission</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            overflow: hidden;
        }
        
        .container {
            width: 100%;
            height: 100vh;
            background-color: blue;
            display: flex;
        }
        .blackboard {
            width: 40%;
            height: 100vh;
            background-color: #967E76;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .blackboard img{
            width: 60%;
            height: auto;
        }
        .blackboard h2{
            text-align: center;
            color: white;
        }
        .upload-pane {
            width: 60%;
            height: 100vh;
            background-color: #ffffff;
            border-radius: 5px;
            padding: 10px;
        }
        #submitted{
            color: green;
            font-size: 14px;
            font-weight: bold;
            width: 95%;
            text-align: right;
            padding: 10px;
            margin: 0;
            padding: 0;
        }
        .upload-pane h6{
            margin-top: 10px;
            margin-bottom: 2px;
            padding: 0;
            font-size: 12px;
        }
        .upload-pane .todo-text{
            font-size: 12px;
            margin: 0;
            border-bottom: 1px solid #967E76;
            padding-bottom: 5px;
        }
        .attachments{
            width: 80%;
            min-height: 100px;
            overflow-y: scroll;
            background-color: white;
            border-radius: 4px;
            border: 1px solid black;
        }
        .upload-box{
            background-color: #EEE3CB;
            margin-top: 10px;
            border-radius: 4px;
            padding: 5px;
        }
        .upload-box p{
            margin-bottom: 5px;
            padding-bottom: 0;
        }
        .tbgroup{
            display: flex;
            align-items: end;
            justify-content: space-between;
        }
        .tbgroup #select-file{
            background-color: #967E76;
            padding: 10px;
            color: white;
            border: none;
            height: fit-content;
            border-radius: 4px;
            margin-bottom: 10px;
            cursor: pointer;
        }
        .uploaded{
            width: 99%;
            min-height: 50px;
            overflow-y: scroll;
            background-color: white;
            border-radius: 4px;
            border: 1px solid black;
        }
        .upload-btn{
            display: block;
            margin: auto;
            width: 80%;
            background-color: #967E76;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="blackboard">
            <h2>Assignment Submission</h2>
            <img src="./image/blackboard.png" alt="Blackboard Image">
        </div>
        <div class="upload-pane">
            <p id="submitted">Submitted</p>
            <h2>Assignment Title</h2>
            <h6>TO DO:</h6>
            <p class="todo-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Consectetur animi ipsa fugiat illum corrupti quae similique amet, id sit dolorem voluptatem dignissimos ipsam, itaque eaque eligendi aspernatur rerum minima voluptates?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea impedit tenetur voluptatum, corrupti a iusto numquam et unde fuga ipsa repudiandae expedita non voluptas omnis veniam eos aperiam molestiae quisquam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus necessitatibus perferendis ea eos, accusantium molestias suscipit a veniam placeat unde quidem iusto tempora aut omnis voluptas assumenda sit vel iure.</p>
            <h6>Attachments:</h6>
            <div class="attachments"></div>
            <div class="upload-box">
                <div class="tbgroup">
                    <p>Upload Your Files here:</p>
                    <input type="button" id="select-file" value="Select File(s)" />
                </div>
                <div class="uploaded"></div>
                <p>Comments:</p>
                <textarea placeholder="Enter Necessary Instructoins" id="comments" class="uploaded"></textarea>
                <input type="button" value="Upload" class="upload-btn">
            </div>
        </div>
    </div>
</body>
</html>
