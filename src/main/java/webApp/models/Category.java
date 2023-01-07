package webApp.models;

import org.hibernate.annotations.Table;

@Table(appliesTo = "category")
public class Category {
	private Long id;
	private String name;
	private String description;
	private String updateAt;
	private String createAt;

	public Category(Long id, String updateAt, String createAt, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.updateAt = updateAt;
		this.createAt = createAt;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(String updateAt) {
		this.updateAt = updateAt;
	}

	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}
}
