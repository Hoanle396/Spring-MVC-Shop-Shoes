package webApp.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import webApp.DB.Connect;
import webApp.models.Category;

public class CategoryDAO {
	Connect con = new Connect();

	/**
	 * @return
	 */
	public List<Category> AllCategory() {
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT * FROM `category`";
		try {
			ResultSet rs = con.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new Category(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5)));
			}
			return list;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * @param name
	 * @param description
	 * @return
	 */
	public int newCategory(String name, String description) {
		String sql = "INSERT INTO `category` (`createAt`, `updateAt`, `name`, `description`) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.getCon().prepareStatement(sql);
			ps.setDate(1, new Date(new java.util.Date().getTime()));
			ps.setDate(2, new Date(new java.util.Date().getTime()));
			ps.setString(3, name);
			ps.setString(4, description);
			ps.execute();
			return 200;
		} catch (Exception e) {
			System.out.println(e);
			return 500;
		}
	}

	/**
	 * @param id
	 * @return
	 */
	public int deleteCategory(Long id) {

		String sql = "SELECT * from category where id='" + id + "'";
		try {
			try (ResultSet res = con.getStmt().executeQuery(sql)) {
				if (res.next()) {
					sql = "DELETE FROM `category` WHERE `category`.`id` = " + id;
					PreparedStatement ps = con.getCon().prepareStatement(sql);
					ps.executeUpdate();
					return 200;
				}
				return 400;
			}
		} catch (Exception e) {
			System.out.println(e);
			return 500;
		}
	}
}
