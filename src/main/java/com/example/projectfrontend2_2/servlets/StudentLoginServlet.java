package com.example.projectfrontend2_2.servlets;

import com.example.projectfrontend2_2.DTO.*;

import com.example.projectfrontend2_2.http.RequestMaker;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "loginstd", value = "/loginstd")
public class StudentLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentID = req.getParameter("studentID");
        String password = req.getParameter("passWord");

        if (studentID != null && password != null) {
            LoginDTO ldto = new LoginDTO();
            ldto.setCommon_id(Long.parseLong(studentID));
            ldto.setPassword(hashPassword(password));

            Gson gson = new Gson();
            RequestMaker rqm = new RequestMaker();
            StudentDTO stdo = null;
            try {
                stdo = rqm.login_attempt(ldto, "/login/student");
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            if (stdo != null && stdo.getStudid().equals(ldto.getCommon_id())) {
                HttpSession session = req.getSession();
                session.setAttribute("studentDTO", stdo);

                List<Long> classroom_id = stdo.getClassroom_id();
                List<ClassroomDTO> all_classrooms = new ArrayList<>();
                List<TeacherDTO> all_teachers = new ArrayList<>();
                for (Long id : classroom_id) {
                    try {
                        all_classrooms.add(rqm.fetch_classroom(id));
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
                session.setAttribute("all_classrooms", all_classrooms);

                // Add session attributes for future access
                session.setAttribute("loggedIn", true); // Example attribute indicating user is logged in

                resp.sendRedirect("ClassScene.jsp");
            } else {
                resp.sendRedirect("Student_login.jsp?error=Invalid login");
            }

        } else {
            resp.sendRedirect("Student_login.jsp?error=Missing credentials");
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] hashedPasswordBytes = md.digest();
            BigInteger bigInt = new BigInteger(1, hashedPasswordBytes);
            String hashedPassword = bigInt.toString(16);
            while (hashedPassword.length() < 32) {
                hashedPassword = "0" + hashedPassword;
            }
            return hashedPassword;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
