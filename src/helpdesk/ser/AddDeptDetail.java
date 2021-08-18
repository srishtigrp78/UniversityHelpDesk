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
import javax.swing.JOptionPane;

/**
 * Servlet implementation class AddDeptDetail
 */
@WebServlet("/AddDeptDetail")
public class AddDeptDetail extends HttpServlet {
	HttpSession hs = null;
	Connection con = null;
	PreparedStatement ps = null, ps1 = null;
	ResultSet rs = null, rs1 = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDeptDetail() {
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
		String id = (String) hs.getAttribute("info");
		String name = request.getParameter("txtfullname");
		String email = request.getParameter("txtid");
		String code = request.getParameter("txtcode");
		String phoneno=request.getParameter("txtcontact");
		long phno=Long.parseLong(phoneno);
		

		String quer = "insert into department(deptname,phoneno,id,emailid) values(?,?,?,?)";
		String str="insert into login values(?,?,?)";
		try {
			ps = con.prepareStatement(quer);
            ps1=con.prepareStatement(str);
			ps.setString(1, name);
			ps.setLong(2, phno);
			ps.setString(3, code);
			ps.setString(4, email);
			ps1.setString(1, code);
			ps1.setLong(2, phno);
			ps1.setString(3, "staff");
			int rw = ps.executeUpdate();
			int rw1=ps1.executeUpdate();
			if (rw > 0 && rw1>0) {
				//JOptionPane.showMessageDialog(null,"DEPARTMENT ADDED SUCCESSFULLY");
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
