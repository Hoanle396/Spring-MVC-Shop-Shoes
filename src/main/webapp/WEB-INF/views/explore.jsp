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

			<div class="page-heading">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<h6>Liberty Market</h6>
							<h2>Discover Some Top Items</h2>
							<span>Home > <a href="#">Explore</a></span>
						</div>
					</div>
				</div>
				<div class="featured-explore">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="owl-features owl-carousel">
									<c:forEach items="${slider.list }" var="s">
										<div class="item">
											<div class="thumb">
												<img src="${request.contextPath }${s.images}" alt=""
													style="border-radius: 20px; with: 100%; height: 450px; object-fit: cover;">
												<div class="hover-effect">
													<div class="content">
														<h4>${s.name }</h4>
														<span class="author"> <img src="assets/images/author.jpg" alt=""
																style="max-width: 50px; max-height: 50px; border-radius: 50%;">
															<h6>
																${s.createBy }<br> <a href="#">@${s.createBy }</a>
															</h6>
														</span>
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
			</div>

			<div class="discover-items">
				<div class="container">
					<div class="row">
						<div class="col-lg-7">
							<div class="section-heading">
								<div class="line-dec"></div>
								<h2>
									Discover Some Of Our <em>Items</em>.
								</h2>
							</div>
						</div>
						<div class="col-lg-5">
							<form id="search-form" method="get" name="gs" method="submit" role="search" action="">
								<div class="row">
									<div class="col-lg-5">
										<fieldset>
											<input type="hidden" name="page" value="${data.page }" /> <input type="text" name="keyword"
												class="searchText" placeholder="Type Something..." autocomplete="on">
										</fieldset>
									</div>
									<div class="col-lg-4">
										<fieldset>
											<select name="category" class="form-select" aria-label="Default select example"
												id="chooseCategory" onchange="this.form.click()">
												<option selected value="0">All Categories</option>
												<c:forEach items="${category }" var="c">
													<option value="${c.id }">${c.name }</option>
												</c:forEach>
											</select>
										</fieldset>
									</div>
									<div class="col-lg-3">
										<fieldset>
											<button type="submit" class="main-button">Search</button>
										</fieldset>
									</div>
								</div>
							</form>
						</div>
						<c:forEach items="${data.list }" var="p">
							<div class="col-lg-3">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<span class="author"> <img src="assets/images/author.jpg" alt=""
													style="max-width: 50px; max-height: 50px; border-radius: 50%;">
											</span> <img src="${request.contextPath }${p.images}" alt=""
												style="border-radius: 20px; width: 100%; height: 250px; object-fit: cover;">
											<h4>${p.name }</h4>
										</div>
										<div class="col-lg-12">
											<div class="line-dec"></div>
											<div class="row">
												<div class="col-6">
													<span>price: <br> <strong>${p.price }
															${p.currency }</strong></span>
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="main-button">
												<a href="product/${p.id }">View Details</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="col-12">
							<c:if test="${data.count!=0}">
								<nav aria-label="...">
									<ul class="pagination">
										<c:forEach begin="1" end="${data.count/8+1 }" var="i">
											<c:if test="${i==data.page }">
												<li class="page-item active"><a class="page-link"
														href="${request.contextPath}/product?page=${i}">${i}</a></li>
											</c:if>
											<c:if test="${i!=data.page }">
												<li class="page-item"><a class="page-link"
														href="${request.contextPath}/product?page=${i}">${i}</a></li>
											</c:if>

										</c:forEach>
									</ul>
								</nav>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %>