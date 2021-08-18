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
 * Servlet implementation class NewUserCompose
 */
@WebServlet("/NewUserCompose")
public class NewUserCompose extends HttpServlet {
	HttpSession hs = null;
	Connection con = null;
	PreparedStatement ps = null, ps1 = null;
	ResultSet rs = null, rs1 = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewUserCompose() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		con = CrudOperation.createConnection();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String quer2 = "select * from login where userid=?";
		String uid = request.getParameter("userid");

		try {
			
			ps1 = con.prepareStatement(quer2);
			
			ps1.setString(1, uid);
			rs1 = ps1.executeQuery();
			
			if (!rs1.next()) {
				out.println("USER ID DOES NOT EXIST");
			}
		} catch (SQLException se) {
			System.out.println(se);
		}// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		con = CrudOperation.createConnection();
		hs = request.getSession(false);
		String id = (String) hs.getAttribute("info");
		String recid = request.getParameter("recid");
		String sub = request.getParameter("sub");
		String msg = request.getParameter("msg");
		HttpSession hs = null;

		String quer = "insert into message(msgtxt,senderid,recid,date,rstatus,sstatus,subject) values(?,?,?,?,?,?,?)";
		java.util.Date d = new java.util.Date();
		java.sql.Date sd = new java.sql.Date(d.getTime());

		try {
			ps = con.prepareStatement(quer);

			ps.setString(1, msg);
			ps.setString(2, id);
			ps.setString(3, recid);
			ps.setDate(4, sd);
			ps.setString(5, "false");
			ps.setString(6, "false");
			ps.setString(7, sub);
			int rw = ps.executeUpdate();
			if (rw > 0) {
				
				response.sendRedirect("/UniversityHelpdesk/jsp/msgsuccess.jsp");
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
