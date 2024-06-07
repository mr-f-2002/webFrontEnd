<%@ page import="com.example.projectfrontend2_2.DTO.TeacherDTO" %>
<%@ page import="com.example.projectfrontend2_2.DTO.ClassroomDTO" %>
<%@ page import="com.example.projectfrontend2_2.http.RequestMaker" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectfrontend2_2.DTO.PostDTO" %>
<%@ page import="com.example.projectfrontend2_2.DTO.AssignmentDTO" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClassRoom: Redefined</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff; /* adjust as needed */
        }
        .container{
            display: flex;
            align-items: stretch; /* Adjust to ensure full height */
            justify-content: center;
            height: 100vh; /* Ensure full viewport height */
        }
        .left{
            width: 30%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            background-color: #967E76;
            color: white;
            font-size: 20px;
            border-radius: 0 10px 10px 0;
            padding: 20px;
            box-sizing: border-box;
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
        .left h4, .left p {
            text-align: center;
            margin: 10px 0;
        }
        .right{
            width: 70%;
            display: flex;
            align-items: flex-start;
            justify-content: flex-start;
            flex-direction: column;
            background-color: rgba(170, 170, 170, 0.275);
            padding: 20px;
            box-sizing: border-box;
        }
        .right h3{
            font-size: xx-large;
            margin-bottom: 10px;
        }
        form {
            width: 100%; /* Full width */
        }
        form textarea{
            width: 100%; /* Full width */
            margin-bottom: 10px; /* Add some space below */
            padding: 10px; /* Add some padding for better appearance */
            box-sizing: border-box;
        }
        .attachmentPanel{
            background-color: #967E76;
            width: 100%; /* Full width */
            padding: 10px;
            border-radius: 5px;
            display: flex;
            align-items: flex-start; /* Align items to the start */
            color: white;
            box-sizing: border-box;
            flex-wrap: wrap; /* Allow wrapping of elements */
        }
        .attachmentPanel label{
            width: 100%;
            font-size: 24px;
            margin-bottom: 10px;
        }
        .attachmentPanel ul{
            background-color: #1133ba14;
            flex: 1;
            max-height: 200px;
            overflow-y: auto;
            border-radius: 5px;
            margin: 0;
            padding: 10px;
        }
        .attachmentPanel li {
            background-color: #ffffff;
            /*margin-bottom: 10px; */
            padding: 3px;
            border-radius: 5px;
            list-style: none;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .attachmentPanel li input {
            width: 90%;
            padding: 3px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .attachmentPanel .btnGroup{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin-left: 10px;
        }
        .attachmentPanel .btnGroup button{
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin: 3px 0;
            background-color: #1133ba54;
            color: white;
            cursor: pointer;
        }
        .content-container {
            width: 100%;
            overflow-y: auto;
            margin-top: 20px; /* Add some space above */
        }
        .content-tile {
            background: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .content-tile p {
            margin: 0 0 10px;
        }
        /* Modal styles */
        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #967E76;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 5px;
            color: white;
        }

        .modal-content label{
            font-size: 18px;
            font-weight: bold;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button.btn {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            background-color: #1133ba54;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        button.btn:hover {
            background-color: #1133ba;
        }

        .delete-btn {
            padding: 5px 10px;
            font-size: 14px;
            font-weight: bold;
            background-color: #ff4c4c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .delete-btn:hover {
            background-color: #ff0000;
        }


    </style>
</head>

<%
    TeacherDTO teacher = (TeacherDTO) session.getAttribute("teacher");
    String teacherName = "";
    boolean isTeacher = false;
    if(teacher != null) {
        teacherName = teacher.getName();
        isTeacher = true;
    }

    ClassroomDTO cdto = (ClassroomDTO) session.getAttribute("currentClassroom");
    String view = request.getParameter("view");
    if (view == null) {
        view = "posts"; // Default view
    }
    System.out.println("Page has been accessed");
%>

<body>
<div class="container">
    <div class="left">
        <h1>Teacher Portal</h1>
        <div class="circle">
            <img src="./image/student.png" alt="">
        </div>
        <div>
            <h4><%=teacherName%></h4>
        </div>
        <form action="scrolscene2.jsp" method="get">
            <input type="hidden" name="view" value="posts">
            <button type="submit">Posts</button>
        </form>
        <form action="scrolscene2.jsp" method="get">
            <input type="hidden" name="view" value="assignments">
            <button type="submit">Assignments</button>
        </form>
        <button id="assignButton">Assign</button>
        <form action="/attendance">
            <input type="hidden" name="view" value="attendance">
        <button id="attendanceButton">Attendance</button>
        </form>
        <form action="LogoutServlet" method="post">
            <button type="submit">Log Out</button>
        </form>
    </div>
    <div class="right">
        <h3><%=cdto.getCoursename()%></h3>
        <% if ("posts".equals(view)) { %>
        <form action="PostServlet" method="post">
            <textarea name="assignment" placeholder="Type something..." id="classTitle"></textarea>
            <div class="attachmentPanel">
                <label for="attachments">Attachments</label>
                <ul id="attachmentList">
                    <li><input type="text" name="link" placeholder="Paste a link here..." /></li>
                </ul>
                <div class="btnGroup">
                    <button type="button" onclick="addAttachment()">+Add</button>
                    <button type="submit">Post</button>
                </div>
            </div>
        </form>
        <% } %>
        <div id="contentPanel" class="content-container">
            <%
                RequestMaker rqm = new RequestMaker();
                if ("posts".equals(view)) {
                    List<Long> classlist = new ArrayList<>();
                    classlist.addAll(cdto.getPosts());

                    for (Long postId : classlist) {
                        PostDTO post = rqm.fetch_post(postId);
                        LocalDateTime lc = post.getTime().toLocalDateTime();
            %>
            <div class="content-tile">
                <p><%= post.getText() %></p>
                <p><%= post.getPosted_by() %></p>
                <ul>
                    <% for (String link : post.getLink()) { %>
                    <li><a href="<%= link %>"><%= link %></a></li>
                    <% } %>
                </ul>
                <p><%= lc.format(DateTimeFormatter.ofPattern("d MMM uuuu , HH:mm:ss ")) %></p>
                <% if (isTeacher) { %>
                <form action="DeletePostServlet" method="post">
                    <input type="hidden" name="postId" value="<%= post.getId() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>

                <% } %>
            </div>

            <%
                }
            } else if ("assignments".equals(view)) {
                List<Long> assignmentlist = new ArrayList<>();
                assignmentlist.addAll(cdto.getAssignmentsHereID());

                for (Long assignmentId : assignmentlist) {
                    AssignmentDTO assignment = rqm.fetch_ass(assignmentId);
                    LocalDateTime lc = assignment.getDeadline().toLocalDateTime();
            %>
            <div class="content-tile">
                <p><%= assignment.getInstruction() %></p>
                <p><%= assignment.getMarks() %></p>
                <p><%= lc.format(DateTimeFormatter.ofPattern("d MMM uuuu , HH:mm:ss ")) %></p>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>

<!-- Modal for adding a new assignment -->
<div id="assignModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2 style="text-align: center;">Add New Assignment</h2>
        <form action="AssignmentServlet" method="post">
            <div class="form-group">
                <label for="assignmentTitle">Title:</label>
                <input type="text" id="assignmentTitle" name="title" required>
            </div>
            <div class="form-group">
                <label for="assignmentInstructions">Instructions:</label>
                <textarea id="assignmentInstructions" name="instructions" required></textarea>
            </div>
            <div class="form-group">
                <label for="assignmentDeadline">Deadline:</label>
                <input type="datetime-local" id="assignmentDeadline" name="deadline" required>
            </div>
            <div class="form-group">
                <label for="assignmentMarks">Marks:</label>
                <input type="number" id="assignmentMarks" name="marks" required>
            </div>
            <button type="submit" class="btn">Add Assignment</button>
        </form>
    </div>
</div>


<script>
    function addAttachment() {
        var ul = document.getElementById("attachmentList");
        var li = document.createElement("li");
        var input = document.createElement("input");
        input.type = "text";
        input.name = "link"; // Ensure this matches the parameter name expected in the servlet
        input.placeholder = "Paste a link here...";
        li.appendChild(input);
        ul.appendChild(li);
    }

    // Get the modal
    var modal = document.getElementById("assignModal");

    // Get the button that opens the modal
    var btn = document.getElementById("assignButton");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }


</script>
</body>
</html>
