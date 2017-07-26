package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.User;
import model.UserDAO;

/**
 * Servlet implementation class UserRegServlet
 */
@WebServlet("/UserRegServlet")
public class UserRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegServlet() {
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
		String fName,lName,phn,email,dept,session,uName,password,conPassword;
		ServletContext ctx=getServletContext();
		int test=0;
		fName=request.getParameter("fName");
		lName=request.getParameter("lName");
		phn=request.getParameter("phn");
		email=request.getParameter("email");
		dept=request.getParameter("dept");
		session=request.getParameter("session");
		
		uName=request.getParameter("uName");
		password=request.getParameter("password");
		conPassword=request.getParameter("conPassword");
		
		if(fName.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your First Name!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(lName.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Last Name!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(phn.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Phone Number!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(email.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Email!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(dept.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Dept. Name!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(session.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Session!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(uName.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your User Name!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(password.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Input Your Password!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(conPassword.isEmpty()){
			test++;
			ctx.setAttribute("errorMsg", "Please Confirm Your Password!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(password.length()<6){
			test++;
			ctx.setAttribute("errorMsg", "Your password should be minimum six character!!!!");
			response.sendRedirect("signUp.jsp");
		}
		else if(!password.equals(conPassword)){
			test++;
			ctx.setAttribute("errorMsg", "Your Password is not matching!!!!");
			response.sendRedirect("signUp.jsp");
		}
		
		if(test==0){
			UserDAO udao=new UserDAO();
			User user=new User(fName, lName, phn, email, dept, session, uName, password);
			try {
				udao.addUser(user);
				ctx.setAttribute("successMsg", "Registration Successfully.");
				response.sendRedirect("signUp.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		doGet(request, response);
	}

}
