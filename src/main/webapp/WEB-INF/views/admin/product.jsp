<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
			<div class="content-wrapper">
				<section class="content-header">
					<div class="container-fluid">
						<div class="row mb-2 justify-content-between align-center">
							<div class="col-2 ">
								<h1 class="h3 mb-2 text-gray-800">Products</h1>
							</div>
							<div class="col-2 ">
								<a href="${request.contextPath}/webApp/admin/create/product" class="btn btn-primary"> Add new</a>
							</div>
						</div>
					</div>
				</section>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">
							Total Products (
							<c:out value="${data.count}"></c:out>
							)
						</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Description</th>
										<th>Updated At</th>
										<th>Price</th>
										<th>Create By</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${data.list.size() > 0 }">
										<c:forEach items="${data.list }" var="o">
											<tr>
												<td>${o.id }</td>
												<td>${o.name }</td>
												<td>${o.description }</td>
												<td>${o.updateAt }</td>
												<td>${o.price}${o.currency }</td>
												<td>${o.createBy }</td>
												<td>
													<form method="POST" action="${request.contextPath}/webApp/admin/product/${o.id}">
														<!-- <a href="${request.contextPath}/webApp/admin/category/${o.id}"
											class="btn btn-info btn-sm"><i class="fa fa-edit"></i></a>| -->
														<button type="submit"
															onclick="return confirm('Are You Sure You Want To Delete? Couldn't undo this action')"
															class="btn btn-danger btn-sm">
															<i class="fa fa-trash"></i>
														</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${data.list.size() <= 0 }">
										<tr>
											<td colspan="7" class="text-center">No data available</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<c:if test="${data.count!=0}">
								<nav aria-label="...">
									<ul class="pagination">
										<c:forEach begin="1" end="${data.count/8+1 }" var="i">
											<c:if test="${i==data.page }">
												<li class="page-item active"><a class="page-link"
														href="${request.contextPath}/webApp/admin/product?page=${i}">${i}</a></li>
											</c:if>
											<c:if test="${i!=data.page }">
												<li class="page-item"><a class="page-link"
														href="${request.contextPath}/webApp/admin/product?page=${i}">${i}</a></li>
											</c:if>

										</c:forEach>
									</ul>
								</nav>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/layout/admin/footer.jsp" %>