<%-- 
    Document   : uSERnaction
    Created on : Mar 12, 2019, 11:56:37 PM
    Author     : Acer
--%>

<%@page import="java.sql.*"%>
<%@page import="com.dbcon.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbcon.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%try{
   
                   
    String uname=request.getParameter("username");
            String pwd=request.getParameter("password");
            
            Connection con=DBCon.getCon();
             Statement pst=con.createStatement();
          
            
              
            String query="select * from user where username='"+uname+"'and password='"+pwd+"'";
           ResultSet rs=Queries.getExecuteQuery(query);
          if(rs.next()){
           
             
                 String email=rs.getString("email"); 
           
                 session.setAttribute("email",email);
          
              response.sendRedirect("User_Home.jsp?msg=Successfully Accessed home page....!!!");
                 
           }else{
              response.sendRedirect("DataLogin.jsp?msg=<font color='orange'>Login Failed Check Username/password...!!!</font>");
          }
            
        }catch(Exception e){
            out.println(e);
        }%>