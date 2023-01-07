<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/header.jsp" %>
			<!-- ***** Preloader Start ***** -->
			<div id="js-preloader" class="js-preloader">
				<div class="preloader-inner">
					<span class="dot"></span>
					<div class="dots">
						<span></span> <span></span> <span></span>
					</div>
				</div>
			</div>
			<!-- ***** Preloader End ***** -->

			<div class="page-heading normal-space">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<h6>Liberty NFT Market</h6>
							<h2>View Item Details</h2>
							<span>Home > <a href="#">Item Details</a></span>
							<div class="buttons">
								<div class="main-button">
									<a href="${request.contextPath }/webApp/product">Explore Our
										Items</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="item-details-page">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section-heading">
								<div class="line-dec"></div>
								<h2>
									View Details <em>For Item</em>
								</h2>
							</div>
						</div>
						<div class="col-lg-7">
							<div class="left-image">
								<img src="${request.contextPath }/webApp${product.images}" alt=""
									style="border-radius: 20px; height: 600px; object-fit: contain;">
							</div>
						</div>
						<div class="col-lg-5 align-self-center">
							<h4>${product.name}</h4>
							<span class="author"> <img src="${request.contextPath }/webApp/assets/images/author.jpg" alt=""
									style="max-width: 50px; border-radius: 50%;">
								<h6>
									${product.createBy}<br> <a href="#">@${product.createBy}</a>
								</h6>
							</span>
							<p>${product.description}</p>
							<div class="row">
								<div class="col-3">
									<span class="bid">Price: ${product.price}<br> <strong>${product.currency}</strong><br>
									</span>
								</div>
								<div class="col-4">
									<span class="owner"> Owner<br> <strong>${product.createBy}</strong><br>
										<em>(@${product.createBy})</em>
									</span>
								</div>
								<div class="col-5">
									<span class="ends"> Create At<br> <strong>${product.createAt}</strong><br>
									</span>
								</div>
							</div>
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
							<button onclick="location.href='${request.contextPath }/webApp/product/cart/${product.id}'"
								id="form-submit" class="main-button mt-3">Add to cart</button>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="/WEB-INF/views/layout/footer.jsp" %>