package webApp.models;

import java.util.List;

public class PagingResponse<T> {

	public int count;
	public List<T> list;
	public int page;

	public PagingResponse(int count, List<T> list, int page) {
		super();
		this.count = count;
		this.list = list;
		this.page = page;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
