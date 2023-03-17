<%-- 
    Document   : admin
    Created on : 30 Mar, 2019, 6:09:22 PM
    Author     : VENKAT
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbcon.Queries"%>
<%String email=(String)session.getAttribute("email");%>
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
	<link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="ulstyle.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
	<script src="js/modernizr.js"></script>
	<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
        <style>
            table
            {
                width:200px;
                height:200px;
                margin-bottom:200px;
                
            }
            table tr td 
            {
               margin:20px;
              
            }
            </style>

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
					        <li><a class="menu active" href="User_Home.jsp" >Home</a></li>
					         <li><a href="UserLogin.jsp">logout</a></li>
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
                              <h3>Welcome <font color="blue"><%=email%></font> </h3>
                              <form action="GetData.jsp" method="post">
                            <table>
                                <tr><th>DATABASE</th>
                                            <td><select name="database" required="" style="width:200px;">
                                                    <option></option>
                                                    
                                                    <%
                                             ResultSet r=Queries.getExecuteQuery("select distinct db from medical");
                                             while(r.next()){
                                              %>
                                     <option value="<%=r.getString("db")%>"><%=r.getString("db")%></option>         
                                              <%
                                             }
                                                        
                                                        %>
                                                    
                                                    
                                                </select></td></tr>
                                <tr><th>RELATION</th><td><select name="relation" required=""style="width:200px;">
                                                        <option></option>
                                                        <option value="and">AND</option>
                                                    <option value="or">OR<option>
                                                        </select></td></tr>
                                
                                <tr><th>ENTER NAME</th><td><input type="text" name="disease" required=""></td></tr>
                                
                                                    <tr><td><input type="submit" value="Get Details"></td>
                                
                                </tr>
                            </table>
                                                        </form>
                         
                              
                            	
				
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
