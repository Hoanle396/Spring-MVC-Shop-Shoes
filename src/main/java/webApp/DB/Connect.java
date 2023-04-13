package webApp.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connect {

	private Connection con;
	private Statement stmt;

	public Connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.con = DriverManager.getConnection("jdbc:mysql://db:3306/java-web", "root", "");
			this.stmt = con.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public Connection getCon() {
		return con;
	}

	public Statement getStmt() {
		return stmt;
	}

	public static void main(String[] args) {
		new Connect();
	}
}
