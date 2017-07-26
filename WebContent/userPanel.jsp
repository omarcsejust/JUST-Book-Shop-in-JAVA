<%@page import="model.User"%>
<%@page import="model.UserDAO"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page import="model.BookDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Panel</title>
</head>
<body>
<%
  ServletContext ctx=getServletContext();
  int userID=0;
  String uName2=(String)ctx.getAttribute("uName2");
  String uName=(String)ctx.getAttribute("uName");
  PrintWriter pw=response.getWriter();
  //int id=Integer.parseInt(uid);
  // pw.println(id);
  //pw.println(uName2);
  //response.sendRedirect("index.jsp");
  if(!uName.equals(uName2) && uName.equals("")){
	  response.sendRedirect("index.jsp");
  } 
  else{
	  userID=(Integer)ctx.getAttribute("uid");
%>
<%@ include file="/header.jsp" %>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="userMenu">
        <ul>
          <li><a href="#">My Profile</a></li>
          <li><a href="#" data-toggle="modal" data-target="#updatePofile">Update Profile</a></li>
          <li><a href="#">Change Password</a></li>
          <li><a href="#" data-toggle="modal" data-target="#addPost">Add Post</a></li>
          <li><a href="logOut.jsp">Logout</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- -------------------------Update User Profile Modal ---------------->
<%
UserDAO userDAO=new UserDAO();
User user=userDAO.getUserByID(userID);
%>
<div id="updatePofile" class="modal fade" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header"><h4>Update Your Profile</h4></div>
	  <div class="modal-body">
		<form method="post" action="UpdateUserServlate">
		
		  <table class="postTable">
			<tr>
	              <td>First Name </td>
	              <td><input type="text" name="fName" value=<%=user.getuFirstName() %>></td>
	            </tr>
	            <tr>
	              <td>Last Name </td>
	              <td><input type="text" name="lName" value=<%=user.getuLastName() %>></td>
	            </tr>
	            <tr>
	              <td>Phone </td>
	              <td><input type="text" name="phn" value=<%=user.getuPhn() %>></td>
	            </tr>
	            <tr>
	              <td>Email </td>
	              <td><input type="text" name="email" value=<%=user.getuEmail() %>></td>
	            </tr>
	            <tr>
	              <td>Department</td>
	              <td><input type="text" name="dept" value=<%=user.getuDept() %>></td>
	            </tr>
	            <tr>
	              <td>Session</td>
	              <td><input type="text" name="session" value=<%=user.getuSession() %>></td>
	            </tr>
	          </table>
			
			<tr>
				<td></td>
				<input type="hidden" name="pass" value=<%=user.getuPassword() %>></input>
		        <input type="hidden" name="uName" value=<%=user.getuName() %>></input>
				<td><input type="submit" value="Update Profile" style="background-color:green;color:white;height:40px;border-radius:8px;"></td>
			</tr>
		  </table>
	  </form>
    </div>
   <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
  </div>
 </div>
</div>

<!-- ----------------------Add New Post Modal-------------------- -->
<div id="addPost" class="modal fade" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header"><h4>Add New Post</h4></div>
	  <div class="modal-body">
		<form method="post" action="AddBookServlet">
		
		  <table class="postTable">
			<tr>
			  <td>Book Name : </td>
			  <td><input type="text" name="bName"></input></td>
			</tr>
			<tr>
			  <td>Author : </td>
			  <td><input type="text" name="bAuthor"></input></td>
			</tr>
			
			<tr>
			  <td>Edition : </td>
			  <td><input type="text" name="bEdition"></td>
			</tr>
		  
			<tr>
			  <td>Price : </td>
			  <td><input type="text" name="bPrice"></td>
			</tr>
			<tr>
			  <td>Contact No. : </td>
			  <td><input type="text" name="phnNum"></td>
			</tr>
			
			<tr>
			<td>Select Category: </td>
			<td>
			
			  <select name="category">
				<option value="engineering">Engineering</option>
				<option value="biology">Biology</option>
				<option value="applied">Applied Science</option>
				
			  </select>
			</td>
		  </tr>
			
			<tr>
				<td></td>
				<input type="hidden" name="u_id" value=""></input>
		        <input type="hidden" name="img" value=""></input>
				<td><input type="submit" value="Add Post" style="background-color:green;color:white;height:40px;border-radius:8px;"></td>
			</tr>
		  </table>
	  </form>
    </div>
   <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
  </div>
 </div>
</div>

<!-- --------------------------Error Message Show -------------------->
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <%
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
  <%
     BookDAO bdao=new BookDAO();
     int test=0,modalNumber=0;
     List<Book> books=bdao.getBooksByUserID(userID);
     for(Book book:books){
    	 test++;
    	 modalNumber++;
  %>
  <% if(test==1){ %>
  <div class="row">
  <div class="col-md-4 myPosts">
  <h4><%=book.getPostDate() %></h4>
  <table style="margin-top:20px;">
    <tr>
      <td>Book Name :</td>
      <td><%=book.getbName() %></td>
    </tr>
    <tr>
      <td>Author Name :</td>
      <td><%=book.getbAuthor() %></td>
    </tr>
     <tr>
      <td>Edition :</td>
      <td><%=book.getbEdition() %></td>
    </tr>
    <tr>
      <td>Category :</td>
      <td><%=book.getbCategory() %></td>
    </tr>
    <tr>
      <td>Price :</td>
      <td><%=book.getbPrice() %></td>
    </tr>
    <tr>
      <td>Contact No. :</td>
      <td><%=book.getPhnNum() %></td>
    </tr>
    <tr>
      <td></td>
      <td><button type=button class="btn btn-success" data-toggle="modal" data-target="#modal2<%=modalNumber %>">Update</button>
      
      <!-- -------------Modal---------- -->
      
 <div id="modal2<%=modalNumber %>" class="modal fade" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header"><h4>Add New Post</h4></div>
	  <div class="modal-body">
		<form method="post" action="UpdateBookServlet">
		
		  <table class="postTable">
			<tr>
			  <td>Book Name : </td>
			  <td><input type="text" name="bName" value=<%=book.getbName() %>></input></td>
			</tr>
			<tr>
			  <td>Author : </td>
			  <td><input type="text" name="bAuthor" value=<%=book.getbAuthor() %>></input></td>
			</tr>
			
			<tr>
			  <td>Edition : </td>
			  <td><input type="text" name="bEdition" value=<%=book.getbEdition() %>></td>
			</tr>
		  
			<tr>
			  <td>Price : </td>
			  <td><input type="text" name="bPrice" value=<%=book.getbPrice() %>></td>
			</tr>
			<tr>
			  <td>Contact No. : </td>
			  <td><input type="text" name="phnNum" value=<%=book.getPhnNum() %>></td>
			</tr>
			
			<tr>
			<td>Select Category: </td>
			<td>
			
			  <select name="category">
				<option value="engineering">Engineering</option>
				<option value="biology">Biology</option>
				<option value="applied">Applied Science</option>
				
			  </select>
			</td>
		  </tr>
			
			<tr>
				<td></td>
				<input type="hidden" name="b_id" value=<%=book.getBid() %>></input>
		        <input type="hidden" name="img" value=""></input>
				<td><input type="submit" value="Update" style="background-color:green;color:white;height:40px;border-radius:8px;"></td>
			</tr>
		  </table>
	  </form>
    </div>
   <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
  </div>
 </div>
</div>
      
      <!-- -----------------Modal--------- -->
      <button type=button class="btn btn-danger">Delete</button>
      </td>
      
    </tr>
  </table>
  </div>
  <%} else if(test==2){ %>
   <div class="col-md-4 myPosts">
   <h4><%=book.getPostDate() %></h4>
  <table style="margin-top:20px;">
    <tr>
      <td>Book Name :</td>
      <td><%=book.getbName() %></td>
    </tr>
    <tr>
      <td>Author Name :</td>
      <td><%=book.getbAuthor() %></td>
    </tr>
     <tr>
      <td>Edition :</td>
      <td><%=book.getbEdition() %></td>
    </tr>
    <tr>
      <td>Category :</td>
      <td><%=book.getbCategory() %></td>
    </tr>
    <tr>
      <td>Price :</td>
      <td><%=book.getbPrice() %></td>
    </tr>
    <tr>
      <td>Contact No. :</td>
      <td><%=book.getPhnNum() %></td>
    </tr>
    
     <tr>
      <td></td>
      <td><button type=button class="btn btn-success" data-toggle="modal" data-target="#modal2<%=modalNumber %>">Update</button>
      
      <!-- -------------Modal---------- -->
      
 <div id="modal2<%=modalNumber %>" class="modal fade" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header"><h4>Add New Post</h4></div>
	  <div class="modal-body">
		<form method="post" action="UpdateBookServlet">
		
		  <table class="postTable">
			<tr>
			  <td>Book Name : </td>
			  <td><input type="text" name="bName" value=<%=book.getbName() %>></input></td>
			</tr>
			<tr>
			  <td>Author : </td>
			  <td><input type="text" name="bAuthor" value=<%=book.getbAuthor() %>></input></td>
			</tr>
			
			<tr>
			  <td>Edition : </td>
			  <td><input type="text" name="bEdition" value=<%=book.getbEdition() %>></td>
			</tr>
		  
			<tr>
			  <td>Price : </td>
			  <td><input type="text" name="bPrice" value=<%=book.getbPrice() %>></td>
			</tr>
			<tr>
			  <td>Contact No. : </td>
			  <td><input type="text" name="phnNum" value=<%=book.getPhnNum() %>></td>
			</tr>
			
			<tr>
			<td>Select Category: </td>
			<td>
			
			  <select name="category">
				<option value="engineering">Engineering</option>
				<option value="biology">Biology</option>
				<option value="applied">Applied Science</option>
				
			  </select>
			</td>
		  </tr>
			
			<tr>
				<td></td>
				<input type="hidden" name="b_id" value=<%=book.getBid() %>></input>
		        <input type="hidden" name="img" value=""></input>
				<td><input type="submit" value="Update" style="background-color:green;color:white;height:40px;border-radius:8px;"></td>
			</tr>
		  </table>
	  </form>
    </div>
   <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
  </div>
 </div>
</div>
      
      <!-- -----------------Modal--------- -->
      <button type=button class="btn btn-danger">Delete</button>
      </td>
      
    </tr>
    
  </table>
  </div>
  <%}else if(test==3) { %>
  <div class="col-md-4 myPosts">
  <h4><%=book.getPostDate() %></h4>
  <table style="margin-top:20px;">
    <tr>
      <td>Book Name :</td>
      <td><%=book.getbName() %></td>
    </tr>
    <tr>
      <td>Author Name :</td>
      <td><%=book.getbAuthor() %></td>
    </tr>
     <tr>
      <td>Edition :</td>
      <td><%=book.getbEdition() %></td>
    </tr>
    <tr>
      <td>Category :</td>
      <td><%=book.getbCategory() %></td>
    </tr>
    <tr>
      <td>Price :</td>
      <td><%=book.getbPrice() %></td>
    </tr>
    <tr>
      <td>Contact No. :</td>
      <td><%=book.getPhnNum() %></td>
    </tr>
    
     <tr>
      <td></td>
      <td><button type=button class="btn btn-success" data-toggle="modal" data-target="#modal2<%=modalNumber %>">Update</button>
      
      <!-- -------------Modal---------- -->
      
 <div id="modal2<%=modalNumber %>" class="modal fade" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header"><h4>Add New Post</h4></div>
	  <div class="modal-body">
		<form method="post" action="UpdateBookServlet">
		
		  <table class="postTable">
			<tr>
			  <td>Book Name : </td>
			  <td><input type="text" name="bName" value=<%=book.getbName() %>></input></td>
			</tr>
			<tr>
			  <td>Author : </td>
			  <td><input type="text" name="bAuthor" value=<%=book.getbAuthor() %>></input></td>
			</tr>
			
			<tr>
			  <td>Edition : </td>
			  <td><input type="text" name="bEdition" value=<%=book.getbEdition() %>></td>
			</tr>
		  
			<tr>
			  <td>Price : </td>
			  <td><input type="text" name="bPrice" value=<%=book.getbPrice() %>></td>
			</tr>
			<tr>
			  <td>Contact No. : </td>
			  <td><input type="text" name="phnNum" value=<%=book.getPhnNum() %>></td>
			</tr>
			
			<tr>
			<td>Select Category: </td>
			<td>
			
			  <select name="category">
				<option value="engineering">Engineering</option>
				<option value="biology">Biology</option>
				<option value="applied">Applied Science</option>
				
			  </select>
			</td>
		  </tr>
			
			<tr>
				<td></td>
				<input type="hidden" name="b_id" value=<%=book.getBid() %>></input>
		        <input type="hidden" name="img" value=""></input>
				<td><input type="submit" value="Update" style="background-color:green;color:white;height:40px;border-radius:8px;"></td>
			</tr>
		  </table>
	  </form>
    </div>
   <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
  </div>
 </div>
</div>
      
      <!-- -----------------Modal--------- -->
      <button type=button class="btn btn-danger">Delete</button>
      </td>
      
    </tr>
    
  </table>
  </div>
  </div>
  <%test=0;} }%>
  </div>
  
  
<%} %>
</body>
</html>