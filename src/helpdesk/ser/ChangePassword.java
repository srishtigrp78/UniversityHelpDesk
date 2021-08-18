package helpdesk.ser;

import java.io.IOException;

import java.io.PrintWriter;
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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	Connection con=null;
	ResultSet rs=null,r=null;
	PreparedStatement ps=null,ps1=null,ps2=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		HttpSession hs=request.getSession(false);
		 String uid=(String)hs.getAttribute("info");
		
		 String p="";
		 if(hs.isNew() || uid==null)
				  	 {
	 	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");
		 	 }
			 else
			 {
		String p1=request.getParameter("userpass");
		 String s="select * from login where userid=?";
		 try
		 {
			 con=CrudOperation.createConnection();
		    	ps2=con.prepareStatement(s);
		    	ps2.setString(1, uid);
		    	r=ps2.executeQuery();
		     if(r.next())
		     {
		    	 p=r.getString("userpass");
		    	 if(!p.equals(p1))
		    	 out.println("OLD PASSWORD NOT MATCHED");
		     }
		 }
		 catch(SQLException se)
		 {
			 System.out.println(se);
		 }
		 
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String p1=request.getParameter("txtpassword1");
		    String p2=request.getParameter("txtpassword2");
		    String p3=request.getParameter("txtpassword3");
		    HttpSession hs=request.getSession(false);
			 String uid=(String)hs.getAttribute("info");
		    
		    try
		    {
		    	con=CrudOperation.createConnection();
		    	String str="update login set userpass=? where userid=?";
		    						ps1=con.prepareStatement(str);
		    						ps1.setString(1, p2);
		    						ps1.setString(2, uid);
		    						int r=ps1.executeUpdate();
		    						if(r>0)
		    						{
		    							response.sendRedirect("/UniversityHelpdesk/jsp/passwordsuccess.jsp");
		    						}
		    			}
		    catch(SQLException se)
		    {
		    	System.out.println(se);
		    }	}

}
