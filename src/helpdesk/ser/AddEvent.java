package helpdesk.ser;

import helpdesk.db.CrudOperation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddEvent
 */
@WebServlet("/AddEvent")
public class AddEvent extends HttpServlet {
	HttpSession hs = null;
	Connection con = null;
	PreparedStatement ps = null, ps1 = null;
	ResultSet rs = null, rs1 = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEvent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		String title = request.getParameter("txttitle");
		String startdate = request.getParameter("txtstartdate");
		String enddate = request.getParameter("txtenddate");
		String regstart = request.getParameter("txtregstart");
		String regend = request.getParameter("txtregend");
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 * 
		 * try { java.util.Date startDate = sdf.parse(startdate); java.util.Date
		 * endDate = sdf.parse(enddate);
		 * 
		 * 
		 * java.util.Date regStart = sdf.parse(regstart);
		 * 
		 * 
		 * java.util.Date regEnd = sdf.parse(regend);
		 * System.out.println(startdate); System.out.println(endDate);
		 * 
		 * } catch (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

		String category = request.getParameter("category");

		String description = request.getParameter("txtdescription");
		String loc = request.getParameter("txtlocation");

		String quer = "insert into event(title,startdate,enddate,category,description,location,regstart,regend) values(?,?,?,?,?,?,?,?)";

		try {
			ps = con.prepareStatement(quer);

			ps.setString(1, title);

			ps.setString(2, startdate);
			ps.setString(3, enddate);
			ps.setString(4, category);

			ps.setString(5,description);
			ps.setString(6, loc);
			ps.setString(7, regstart);
			ps.setString(8, regend);
			int rw = ps.executeUpdate();
			
			if (rw > 0) {

				response.sendRedirect("/UniversityHelpdesk/jsp/admin.jsp");
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
	}

}
