<%@ page import="com.example.projectfrontend2_2.DTO.StudentDTO" %>
<%@ page import="com.example.projectfrontend2_2.DTO.PostDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectfrontend2_2.http.RequestMaker" %>
<%@ page import="com.example.projectfrontend2_2.DTO.ClassroomDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.time.LocalDateTime" %>
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
        #contentContainer{
            width: 90%;
            min-height: 80%;
            max-height: 80%;
            margin-top: 3%;
            overflow: auto;
        }
        .post {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            width: 95%;
        }
        .post-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        .post-content {
            margin-bottom: 10px;
        }
        .post-footer {
            margin-top: 10px;
        }
        .posted-by {
            font-weight: bold;
        }
        .timestamp {
            color: #777;
            font-size: 12px;
        }
        .links {
                    list-style-type: none;
                    padding: 0;
                }

                .links li {
                    margin-bottom: 5px;
                }

                .links a {
                    color: #337ab7;
                    text-decoration: none;
                }

                .classroom-id {
                    color: #777;
                    font-size: 12px;
                }

    </style>
</head>
<body>
<% String courseName = request.getParameter("courseName"); %>
<% String teacher = request.getParameter("teacher"); %>
<% Long courseId = Long.valueOf(request.getParameter("courseId")); %>
<div class="container">
    <div class="left">
        <h1>Student Portal</h1>
        <div class="circle">
            <img src="./image/student.png" alt="">
        </div>
        <%
            StudentDTO sdto = (StudentDTO) request.getSession().getAttribute("studentDTO");
        %>
        <div id="studentInfo">
            <p><strong>Name:</strong> <%= sdto.getName() %></p>
            <p><strong>Student ID:</strong> <%= sdto.getStudid() %></p>
        </div>
        <button id="logoutBtn">Log Out</button>
    </div>
    <div class="right">
        <img src="./image/bg2.png" alt="">
        <div class="top">
            <!-- Display the classroom title -->
            <h1 id="classroomTitle"><%= courseName  %></h1>
            <p><%= teacher %></p>
        </div>
        <div style="width: 100%; height: 5%; display: flex;">
            <textarea type="text" placeholder="Type something..." name="post" id="postText"></textarea>
            <button id="postBtn" onclick="createPost()">Post</button>
        </div>
        <%
            RequestMaker rqm = new RequestMaker();
            ClassroomDTO cdto = null;
            try {
                cdto = rqm.fetch_classroom(courseId);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            List<Long> classlist = new ArrayList<>(cdto.getPosts());
            classlist.sort((a, b) -> Math.toIntExact(b - a));
        %>
        <div id="contentContainer">
            <%
                for(Long id : classlist) {
                    PostDTO p = null;
                    try {
                        p = rqm.fetch_post(id);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                    LocalDateTime lc = p.getTime().toLocalDateTime();
            %>
            <div class="post">
                <div class="post-header">
                    <p class="posted-by"><%= p.getPosted_by() %></p>
                    <p class="timestamp"><%= lc %></p>
                </div>
                <div class="post-content">
                    <p class="text"><%= p.getText() %></p>
                    <ul class="links">
                        <% for (String link : p.getLink()) { %>
                        <li><a href="<%= link %>"><%= link %></a></li>
                        <% } %>
                    </ul>
                </div>
                <div class="post-footer">
                    <p class="classroom-id">Classroom ID: <%= p.getClassroom_id() %></p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Your JavaScript functions -->
<script>

    function createPost() {
        // Implement your logic to create a post
    }

    function onPostClick() {
        // Implement your logic to handle post click event
    }

    function onAssignmentClick() {
        // Implement your logic to handle assignment click event
    }
</script>
</body>
</html>