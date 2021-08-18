package helpdesk.ser;

import helpdesk.db.CrudOperation;

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

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	HttpSession hs = null;
	Connection con = null;
	PreparedStatement ps = null, ps1 = null;
	ResultSet rs = null, rs1 = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con = CrudOperation.createConnection();
		hs = request.getSession(false);
		String id = (String) hs.getAttribute("info");
		String sub = request.getParameter("sub");
		String msg = request.getParameter("feedback");
		
		HttpSession hs = null;

		String quer = "insert into feedback(subject,message,date,status) values(?,?,?,?)";
		java.util.Date d = new java.util.Date();
		java.sql.Date sd = new java.sql.Date(d.getTime());

		try {
			ps = con.prepareStatement(quer);

			ps.setString(1, sub);
			ps.setString(2, msg);
			ps.setDate(3, sd);
			ps.setString(4,"false");
			int rw = ps.executeUpdate();
			if (rw > 0) {
				
				response.sendRedirect("/UniversityHelpdesk/jsp/feedbacksuccess.jsp");
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
			
		}

	}}
