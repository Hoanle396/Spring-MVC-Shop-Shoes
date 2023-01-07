<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!-- ***** Preloader Start ***** -->
<div class="page-heading normal-space">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h6>Liberty Market</h6>
				<h2>Your Cart</h2>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row mt-3">
		<div class="col-12">
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
	<table id="cart" class="table table-hover table-condensed">
		<thead>
			<tr>
				<th style="width: 70%">Product</th>
				<th style="width: 10%">Price</th>
				<th style="width: 22%" class="text-center">Subtotal</th>
				<th style="width: 10%"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cart}" var="o">
				<tr>
					<td data-th="Product">
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<img src="${request.contextPath }/webApp${o.images}" alt="..."
									class="img-responsive" />
							</div>
							<div class="col-sm-10">
								<h4 class="nomargin text-info">${o.name}</h4>
							</div>
						</div>
					</td>
					<td data-th="Price">$ ${o.price}</td>
					<td data-th="Subtotal" class="text-center">${o.price}
						${o.currency}</td>
					<!--  <td class="actions" data-th="">
						<button class="btn btn-danger btn-sm">
							<i class="fa fa-trash"></i>
						</button>
					</td>-->
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td><a href="${request.contextPath }/webApp/product"
					class="btn btn-warning"><i class="fa fa-angle-left"></i>
						Continue Shopping</a></td>
				<td colspan="1" class="hidden-xs"></td>
				<td class="hidden-xs text-center"><strong>Total
						${cost}</strong></td>
				<td><a
					href="${request.contextPath }/webApp/product/checkout?cost=${cost}"
					class="btn btn-success d-flex align-items-center">Checkout&nbsp;
						<i class="fa fa-angle-right"></i>
				</a></td>
			</tr>
		</tfoot>
	</table>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>