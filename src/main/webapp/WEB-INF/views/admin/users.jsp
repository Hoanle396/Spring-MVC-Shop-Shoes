<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
			<div class="content-wrapper">
				<section class="content-header">
					<div class="container-fluid">
						<div class="row mb-2 justify-content-between align-center">
							<div class="col-2 ">
								<h1 class="h3 mb-2 text-gray-800">Users</h1>
							</div>
						</div>
					</div>
				</section>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">
							Total Users (
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
										<th>Email</th>
										<th>Updated At</th>
										<th>Role</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${data.list.size() > 0 }">
										<c:forEach items="${data.list }" var="o">
											<tr>
												<td>${o.id }</td>
												<td>${o.fullname}</td>
												<td>${o.email }</td>
												<td>${o.updateAt }</td>
												<td>${o.role }</td>
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
										<c:forEach begin="1" end="${data.count/8+1}" var="i">
											<c:if test="${i==data.page }">
												<li class="page-item active"><a class="page-link"
														href="${request.contextPath}/admin/users?page=${i}">${i}</a></li>
											</c:if>
											<c:if test="${i!=data.page }">
												<li class="page-item"><a class="page-link"
														href="${request.contextPath}/admin/users?page=${i}">${i}</a></li>
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