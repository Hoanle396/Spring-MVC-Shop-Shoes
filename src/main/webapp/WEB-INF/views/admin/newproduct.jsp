<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
			<div class="content-wrapper p-4">
				<section class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1>Products</h1>
							</div>
						</div>
					</div>
				</section>
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outline card-primary">
								<div class="card-header">
									<h3 class="card-title">New product</h3>
								</div>
								<div class="card-body">
									<form action="${request.contextPath}/admin/product" method="POST"
										enctype="multipart/form-data">
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
										<div class="form-group row mt-3">
											<label class="col-sm-3 col-form-label">Name(*)</label>
											<div class="col-sm-9">
												<div class="form-line">
													<input type="text" name="name" class="form-control" required />
												</div>
											</div>
										</div>
										<div class="form-group row mt-3">
											<label class="col-sm-3 col-form-label">Description</label>
											<div class="col-sm-9">
												<div class="form-line">
													<textarea name="description" class="form-control" rows="5"></textarea>
												</div>
											</div>
										</div>
										<div class="form-group row mt-3">
											<label class="col-sm-3 col-form-label">Price(*)</label>
											<div class="col-sm-9">
												<div class="form-line">
													<input type="text" name="price" class="form-control" required />
												</div>
											</div>
										</div>
										<div class="form-group row mt-3">
											<label class="col-sm-3 col-form-label">Currency</label>
											<div class="col-sm-9">
												<div class="form-line">
													<input type="text" name="currency" value="VND" class="form-control" />
												</div>
											</div>
										</div>
										<div class="form-group row mt-3">
											<label class="col-sm-3 col-form-label">Category(*)</label>
											<div class="col-sm-9">
												<div class="form-line">
													<select type="text" name="category" class="form-control">
														<c:forEach items="${category }" var="o">
															<option value="${o.id }">${o.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group row mt-3">
											<label class="col-sm-3 col-form-label">Image (*)</label>
											<div class="col-sm-9">
												<div class="form-line">
													<input type="file" name="images" class="form-control" required />
												</div>
											</div>
										</div>
										<button type="submit" name="btnSaveOption" class="btn btn-primary btn-block mt-3">
											<span>Save</span>
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<%@ include file="/WEB-INF/views/layout/admin/footer.jsp" %>