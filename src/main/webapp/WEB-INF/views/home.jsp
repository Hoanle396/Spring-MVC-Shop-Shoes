<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
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

<!-- ***** Main Banner Area Start ***** -->
<div class="main-banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 align-self-center">
				<div class="header-text">
					<h6>Liberty Market</h6>
					<h2>Create Your Style.</h2>
					<p>Liberty Market is a really cool and professional design for
						your sneaker websites.</p>
					<div class="buttons">
						<div class="border-button">
							<a href="product">Explore Top Sneaker</a>
						</div>
						<div class="main-button">
							<a href="#" target="_blank">Watch Our Videos</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">
				<div class="owl-banner owl-carousel">
					<div class="item">
						<img src="assets/images/banner-01.png" alt="">
					</div>
					<div class="item">
						<img src="assets/images/banner-02.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ***** Main Banner Area End ***** -->

<div class="categories-collections">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="categories">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-12">
							<div class="section-heading">
								<div class="line-dec"></div>
								<h2>
									Browse Through Our <em>Categories</em> Here.
								</h2>
							</div>
						</div>
						<%
						int i = 1;
						%>
						<c:forEach items="${category }" var="o">
							<div class="col-lg-2 col-sm-6">
								<div class="item">
									<div class="icon">
										<img src="assets/images/icon-0<%=i%>.png" alt="">
									</div>
									<h4>${o.name }</h4>
									<div class="icon-button">
										<a href="#"><i class="fa fa-angle-right"></i></a>
									</div>
								</div>
							</div>
							<%
							i++;
							%>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="collections">
					<div class="row">
						<div class="col-lg-12">
							<div class="section-heading">
								<div class="line-dec"></div>
								<h2>
									Explore Some Hot <em>Sneaker</em> In Market.
								</h2>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="owl-collection owl-carousel">
								<c:forEach items="${product.list }" var="p">
									<div class="item">
										<img src="${request.contextPath }/webApp${p.images}" alt=""
											style="height: 400px; object-fit: cover;">
										<div class="down-content">
											<h4>${p.name }</h4>
											<span class="collection">Price:<br> <strong>${p.price }
													${p.currency }</strong></span>
											<div class="main-button">
												<a href="product/${p.id }">Explore</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="currently-market">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="section-heading">
					<div class="line-dec"></div>
					<h2>
						<em>Items</em> Currently In The Market.
					</h2>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="filters">
					<ul>
						<li data-filter="*" class="active">All Items</li>
						<c:forEach items="${category }" var="o">
							<li data-filter=".${o.id }">${o.name }</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="row grid">
					<c:forEach items="${product.list}" var="p">
						<div class="col-lg-6 currently-market-item all ${p.categoryId }">
							<div class="item">
								<div class="left-image">
									<img src="${request.contextPath }/webApp${p.images}" alt=""
										style="border-radius: 20px; min-width: 195px; width: 200px; object-fit: cover;">
								</div>
								<div class="right-content">
									<h4>${p.name }</h4>
									<span class="author"> <img
										src="assets/images/author.jpg" alt=""
										style="max-width: 50px; border-radius: 50%;">
										<h6>
											${p.createBy }<br> <a href="#">@${p.createBy }</a>
										</h6>
									</span>
									<div class="line-dec"></div>
									<span class="bid">Price<br> <strong>${p.price }
											${p.currency }</strong><br>
									</span>
									<!-- <span class="ends"> Ends In<br> <strong>5D
											10H 22M 24S</strong><br> <em>(July 18th, 2022)</em>
									</span>
									 -->
									<div class="text-button">
										<a href="product/${p.id }">View Item Details</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>