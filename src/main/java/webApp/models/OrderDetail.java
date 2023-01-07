package webApp.models;

public class OrderDetail {
	private Long id;
	private String createAt;
	private String updateAt;
	private int productId;
	private int orderId;
	private String code;

	public OrderDetail(Long id, String createAt, String updateAt, int productId, int orderId, String code) {
		super();
		this.id = id;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.productId = productId;
		this.orderId = orderId;
		this.code = code;
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

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
