<%@ page import="com.example.projectfrontend2_2.DTO.Attendance" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance</title>
    <style>
        body{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container{
            width: 70%;
            height: 90vh;
            display: flex;
            padding: 10px;
            background-color: azure;
        }
        .left{
            width: 40%;
            height: 100%;
            background-color: #967E76;
            border-radius: 5px;
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .left h1{
            color: white;
        }
        .left img{
            width: 60%;
            height: auto;
        }
        .right{
            width: 60%;
            padding: 30px;
        }
        .right label{
            font-size: 20px;
            font-weight: bold;
        }
        .right input{
            width: 100%;
            background-color: white;
            border-radius: 4px;
            border: 1px solid black;
            padding: 5px;
            margin-bottom: 5px;
        }
        #scroll{
            width: 100%;
            max-height: 70vh;
            overflow-y: auto;
            border: 1px solid black;
            background-color: white;
            border-radius: 4px;
            margin-bottom: 5px;
        }
        button{
            background-color: #967E76;
            padding: 10px;
            color: white;
            border: none;
            height: fit-content;
            border-radius: 4px;
            margin: 0;
            cursor: pointer;
            float: right;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <h1>Attendance</h1>
        <img src="./image/event.png" alt="Event Image">
    </div>
    <div class="right">
        <label>Enter Date:</label><br>
        <input type="date" id="datePicker" name="datePicker">
        <div id="scroll">
<%--            <%--%>
<%--                List<Attendance> attList = (List<Attendance>) request.getSession().getAttribute("attendanceList");--%>
<%--                System.out.println(attList + "\n*******************");--%>
<%--            %>--%>
            <c:forEach var="student" items="${sessionScope.students}">
                <%-- Default colors --%>
                <c:set var="colorP" value="#95ace8"/>
                <c:set var="colorA" value="#95ace8"/>

                <%-- Check attendance for the current student --%>
                <c:forEach var="a" items="${sessionScope.attendanceList}">
                    <c:if test="${a.studentid == student.id}">
                        <c:choose>
                            <c:when test="${a.present == true}">
                                <c:set var="colorP" value="green"/>
                                <c:set var="colorA" value="#95ace8"/>
                            </c:when>
                            <c:when test="${a.present == false}">
                                <c:set var="colorP" value="#95ace8"/>
                                <c:set var="colorA" value="red"/>
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <%-- Include attendance tile with parameters --%>
                <jsp:include page="attendance-tile.jsp">
                    <jsp:param name="studentId" value="${student.id}"/>
                    <jsp:param name="colorP" value="${colorP}"/>
                    <jsp:param name="colorA" value="${colorA}"/>
                </jsp:include>
            </c:forEach>
        </div>
        <button id="back" onclick="location.href='./scrolscrene2.jsp'">Back</button>
    </div>
</div>

<script>
    document.getElementById("datePicker").addEventListener("change", function() {
        let selectedDate = this.value;
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "SetDateServlet", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("selectedDate=" + selectedDate);
        console.log("Session attribute 'date_picked' set to: " + selectedDate);
        location.reload()
    });

    let datePicked = "<%= session.getAttribute("date_picked") %>";
    document.getElementById("datePicker").value = datePicked
    console.log("test done " + datePicked)

</script>
</body>
</html>