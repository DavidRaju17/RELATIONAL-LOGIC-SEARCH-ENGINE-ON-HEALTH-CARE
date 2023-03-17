<%-- 
    Document   : admin
    Created on : 30 Mar, 2019, 6:09:22 PM
    Author     : VENKAT
--%>
<%@page import="java.sql.*"%>
<%@page import="com.dbcon.Queries"%>
<%String username=(String)session.getAttribute("username");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!DOCTYPE html>
<html lang="en"> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Relational Logic Search Engine On Healthcare</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css"><link rel="stylesheet" href="table.css">
        
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
	<script src="js/modernizr.js"></script>
        <link rel="stylesheet" href="ulstyle.css">
	<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
        
</head>
<body>
	
	<!-- ====================================================
	header section -->
	<header class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-xs-5 header-logo">
					<br>
                                        <h4><a href="index.html">Relational Logic Search Engine On Healthcare</a></h4>
				</div>

				<div class="col-md-7">
					<nav class="navbar navbar-default">
					  <div class="container-fluid nav-bar">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					    </div>

					    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					      
					      <ul>
					        <li><a  href="AdminHome.jsp" >Home</a></li>
					        <li><a class="menu" href="AddMedicalDetails.jsp">Add Medical Details</a></li>
					        <li><a class="menu active" href="ViewMedicalDetails.jsp">View Medical Details</a></li>
					      
					       <li><a class="menu" href="admin.jsp">logout</a></li>
					      </ul>
					    </div><!-- /navbar-collapse -->
					  </div><!-- / .container-fluid -->
					</nav>
				</div>
			</div>
		</div>
	</header> <!-- end of header area -->

	<section class="slider" id="home">
		<div class="container-fluid">
			<div class="row">
			    <div id="carouselHacked" class="carousel slide carousel-fade" data-ride="carousel">
					<div class="header-backup"></div>
			        <!-- Wrapper for slides -->
			      
			        <!-- Controls -->
			       
			    </div>
			</div>
		</div>
	</section><!-- end of slider section -->

	<!-- about section -->
	<section class="about text-center" id="about">
		<div class="container">
			<div class="row">
                         
                                <table align="center" style="margin-bottom:200px;">
                                    <h2>MEDICAL DETAILS</h2>
                                    <tr><th>DATABASE</th>
                                    <th>DISEASE</th><th>DESCRIPTION</th><th>FILENAME</th><th>DATE</th>
                                    </tr>      
                            <%
                            String query="select * from medical";
                            try{
                             ResultSet r=Queries.getExecuteQuery(query);
                             while(r.next()){
                                %> 
                                <tr>
                                    <td><%=r.getString("db")%></td>
                                    <td><%=r.getString("disease")%></td>
                                    <td><%=r.getString("desc")%></td>
                                    <td><%=r.getString("filename")%></td>
                                    <td><%=r.getString("date")%></td>
                                </tr>        
                            <% }
                            }catch(Exception e){
                             out.println(e);   
                            }
                            
                            %>        
                                    
                               </table>
                        
					</div>
				</div>
			
	</section><!-- end of service section -->


	<!-- team section -->
	
	
	

	<!-- footer starts here -->
	<footer class="footer clearfix">
		<div class="container">
			<div class="row">
				<div class="col-xs-6 footer-para">
					<p>&copy;Venkatarao All right reserved</p>
				</div>
				<div class="col-xs-6 text-right">
					<a href=""><i class="fa fa-facebook"></i></a>
					<a href=""><i class="fa fa-twitter"></i></a>
					<a href=""><i class="fa fa-skype"></i></a>
				</div>
			</div>
		</div>
	</footer>

	<!-- script tags
	============================================================= -->
	<script src="js/jquery-2.1.1.js"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="js/gmaps.js"></script>
	<script src="js/smoothscroll.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>
