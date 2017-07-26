<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>

<%@ include file="/header.jsp" %>

<div class="container">
  <div class="row">
    <div class="regMsg">Please fill all the felds to have facilities of this group.</div>
  </div>
</div>
<!-- --------------------------Error Message Show -------------------->
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <%
        ServletContext ctx=getServletContext();
		String getErrorMsg=(String)ctx.getAttribute("errorMsg");
        String getSuccessMsg=(String)ctx.getAttribute("successMsg");
        
		if(getErrorMsg!=null){
		%>
		<h4 style="color:red;"><%=getErrorMsg %> </h4>
		<% ctx.setAttribute("errorMsg", "");} %>
		
		<% if(getSuccessMsg!=null){ %>
		<h4 style="color:green;"><%=getSuccessMsg %> </h4>
		<% ctx.setAttribute("successMsg", ""); } %>
    </div>
  </div>
</div>
<!-- --------------------------Error Message Show ---------------------->
	
	<div class="container">
	  <div class="row">
	      <form action="UserRegServlet" method="post">
	        <div class="col-md-6 regForm">
	          <table>
	            <tr>
	              <td>First Name </td>
	              <td><input type="text" name="fName"></td>
	            </tr>
	            <tr>
	              <td>Last Name </td>
	              <td><input type="text" name="lName"></td>
	            </tr>
	            <tr>
	              <td>Phone </td>
	              <td><input type="text" name="phn"></td>
	            </tr>
	            <tr>
	              <td>Email </td>
	              <td><input type="text" name="email"></td>
	            </tr>
	            <tr>
	              <td>Department</td>
	              <td><input type="text" name="dept"></td>
	            </tr>
	          </table>
	        </div>
	        <div class="col-md-6 regForm">
	           <table>
	            <tr>
	              <td>Session</td>
	              <td><input type="text" name="session"></td>
	            </tr>
	            <tr>
	              <td>User Name</td>
	              <td><input type="text" name="uName"></td>
	            </tr>
	            <tr>
	              <td>Password</td>
	              <td><input type="password" name="password"></td>
	            </tr>
	            <tr>
	              <td>Confirm Password</td>
	              <td><input type="password" name="conPassword"></td>
	            </tr>
	            <tr>
	              <td></td>
	              <td><input type="submit" name="reg" value="Submit" style="background-color:green;"></td>
	            </tr>
	           </table>
	        </div>
	      </form>
	  </div>
	</div>
</body>
</html>