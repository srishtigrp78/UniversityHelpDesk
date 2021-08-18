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

import helpdesk.db.CrudOperation;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null,ps1=null;
	ResultSet rs=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		String name=request.getParameter("fullname");
		String userid=request.getParameter("userid");
		String email=request.getParameter("id");
		String password=request.getParameter("userpass");
		String address=request.getParameter("address");
	
		long phoneno=Long.parseLong(request.getParameter("contact"));
		
		con=CrudOperation.createConnection();
		String str1="insert into signup values(?,?,?,?)";
		String str2="insert into login values(?,?,?)";
		try
		{
			ps=con.prepareStatement(str1);
			ps1=con.prepareStatement(str2);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setLong(3, phoneno);
			ps.setString(4, address);
			ps1.setString(1,userid);
			ps1.setString(2,password);
			ps1.setString(3,"newuser");
			int rw=ps.executeUpdate();
			int rw1=ps1.executeUpdate();
			if(rw>0 && rw1>0)
			{
				response.sendRedirect("/UniversityHelpdesk/jsp/signupsuccess.jsp");
			}
			else
			{
				response.sendRedirect("/UniversityHelpdesk/jsp/signup.jsp");
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally{
			try{
				if(ps!=null)
				{
					ps.close();
				}
			}
			catch(SQLException se){
			System.out.println(se);	
			}
		}
		
		// TODO Auto-generated method stub
	}

	}


