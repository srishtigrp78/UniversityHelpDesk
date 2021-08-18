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
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	HttpSession hs = null;
	Connection con = null;
	PreparedStatement ps = null, ps1 = null;
	ResultSet rs = null, rs1 = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
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
		con = CrudOperation.createConnection();
		hs = request.getSession(false);
		String name=request.getParameter("txtfullname");
		String dept=request.getParameter("txtprof");
		String email=request.getParameter("txtid");
		String address=request.getParameter("txtaddress");
		long phoneno=Long.parseLong(request.getParameter("txtcontact"));
		String uid=request.getParameter("txtuserid");
		String pass=request.getParameter("txtpassword");	
		String quer = "insert into student(name,email,phoneno,branch,address,userid) values(?,?,?,?,?,?)";
		String str="insert into login values(?,?,?)";
		try {
			ps = con.prepareStatement(quer);
            ps1=con.prepareStatement(str);
			ps.setString(1, name);
			ps.setLong(3, phoneno);
			ps.setString(4, dept);
			ps.setString(2, email);
			ps.setString(5, address);
			ps.setString(6, uid);
			ps1.setString(1, uid);
			ps1.setString(2, pass);
			ps1.setString(3, "student");
			int rw = ps.executeUpdate();
			int rw1=ps1.executeUpdate();
			if (rw > 0 && rw1>0) {
				
				response.sendRedirect("/UniversityHelpdesk/jsp/admin.jsp");
			}
		} catch (SQLException se) {
			System.out.println(se);

		} finally {
			try {
				if (ps != null && ps1 !=null) {
					ps.close();
					ps1.close();
				}
			} catch (SQLException se) {
				System.out.println(se);
			}
			// TODO Auto-generated method stub
		}// TODO Auto-generated method stub
	}

}
