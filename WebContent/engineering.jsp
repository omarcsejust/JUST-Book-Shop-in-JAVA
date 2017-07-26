<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page import="model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Engineering</title>
</head>
<body>
 <%@ include file="/header.jsp" %>
	
<div class="container">
  <%
     BookDAO bDao=new BookDAO();
     int test=0,modalNumber=0;
    List<Book> books=bDao.getBooksByCategory("engineering");
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
      <td></td>
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
      <td></td>
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
      <td></td>
    </tr>
    
  </table>
  </div>
  </div>
  <%test=0;} }%>
  </div>
	
</body>
</html>