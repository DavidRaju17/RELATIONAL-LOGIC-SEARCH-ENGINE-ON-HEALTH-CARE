<%-- 
    Document   : Download
    Created on : Apr 13, 2019, 10:06:23 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%String fname=request.getParameter("fname");
    response.sendRedirect("DownloadFile?"+fname);
    %>
    </body>
</html>
