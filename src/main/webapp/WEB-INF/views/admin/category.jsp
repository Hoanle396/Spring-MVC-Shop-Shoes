<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
			<div class="content-wrapper">
				<section class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1>Category</h1>
							</div>
						</div>
					</div>
				</section>
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outline card-primary">
								<div class="card-header">
									<h3 class="card-title">New category</h3>
								</div>
								<div class="card-body">
									<form action="${request.contextPath}/webApp/admin/category" method="POST">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label"></label>
											<div class="col-sm-9">
												<c:if test="${error != null}">
													<div class="form-outline mb-4">
														<div class="alert alert-danger" role="alert">${error}</div>
													</div>
												</c:if>
												<c:if test="${success != null}">
													<div class="form-outline mb-4">
														<div class="alert alert-success" role="alert">${success}</div>
													</div>
												</c:if>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">Name(*)</label>
											<div class="col-sm-9">
												<div class="form-line">
													<input type="text" name="name" class="form-control" required />
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">Description</label>
											<div class="col-sm-9">
												<div class="form-line">
													<input type="text" name="description" class="form-control" />
												</div>
											</div>
										</div>
										<button type="submit" name="btnSaveOption" class="btn btn-primary btn-block">
											<span>Save</span>
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Categories</h6>
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
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${category.size() > 0 }">
										<c:forEach items="${category }" var="o">
											<tr>
												<td>${o.id }</td>
												<td>${o.name }</td>
												<td>${o.description }</td>
												<td>${o.updateAt }</td>
												<td>
													<form method="POST" action="${request.contextPath}/webApp/admin/category/${o.id}">
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
									<c:if test="${category.size() <= 0 }">
										<tr>
											<td colspan="5" class="text-center">No
												data available</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/layout/admin/footer.jsp" %>