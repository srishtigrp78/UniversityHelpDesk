package helpdesk.ser;

import helpdesk.db.CrudOperation;

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

/**
 * Servlet implementation class EventRegistration
 */
@WebServlet("/EventRegistration")
public class EventRegistration extends HttpServlet {
	Connection con = null;
	PreparedStatement ps = null, ps1 = null;
	ResultSet rs = null, rs1 = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventRegistration() {
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
		HttpSession hs=null,hs1=null;
		hs=request.getSession(false); 
		String title=(String)hs.getAttribute("title");	
		hs1=request.getSession(false); 
		String userid=(String)hs1.getAttribute("info");	
		con = CrudOperation.createConnection();
		String name=request.getParameter("fullname");
		String email=request.getParameter("id");
		String address=request.getParameter("address");
		long phoneno=Long.parseLong(request.getParameter("contact"));
		
		String quer = "insert into eventregistration(userid,name,phoneno,email,title,address) values(?,?,?,?,?,?)";
		
		try {
			ps = con.prepareStatement(quer);
           
			ps.setString(2, name);
			ps.setLong(3, phoneno);
			ps.setString(5,title);
			ps.setString(4, email);
			ps.setString(6, address);
			ps.setString(1, userid);
		
			int rw = ps.executeUpdate();
			
			if (rw > 0) {
				
				response.sendRedirect("/UniversityHelpdesk/jsp/eventRegSuccess.jsp");
			}
		} catch (SQLException se) {
			System.out.println(se);

		} finally {
			try {
				if (ps != null) {
					ps.close();
					
				}
			} catch (SQLException se) {
				System.out.println(se);
			}
			// TODO Auto-generated method stub
		}// TODO Auto-generated method stub
		}

}
