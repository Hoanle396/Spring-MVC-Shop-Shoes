<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page session="true" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>

				<meta charset="utf-8">
				<meta name="author" content="templatemo">
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

				<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
					rel="stylesheet">

				<title>Liberty</title>

				<!-- Bootstrap core CSS -->
				<link href="${request.contextPath }/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


				<!-- Additional CSS Files -->
				<link rel="stylesheet" href="${request.contextPath }/assets/css/fontawesome.css">
				<link rel="stylesheet" href="${request.contextPath }/assets/css/templatemo-liberty-market.css">
				<link rel="stylesheet" href="${request.contextPath }/assets/css/owl.css">
				<link rel="stylesheet" href="${request.contextPath }/assets/css/animate.css">
				<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
				<!--

TemplateMo 577 Liberty Market

https://templatemo.com/tm-577-liberty-market

-->
			</head>

			<body>

				<!-- ***** Preloader Start ***** -->
				<!-- <div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div> -->
				<!-- ***** Preloader End ***** -->

				<!-- ***** Header Area Start ***** -->
				<header class="header-area header-sticky">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<nav class="main-nav">
									<!-- ***** Logo Start ***** -->
									<a href="home" class="logo"> <img src="assets/images/logo.png" alt="">
									</a>
									<!-- ***** Logo End ***** -->
									<!-- ***** Menu Start ***** -->
									<ul class="nav">
										<li><a href="${request.contextPath}/home">Home</a></li>
										<li><a href="${request.contextPath}/product">Explore</a></li>
										<li><a href="${request.contextPath}/about">About</a></li>
										<c:if test="${sessionScope.user!=null }">
											<li><a href="${request.contextPath}/product/mypage" class="active">${sessionScope.fullname
													}</a></li>
											<li><a href="${request.contextPath}/logout">Logout</a></li>
										</c:if>
										<c:if test="${sessionScope.user==null }">
											<li><a href="${request.contextPath}/login">Login</a></li>
										</c:if>
									</ul>
									<a class='menu-trigger'> <span>Menu</span>
									</a>
									<!-- ***** Menu End ***** -->
								</nav>
							</div>
						</div>
					</div>
				</header>