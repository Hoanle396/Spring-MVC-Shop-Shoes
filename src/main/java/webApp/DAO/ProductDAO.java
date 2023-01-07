package webApp.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import webApp.DB.Connect;
import webApp.DTO.ProductDto;
import webApp.models.PagingResponse;
import webApp.models.Products;

public class ProductDAO {

	Connect con = new Connect();

	/**
	 * @param page
	 * @param size
	 * @return
	 */
	public PagingResponse<Products> getProducts(int page, int size) {
		List<Products> list = new ArrayList<Products>();
		String countSql = "SELECT COUNT(id) AS count FROM `products`";
		String sql = "SELECT * FROM `products` LIMIT " + (page - 1) * size + "," + size;
		try {
			ResultSet r = con.getStmt().executeQuery(countSql);
			r.next();
			int count = r.getInt("count");
			r.close();
			ResultSet rs = con.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new Products(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10),
						rs.getInt(11)));
			}
			rs.close();
			return new PagingResponse<Products>(count, list, page);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * @param page
	 * @param size
	 * @param keyword
	 * @param category
	 * @return
	 */
	public PagingResponse<Products> getProducts(int page, int size, String keyword, int category) {
		List<Products> list = new ArrayList<Products>();
		String countSql = "SELECT COUNT(id) AS count FROM `products`";
		String sql = "SELECT * FROM `products` where name LIKE '%" + keyword + "%' and categoryId=" + category
				+ " LIMIT " + (page - 1) * size + "," + size;
		try {
			ResultSet r = con.getStmt().executeQuery(countSql);
			r.next();
			int count = r.getInt("count");
			r.close();
			ResultSet rs = con.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new Products(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10),
						rs.getInt(11)));
			}
			rs.close();
			return new PagingResponse<Products>(count, list, page);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * @param page
	 * @param size
	 * @param keyword
	 * @return
	 */
	public PagingResponse<Products> getProducts(int page, int size, String keyword) {
		List<Products> list = new ArrayList<Products>();
		String countSql = "SELECT COUNT(id) AS count FROM `products`";
		String sql = "SELECT * FROM `products` where name LIKE '%" + keyword + "%' LIMIT " + (page - 1) * size + ","
				+ size;
		try {
			ResultSet r = con.getStmt().executeQuery(countSql);
			r.next();
			int count = r.getInt("count");
			r.close();
			ResultSet rs = con.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new Products(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10),
						rs.getInt(11)));
			}
			rs.close();
			return new PagingResponse<Products>(count, list, page);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * @param product
	 * @param path
	 * @param createBy
	 * @return
	 */
	public int newProduct(ProductDto product, String path, String createBy) {
		String sql = "INSERT INTO `products` (`createAt`, `updateAt`, `name`, `price`, `currency`, `description`, `createBy`, `categoryId`, `images`,`quantity`) VALUES (?,?,?,?,?,?,?,?,?,100)";
		try {
			PreparedStatement ps = con.getCon().prepareStatement(sql);
			ps.setDate(1, new Date(new java.util.Date().getTime()));
			ps.setDate(2, new Date(new java.util.Date().getTime()));
			ps.setString(3, product.getName());
			ps.setInt(4, product.getPrice());
			ps.setString(5, product.getCurrency());
			ps.setString(6, product.getDescription());
			ps.setString(7, createBy);
			ps.setInt(8, product.getCategory());
			ps.setString(9, path);
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
	public int delete(Long id) {
		String sql = "SELECT * from products where id='" + id + "'";
		try {
			try (ResultSet res = con.getStmt().executeQuery(sql)) {
				if (res.next()) {
					sql = "DELETE FROM `products` WHERE `products`.`id` = " + id;
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

	/**
	 * @param id
	 * @return
	 */
	public Products getById(Long id) {
		String sql = "SELECT * FROM `products` WHERE id='" + id + "' LIMIT 1";
		try (ResultSet res = con.getStmt().executeQuery(sql)) {
			res.next();
			return new Products(res.getLong(1), res.getString(2), res.getString(3), res.getString(4), res.getInt(5),
					res.getString(6), res.getString(7), res.getString(8), res.getInt(9), res.getString(10),
					res.getInt(11));
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	public int getQuatity(Long id) {
		String sql = "SELECT quantity FROM `products` WHERE id='" + id + "' LIMIT 1";
		try (ResultSet res = con.getStmt().executeQuery(sql)) {
			res.next();
			return (int) res.getInt("quantity");
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}

	public void updateQuantity(Long id) {
		String sql = "UPDATE `products` SET `quantity` = quantity - 1 WHERE `products`.`id` = '" + id + "'";
		try {
			con.getStmt().executeUpdate(sql);
			System.out.println("update ok");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
