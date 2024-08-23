
<html>
<body>
<%
    //get the data from html page
    String taskname=request.getParameter("taskname");
    String taskdescription=request.getParameter("taskDescription");
    out.print(taskname+" "+taskdescription);

    //Add the html form data into session
    session.setAttribute("taskNameKey",taskname);
    session.setAttribute("taskdescription",taskdescription);

    //Redirect to addtodopage
    response.sendRedirect("http://localhost:8080/TodoJSPMysql/addtodopage.jsp");
%>
</body>
</html>
