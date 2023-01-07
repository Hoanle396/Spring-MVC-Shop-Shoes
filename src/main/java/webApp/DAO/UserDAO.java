package webApp.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import webApp.DB.Connect;
import webApp.constants.Helper;
import webApp.models.PagingResponse;
import webApp.models.Users;

public class UserDAO {

	Connect con = new Connect();

	/**
	 * @param email
	 * @param password
	 * @param role
	 * @return
	 */
	public Users Login(String email, String password, String role) {
		String sql = "SELECT * from users where email='" + email + "' and role='" + role + "'";
		System.out.println(sql);
		try {
			ResultSet rs = con.getStmt().executeQuery(sql);
			rs.first();
			if (Helper.checkPassword(password, rs.getString(6))) {
				return new Users(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}
			return null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * @param fullname
	 * @param email
	 * @param password
	 * @return
	 */
	public int Register(String fullname, String email, String password) {
		String sql = "SELECT * from users where email='" + email + "'";

		try {
			try (ResultSet res = con.getStmt().executeQuery(sql)) {
				if (res.next()) {
					return 400;
				}
			}
			password = Helper.encryptPassword(password);
			String sqlRegister = "INSERT INTO `users` (`createAt`, `updateAt`, `email`, `fullname`, `password`, `role`) VALUES (?,?,?,?,?,?)";
			PreparedStatement ps = con.getCon().prepareStatement(sqlRegister);
			ps.setDate(1, new Date(new java.util.Date().getTime()));
			ps.setDate(2, new Date(new java.util.Date().getTime()));
			ps.setString(3, email);
			ps.setString(4, fullname);
			ps.setString(5, password);
			ps.setString(6, "USER");
			ps.executeUpdate();
			return 200;

		} catch (Exception e) {
			System.out.println(e);
			return 500;
		}
	}

	/**
	 * @param page
	 * @param size
	 * @return
	 */
	public PagingResponse<Users> getUsers(int page, int size) {
		List<Users> list = new ArrayList<Users>();
		String countSql = "SELECT COUNT(id) AS count FROM `users`";
		String sql = "SELECT * FROM `users` LIMIT " + (page - 1) * size + "," + size;
		try {
			ResultSet r = con.getStmt().executeQuery(countSql);
			r.next();
			int count = r.getInt("count");
			r.close();
			ResultSet rs = con.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new Users(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
			rs.close();
			return new PagingResponse<Users>(count, list, page);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
