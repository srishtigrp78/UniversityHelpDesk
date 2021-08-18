package helpdesk.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CrudOperation {
	private static Connection con=null;
	private static ResultSet rs=null;
	private static PreparedStatement ps=null;
	public static Connection createConnection()
	    {
		    try
		    {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/helpdesk","root","root");
		    }
		    catch(ClassNotFoundException|SQLException cse)
		    {
		    	System.out.println(cse);
		    }
		    return con;
	    }
}
