package helpdesk.ser;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helpdesk.db.CrudOperation;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	Connection con=null;
	ResultSet rs=null;
	PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=null;
		
	     String ui=request.getParameter("txtuserid");
	     String upass=request.getParameter("txtpassword");
	     String strsql="select * from login where userid=? and userpass=?";
	       try
	       {
	    	 con=CrudOperation.createConnection();
	    	 ps=con.prepareStatement(strsql);
	    	 ps.setString(1,ui);
	    	 ps.setString(2,upass);
	    	 rs=ps.executeQuery();
	    	  if(rs.next()) 
	    	  {
	    		  String utype=rs.getString("usertype");
	    		  if(utype.equals("admin"))
	    		  {
	    		  hs=request.getSession();
	    		  hs.setAttribute("info",ui);
	    	response.sendRedirect("/UniversityHelpdesk/jsp/admin.jsp");
	    		  }
	    		  else if(utype.equals("faculty")){
	    			  hs=request.getSession();
		    		  hs.setAttribute("info",ui);
		    	response.sendRedirect("/UniversityHelpdesk/jsp/faculty.jsp");
	    		  }
	    		  else if(utype.equals("student")){
	    			  hs=request.getSession();
		    		  hs.setAttribute("info",ui);
		    	response.sendRedirect("/UniversityHelpdesk/jsp/student.jsp");
	    		  }
	    		  else if(utype.equals("staff")){
	    			  hs=request.getSession();
		    		  hs.setAttribute("info",ui);
		    	response.sendRedirect("/UniversityHelpdesk/jsp/staff.jsp");
	    		  }
	    		  else if(utype.equals("newuser")){
	    			  hs=request.getSession();
		    		  hs.setAttribute("info",ui);
		    	response.sendRedirect("/UniversityHelpdesk/jsp/newuser.jsp");
	    		  }
	    	  }
	    	  else
	    	  {
	    		  response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp");  
	    	  }
		    }
	        catch(SQLException se)
	        {
	    	 System.out.println(se);
	        }	
	       }
	}


