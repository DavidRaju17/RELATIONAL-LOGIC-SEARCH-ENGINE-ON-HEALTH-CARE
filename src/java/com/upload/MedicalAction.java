/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.dbcon.Queries;
import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class MedicalAction extends HttpServlet {

   final String filepath="E://";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       MultipartRequest mr=new MultipartRequest(request,filepath);
       try{
        
String database=mr.getParameter("database");
String disease=mr.getParameter("disease");
String dis=mr.getParameter("dis");
String date=mr.getParameter("date");

File f=mr.getFile("file");
String fname=f.getName();
 BufferedReader br=new BufferedReader(new FileReader(f));
           StringBuffer sb=new StringBuffer();
          String temp="null";
          while((temp=br.readLine())!=null){
               sb.append(temp);
          }
 String data=sb.toString();

String query="insert into medical values(null,'"+database+"','"+disease+"','"+dis+"','"+fname+"','"+data+"','"+date+"')";

int i=Queries.getExecuteUpdate(query);
if(i>0){
  response.sendRedirect("AddMedicalDetails.jsp?msg=success");  
}else{
  response.sendRedirect("AddMedicalDetails.jsp?msg=failed");  
}

       }catch(Exception e){
           System.out.println(e);
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
