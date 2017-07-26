package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.UserDAO;

/**
 * Servlet implementation class UpdateUserServlate
 */
@WebServlet("/UpdateUserServlate")
public class UpdateUserServlate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fName,lName,phn,email,dept,session,uName,pass;
		ServletContext ctx=getServletContext();
		int test=0,userID=0;
		fName=request.getParameter("fName");
		lName=request.getParameter("lName");
		phn=request.getParameter("phn");
		email=request.getParameter("email");
		dept=request.getParameter("dept");
		session=request.getParameter("session");
		
		uName=request.getParameter("uName");
		pass=request.getParameter("pass");
		userID=(Integer)ctx.getAttribute("uid");
		
		if(fName.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your First Name!!!!");
			response.sendRedirect("userPanel.jsp");
		}
		else if(lName.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Last Name!!!!");
			response.sendRedirect("userPanel.jsp");
		}
		else if(phn.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Phone Number!!!!");
			response.sendRedirect("userPanel.jsp");
		}
		else if(email.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Email!!!!");
			response.sendRedirect("userPanel.jsp");
		}
		else if(dept.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Dept. Name!!!!");
			response.sendRedirect("userPanel.jsp");
		}
		else if(session.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Session!!!!");
			response.sendRedirect("userPanel.jsp");
		}
		
		if(test==0){
			UserDAO uDao=new UserDAO();
			User user=new User(userID, fName, lName, phn, email, dept, session, uName, pass);
			try {
				uDao.updateUser(user);
				ctx.setAttribute("successMsg", "Updated Successfully.");
				response.sendRedirect("userPanel.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
