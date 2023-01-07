package webApp.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import webApp.DB.Connect;
import webApp.DTO.Feedback;
import webApp.models.Count;
import webApp.models.FeedBack;
import webApp.models.PagingResponse;

public class AdminDAO {

	public Count countAll() {
		String sql = "select t1.users,t2.products,t3.orders,t4.feedback from "
				+ "(SELECT count(1) as users FROM users) as t1," + "(SELECT count(1) as products FROM products) as t2,"
				+ "(SELECT count(1) as orders FROM orders) as t3,"
				+ "(SELECT count(1) as feedback FROM feedback) as t4";
		try {
			ResultSet rs = new Connect().getStmt().executeQuery(sql);
			rs.next();
			return new Count(rs.getInt("products"), rs.getInt("users"), rs.getInt("orders"), rs.getInt("feedback"));
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public int newFeedback(Feedback feedback) {
		String sql = "INSERT INTO `feedback` (`createAt`, `updateAt`, `name`, `email`, `subject`, `message`) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps = new Connect().getCon().prepareStatement(sql);
			ps.setDate(1, new Date(new java.util.Date().getTime()));
			ps.setDate(2, new Date(new java.util.Date().getTime()));
			ps.setString(3, feedback.getName());
			ps.setString(4, feedback.getEmail());
			ps.setString(5, feedback.getSubject());
			ps.setString(6, feedback.getMessage());
			ps.execute();
			return 200;
		} catch (Exception e) {
			System.out.println(e);
			return 500;
		}
	}

	public PagingResponse<FeedBack> getFeedback(int page, int size) {
		List<FeedBack> list = new ArrayList<FeedBack>();
		String countSql = "SELECT COUNT(id) AS count FROM `feedback`";
		String sql = "SELECT * FROM `feedback` LIMIT " + (page - 1) * size + "," + size;
		try {
			ResultSet r = new Connect().getStmt().executeQuery(countSql);
			r.next();
			int count = r.getInt("count");
			r.close();
			ResultSet rs = new Connect().getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new FeedBack(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
			rs.close();
			return new PagingResponse<FeedBack>(count, list, page);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
