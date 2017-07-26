package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.BookDAO;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String getBookName,getAuthorName,getBookEdition,getBookCategory,getPhnNum,postDate,bookPrice;
		int userID,test=0;
		float getBookPrice=0;
		Date date=new Date();
		int currentDate = date.getDate();
		String currentMonth=Integer.toString(date.getMonth());
		String currentYear=Integer.toString(date.getYear());
		postDate=Integer.toString(currentDate);
		postDate=postDate+"-"+currentMonth+"-"+currentYear;
		
		ServletContext ctx=getServletContext();
		
		getBookName=request.getParameter("bName");
		getAuthorName=request.getParameter("bAuthor");
		getBookEdition=request.getParameter("bEdition");
		bookPrice=request.getParameter("bPrice");
		getBookCategory=request.getParameter("category");
		getPhnNum=request.getParameter("phnNum");
		
		userID=(Integer)ctx.getAttribute("uid");
		
		if(getBookName.isEmpty()){
			ctx.setAttribute("errorMsg", "Please Input Book Name!!!!");
			test++;
			response.sendRedirect("userPanel.jsp");
		}
		else if(getAuthorName.isEmpty()){
			ctx.setAttribute("errorMsg", "Please Input Author Name!!!!");
			test++;
			response.sendRedirect("userPanel.jsp");
		}
		else if(getBookEdition.isEmpty()){
			ctx.setAttribute("errorMsg", "Please Input Book Edition!!!!");
			test++;
			response.sendRedirect("userPanel.jsp");
		}
		else if(getPhnNum.isEmpty()){
			ctx.setAttribute("errorMsg", "Please Input Phone Number!!!!");
			test++;
			response.sendRedirect("userPanel.jsp");
		}
		else if(bookPrice.isEmpty()){
			ctx.setAttribute("errorMsg", "Please Input Book Price!!!!");
			test++;
			//ctx.setAttribute("bid", getBookID);
			response.sendRedirect("userPanel.jsp");
		}
		
		//getBookPrice=Float.parseFloat(bookPrice);
		if(bookPrice.isEmpty()){
		}
		else{
			getBookPrice=Float.parseFloat(bookPrice);
		}
		
		
		if(test==0){
			BookDAO bdao=new BookDAO();
			Book book=new Book(getBookName, getAuthorName, getBookEdition, 220, getBookCategory, postDate, getPhnNum, userID);
			try {
				bdao.addBook(book);
				ctx.setAttribute("successMsg", "You Posted Successfully.");
				response.sendRedirect("userPanel.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		doGet(request, response);
	}

}
