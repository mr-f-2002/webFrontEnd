package com.example.projectfrontend2_2.http;

import com.example.projectfrontend2_2.DTO.*;
import com.example.projectfrontend2_2.MultipartUtility;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class RequestMaker {

    private String url = "http://localhost:8080";
    private Gson gson;

    public static String host_addr = "localhost";

    public RequestMaker() {
        gson = new Gson();
        url = "http://"+host_addr+":8080";
    }

    public boolean deleteAssignment(Long assignmentId) throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url + "/classroom/deleteassignment/" + assignmentId))
                .DELETE()
                .build();

        System.out.println("Response from delete assignment:");
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println(response);

        return (response.statusCode() == 200);
    }

    public StudentDTO login_attempt(LoginDTO ldto , String path) throws IOException, InterruptedException {

        gson = new Gson();

        System.out.println(gson.toJson(ldto));
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + path)).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(ldto))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        StudentDTO sdto = gson.fromJson(response.body().toString() , StudentDTO.class);



        return sdto;
    }

    public TeacherDTO login_attempt_teacher(LoginDTO ldto , String path) throws IOException, InterruptedException {

        gson = new Gson();

        System.out.println(gson.toJson(ldto));
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + path)).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(ldto))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        TeacherDTO sdto = gson.fromJson(response.body().toString() , TeacherDTO.class);



        return sdto;
    }

    public Boolean course_register_attempt(CourseRegDTO crdto) throws IOException, InterruptedException {

        gson = new Gson();

        System.out.println(gson.toJson(crdto));
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/fetch/classroom/register")).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(crdto))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        String check = response.toString();

        if(check.equals("Paisi")){
            return true;
        }
        return false;
    }

    public void create_post(PostDTO pdto) throws IOException, InterruptedException {

        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();


        System.out.println(gson.toJson(pdto));
        HttpClient client = HttpClient.newHttpClient();
        System.out.println(pdto);

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/createpost")).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(pdto))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("Printing out the response now:");
        System.out.println(response);

    }

    public void create_attendance(Attendance a) throws IOException, InterruptedException {

        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd");
        gson = builder.create();


        System.out.println(gson.toJson(a));
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/createattendance")).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(a))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());


    }
    public ClassroomDTO fetch_classroom(Long Class_id) throws IOException, InterruptedException {

        gson = new Gson();


        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/fetch/classroom/" + Class_id.toString())).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        ClassroomDTO cdto = gson.fromJson(response.body().toString() , ClassroomDTO.class);


        System.out.println("here" + cdto.getDept());
        return cdto;
    }

    public Float get_all_attendance(Long Class_id , Long studid) throws IOException, InterruptedException {

        gson = new Gson();


        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/stat/allclasses/" + Class_id.toString() + "/" + studid.toString())).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        Float cdto = gson.fromJson(response.body().toString() , Float.class);



        return cdto;
    }

    public Float get_present_attendance(Long Class_id , Long studid) throws IOException, InterruptedException {

        gson = new Gson();


        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/stat/presentclasses/" + Class_id.toString() + "/" + studid.toString())).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        Float cdto = gson.fromJson(response.body().toString() , Float.class);



        return cdto;
    }


    public List<Attendance> fetchAttendanceByClassroomIdAndDate(Long classroomId, String dateStr) throws IOException, InterruptedException {
        gson = new Gson();

        HttpClient client = HttpClient.newHttpClient();

        // Format the date string to match the expected format "yyyy-MM-dd"
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date;
        try {
            date = inputFormat.parse(dateStr);
            dateStr = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url + "/classroom/attendance/" + classroomId + "/" + dateStr))
                .GET()
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println(response.body());
        Type listtype = new TypeToken<List<Attendance>>(){}.getType();
        List<Attendance> attendanceList = gson.fromJson(response.body().toString() , listtype);
        System.out.println(attendanceList);
        return attendanceList;
    }


    public StudentDTO fetch_student(Long id) throws IOException, InterruptedException {

        gson = new Gson();


        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/fetch/student/" + id)).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        StudentDTO cdto = gson.fromJson(response.body().toString() , StudentDTO.class);


        System.out.println("here" + cdto.getDept());
        return cdto;
    }




    public List<ClassroomDTO> fetch_all_classroom() throws IOException, InterruptedException {

        gson = new Gson();


        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/fetch/classroom/all" )).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        Type listtype = new TypeToken<List<ClassroomDTO>>(){}.getType();
        System.out.println(response.body().toString());
        List<ClassroomDTO> cdto = gson.fromJson(response.body().toString() , listtype);


        System.out.println("here" );
        return cdto;
    }

    public PostDTO fetch_post(Long id) throws IOException, InterruptedException {


        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();




        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/getpost/"+id )).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        Type listtype = new TypeToken<List<ClassroomDTO>>(){}.getType();
        System.out.println(response.body().toString());
        PostDTO pdto = gson.fromJson(response.body().toString() , PostDTO.class);


        System.out.println("here" );
        return pdto;
    }

    public List<Long> getPostIdsByClassId(Long classId) {
        List<Long> postIds = null;
        try {
            // Assuming you have an endpoint to fetch post IDs by class ID
            URL url = new URL("http://localhost:8081/class/" + classId + "/posts");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // Deserialize JSON response into List<Long>
                Type listType = new TypeToken<List<Long>>() {}.getType();
                postIds = new Gson().fromJson(response.toString(), listType);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postIds;
    }

    public boolean deletePost(Long postId) throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url + "/classroom/deletepost/" + postId))
                .DELETE()
                .build();

        System.out.println("Response from delete post:");
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println(response);


        return (response.statusCode() == 200) ;
    }


        public AssignmentDTO fetch_ass(Long id) throws IOException, InterruptedException {

//      System.out.println(id);
        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();




        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/getassignment/"+id )).
                GET().
                build();
        System.out.println(request);

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response);

        System.out.println(response.body().toString());
        AssignmentDTO pdto = gson.fromJson(response.body().toString() , AssignmentDTO.class);



        return pdto;
    }

    public FileDTO fetch_file_info(Long id) throws IOException, InterruptedException {


        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();




        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/file/fileinfo/"+id )).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        FileDTO pdto = gson.fromJson(response.body().toString() , FileDTO.class);


        System.out.println("here" );
        return pdto;
    }

    public SubmissionDTO fetch_submission_info(String id) throws IOException, InterruptedException {


        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();




        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/getsubmission/"+id )).
                GET().
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body().toString());
        SubmissionDTO pdto = gson.fromJson(response.body().toString() , SubmissionDTO.class);


        System.out.println("here" );
        return pdto;
    }

    public void create_assignment(AssignmentDTO pdto) throws IOException, InterruptedException {
        System.out.println("/classroom/create_assignment acessed");
        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();


        System.out.println(gson.toJson(pdto));
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/createassignment")).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(pdto))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("The response to the /create_assignment endpoint is:");
        System.out.println(response);


    }

    public void create_submit(SubmissionDTO pdto) throws IOException, InterruptedException {

        GsonBuilder builder = new GsonBuilder();
        builder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        gson = builder.create();


        System.out.println(gson.toJson(pdto));
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder().
                uri(URI.create(url + "/classroom/createsubmission")).
                POST(HttpRequest.BodyPublishers.ofString(gson.toJson(pdto))).
                header("Content-Type" , "application/json").
                build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());


    }

    public Long upload_file(String path) throws URISyntaxException, IOException, InterruptedException {

        String charset = "UTF-8";
        MultipartUtility multipart = new MultipartUtility(url + "/file/upload", charset);

        File uploadFile1 = new File(path);
//        multipart.addHeaderField("User-Agent", "CodeJava");
//        multipart.addHeaderField("Test-Header", "Header-Value");
//
//        multipart.addFormField("description", "Cool Pictures");
//        multipart.addFormField("keywords", "Java,upload,Spring");

        multipart.addFilePart("file", uploadFile1);


        List<String> response = multipart.finish();


        System.out.println("SERVER REPLIED:" + Long.parseLong(response.get(0)));


        return Long.parseLong(response.get(0));
    }

    public List<ClassroomDTO> getTeacherClasses(long teacherId) {
        List<ClassroomDTO> classes = null;
        try {
            URL url = new URL("http://localhost:8081" + "/teacher/" + teacherId + "/classes");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // Deserialize JSON response into List<ClassDTO>
                Type listType = new TypeToken<List<ClassroomDTO>>() {}.getType();
                classes = new Gson().fromJson(response.toString(), listType);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classes;
    }
}
