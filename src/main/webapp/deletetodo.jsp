<%--
  Created by IntelliJ IDEA.
  User: sm980
  Date: 24-08-2024
  Time: 01:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    String username = "root";
    String password = "";
    String url = "jdbc:mysql://localhost:3312/todoDatabase";
    String taskIDParam = request.getParameter("taskID");

    if (taskIDParam != null) {
        int taskID = Integer.parseInt(taskIDParam);
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Database connected");

            String delete = "DELETE FROM addTodo WHERE taskID = ?";
            ps = connection.prepareStatement(delete);
            ps.setInt(1, taskID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>

</body>
</html>