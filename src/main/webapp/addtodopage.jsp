<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: sm980
  Date: 16-08-2024
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //add the todo data into mysql database
    String taskName=session.getAttribute("taskNameKey").toString();
    String taskDescription=session.getAttribute("taskdescription").toString();
    out.print(taskName+" "+taskDescription);
    //to get the database credentials into String
     String username="root";
     String password="";
     String url="jdbc:mysql://localhost:3306/tododatabase";
     //load the mysql connect j driver
    Class.forName("com.mysql.jdbc.Driver").newInstance();

     try {

         //to establish the mysql database connection with JSP and Servlet
         Connection connection = DriverManager.getConnection(url, username, password);
         System.out.println("Database Connected");

         String insert_query = "insert into addtodotb(TaskName, TaskDescription) values(?,?)";
         PreparedStatement ps = connection.prepareStatement(insert_query);
         ps.setString(1, taskName);
         ps.setString(2, taskDescription);
          ps.executeUpdate();
             System.out.println("Todo Added");


     }
  catch (Exception e)
  {
      System.out.println(e);
  }


%>
</body>
</html>
