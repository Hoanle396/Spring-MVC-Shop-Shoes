package webApp.models;

public class Order {
	private Long id;
	private String createAt;
	private String updateAt;
	private String code;
	private int userId;
	private int price;
	private int voucherId;

	public Order(Long id, String createAt, String updateAt, String code, int userId, int price, int voucherId) {
		super();
		this.id = id;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.code = code;
		this.userId = userId;
		this.price = price;
		this.voucherId = voucherId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public String getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(String updateAt) {
		this.updateAt = updateAt;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getVoucherId() {
		return voucherId;
	}

	public void setVoucherId(int voucherId) {
		this.voucherId = voucherId;
	}

}
