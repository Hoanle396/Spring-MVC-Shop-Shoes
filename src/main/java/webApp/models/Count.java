package webApp.models;

public class Count {
	private int product;
	private int user;
	private int order;
	private int feedback;

	public Count(int product, int user, int order, int feedback) {
		super();
		this.product = product;
		this.user = user;
		this.order = order;
		this.feedback = feedback;
	}

	public int getProduct() {
		return product;
	}

	public void setProduct(int product) {
		this.product = product;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getFeedback() {
		return feedback;
	}

	public void setFeedback(int feedback) {
		this.feedback = feedback;
	}

}
