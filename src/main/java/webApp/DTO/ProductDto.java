package webApp.DTO;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {
	private String name;
	private int price;
	private String currency;
	private String description;
	private int category;
	private MultipartFile images;

	public ProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDto(String name, int price, String currency, String description, int category, MultipartFile images) {
		super();
		this.name = name;
		this.price = price;
		this.currency = currency;
		this.description = description;
		this.category = category;
		this.images = images;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public MultipartFile getImages() {
		return images;
	}

	public void setImages(MultipartFile images) {
		this.images = images;
	}

}
