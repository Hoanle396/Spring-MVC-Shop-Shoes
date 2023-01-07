package webApp.models;

public class Orders {
	private Long id;
	private String createAt;
	private String updateAt;
	private String code;
	private String userFullName;
	private String productName;
	private int price;
	private String currency;

	public Orders(Long id, String createAt, String updateAt, String code, String userFullName, String productName,
			int price, String currency) {
		super();
		this.id = id;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.code = code;
		this.userFullName = userFullName;
		this.productName = productName;
		this.price = price;
		this.currency = currency;
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

	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

}
