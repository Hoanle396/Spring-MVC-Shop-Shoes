package webApp.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import webApp.DB.Connect;
import webApp.models.Orders;
import webApp.models.PagingResponse;

public class OrderDAO {
	Connect con = new Connect();

	public int newOrder(String code, Long userId, int price, int voucherId) {
		String sql = "INSERT INTO `orders` (`createAt`, `updateAt`, `code`, `userId`, `price`, `voucherId`) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.getCon().prepareStatement(sql);
			ps.setDate(1, new Date(new java.util.Date().getTime()));
			ps.setDate(2, new Date(new java.util.Date().getTime()));
			ps.setString(3, code);
			ps.setLong(4, userId);
			ps.setInt(5, price);
			ps.setInt(6, voucherId);
			ps.execute();
			return 200;
		} catch (Exception e) {
			System.out.println(e);
			return 500;
		}
	}

	public void saveDetail(Long productId, String code) {
		String sql = "INSERT INTO `orderdetail` (`createAt`, `updateAt`, `productId`, `code`) VALUES ( ?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.getCon().prepareStatement(sql);
			ps.setDate(1, new Date(new java.util.Date().getTime()));
			ps.setDate(2, new Date(new java.util.Date().getTime()));
			ps.setLong(3, productId);
			ps.setString(4, code);
			ps.execute();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public PagingResponse<Orders> getOrder(int page, int size) {
		List<Orders> list = new ArrayList<Orders>();
		String countSql = "SELECT COUNT(id) AS count FROM `orders`";
		String sql = "SELECT `orders`.`id`,`orders`.`createAt`,`orders`.`updateAt`,`orders`.`code`,"
				+ "`users`.`fullname` ,`products`.`name` ,`products`.`price`, `products`.`currency`"
				+ "FROM `orders` INNER JOIN `users` ON `orders`.`userId`=`users`.`id`"
				+ "INNER JOIN `orderdetail` ON `orders`.`code`=`orderdetail`.`code`"
				+ "INNER JOIN `products` ON `products`.`id`=`orderdetail`.`productId` LIMIT " + (page - 1) * size + "," + size;
		try {
			ResultSet r = con.getStmt().executeQuery(countSql);
			r.next();
			int count = r.getInt("count");
			r.close();
			ResultSet rs = con.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new Orders(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8)));
			}
			rs.close();
			return new PagingResponse<Orders>(count, list, page);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
