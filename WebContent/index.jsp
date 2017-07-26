<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<%
ServletContext context=getServletContext();
String uName,uName2;
//context.setAttribute("uid", 0);
uName=(String)context.getAttribute("uName");
uName2=(String)context.getAttribute("uName2"); 
if(uName!=null){
}
else{
	context.setAttribute("uid", 0);
	context.setAttribute("uName", "");
	context.setAttribute("uName2", " ");
	context.setAttribute("errorMsg", "");
	context.setAttribute("successMsg", "");
	context.setAttribute("bid", "");
}
%>

<%@ include file="/header.jsp" %>

<!-- -----------Carousel--------- -->
<div class="container">
  <div class="row">
    <div class="col-md-9">
    
    <div id="mycarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
  
    <ol class="carousel-indicators">
	  <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
	  <li data-target="#mycarousel" data-slide-to="1"></li>
	  <li data-target="#mycarousel" data-slide-to="2"></li>
	  <li data-target="#mycarousel" data-slide-to="3"></li>
	  <li data-target="#mycarousel" data-slide-to="4"></li>
	</ol>
	
	<div class="carousel-inner">
	  
	  <!--Image 1-->
	  <div class="item active">
	    <img src="carousel/img1.jpg">
		<!-- Image Caption
		<div class="carousel-caption">
		  <h2>Theme 1</h2>
		</div>  ---->
	  </div>
	  
	  <!--Image 2-->
	  <div class="item">
	    <img src="carousel/img2.jpg">
	  </div>
	  
	  <!--Image 3-->
	  <div class="item">
	    <img src="carousel/img3.jpg">
	  </div>
	  
	  <!--Image 4-->
	  <div class="item">
	    <img src="carousel/img4.jpg">
	  </div>
	  
	  <!--Image 5-->
	  <div class="item">
	    <img src="carousel/img5.jpg">
	  </div>
	  
	</div>
	
	  <a class="left carousel-control" href="#mycarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#mycarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>
	
  </div>
    
    
    </div>
    
    <div class="col-md-3">
      <div class="login">
        <div class="loginMsg">User Login</div>
        <form action="LoginServlet" method="post">
          <input type="text" name="userName" placeholder="User Name">
          <input type="password" name="password" placeholder="Password">
          <input type="submit" value="Login" style="background-color:green;border-radius:5px solid green;">
        </form>
      </div>
    </div>
    
  </div>
  
  <div class="row">
    <div class="col-md-4">
      <div class="welcomeMsgBox">
	      <a href="engineering.jsp" class="thumbnail">
	        <img alt="" src="carousel/img4.jpg" height="160px">
	      </a>
	      <h3>Engineering Books</h3>
	      <p class="welcomeMsgText">
	Welcome to you in this site.In this site you can search for various types of category books to buy,and make a post to sell . If you want to search for Engineering books
	to buy or if you are a Registered user of this site, you can make a post in this Engineering section to sell.
	If you are searching Engineering books to buy, Please select Engineering option from Catrgory, located in Main Menu.If you are a Registered user of this site, then while making a post to sell your book belongs to Engineering category, select Engineering option.
	      </p>
     </div>
    </div>
    
     <div class="col-md-4">
      <div class="welcomeMsgBox">
	      <a href="biology.jsp" class="thumbnail">
	        <img alt="" src="carousel/img3.jpg" height="160px">
	      </a>
	      <h3>Biology Books</h3>
	      <p class="welcomeMsgText">
Welcome to you in this site.In this site you can search for various types of category books to buy,and make a post to sell. If you want to search for Biological books
to buy or if you are a Registered user of this site, you can make a post in this Biological section to sell.
If you are searching Biological books to buy, Please select Biological option from Catrgory, located in Main Menu.If you are a Registered user of this site, then while making a post to sell your book belongs to Biological category, select Biological option.    
	      </p>
     </div>
    </div>
    
     <div class="col-md-4">
      <div class="welcomeMsgBox">
	      <a href="applied.jsp" class="thumbnail">
	        <img alt="" src="images/appliedScience.jpg" height="160px">
	      </a>
	      <h3>Applied Science Books</h3>
	      <p class="welcomeMsgText">
	In this site you can search for various types of category books to buy,and make a post to sell. If you want to search for Applied Science books to buy or if you are a Registered user of this site, you can make a post in this Applied Science section to sell. If you are searching Applied Science books to buy, Please select Applied Science option from Catrgory, located in Main Menu.If you are a Registered
    user of this site, then while making a post to sell your book belongs to Applied Science category, select Applied Science option.    
	      </p>
     </div>
    </div>
  </div>
  
</div>

<%@ include file="/footer.jsp" %>
</body>
</html>