<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<link href="css/bootstrap.css" rel="stylesheet"/>
<link href="css/custom.css" rel="stylesheet"/>
<link href="css/animate.css" rel="stylesheet"/>
</head>
<body>
 <!----------  Banner ------>
	 <div class="container">
     <div class="page-header no-paddingBanner no-marginBanner">
	    <img src="images/Old-Book-Website-Banner-.jpg" class="img-responsive" style="width:100%;">
	 </div>
	 </div>
	 
	 <!------    Menu --------->
	<div class="container">
	 <nav class="navbar navbar-inverse">
      <div class="container">
         <button type="button" class="navbar-toggle"
		 data-toggle="collapse"
		 data-target=".navbar-collapse">
		   <span class="sr-only">Toggle navigation</span>
		   <span class="icon-bar"></span>
		   <span class="icon-bar"></span>
		   <span class="icon-bar"></span>
		</button>
		
		<a class="navbar-brand" href="#"></a>

		<div class="navbar-collapse collapse">

		  <ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="index.jsp">Home</a></li>
			<li><a href="#">About Us</a></li>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Category <b class="caret"></b> </a>
			  <ul class="dropdown-menu">
				<li><a href="engineering.jsp">Engineering</a></li>
				<li class="divider"></li>
				<li><a href="biology.jsp">Biology</a></li>
				<li class="divider"></li>
				<li><a href="applied.jsp">Applied Science</a></li>
			  </ul>
			</li>
			
			<li><a href="userPanel.jsp">My Account</a></li>
			<li><a href="signUp.jsp">Sign Up</a></li>
			<li><a href="index.jsp">Sign In &nbsp &nbsp</a></li>
		  </ul>
		  
		</div>
		
      </div>
     </nav>
	</div>
<script src="js/min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>