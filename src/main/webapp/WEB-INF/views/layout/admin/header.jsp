<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page session="true" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>

				<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
				<meta name="description" content="">
				<meta name="author" content="">

				<title>H-Shop Admin</title>

				<!-- Custom fonts for this template-->
				<link href="${request.contextPath}/webApp/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
					type="text/css">
				<link
					href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
					rel="stylesheet">

				<!-- Custom styles for this template-->
				<link href="${request.contextPath}/webApp/admin/css/sb-admin-2.min.css" rel="stylesheet">

			</head>

			<body id="page-top">

				<!-- Page Wrapper -->
				<div id="wrapper">

					<!-- Sidebar -->
					<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

						<!-- Sidebar - Brand -->
						<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${request.contextPath}/webApp/admin">
							<div class="sidebar-brand-icon rotate-n-15">
								<i class="fas fa-laugh-wink"></i>
							</div>
							<div class="sidebar-brand-text mx-3">
								H-Shop <sup>Hoan</sup>
							</div>
						</a>

						<!-- Divider -->
						<hr class="sidebar-divider my-0">

						<!-- Nav Item - Dashboard -->
						<li class="nav-item active"><a class="nav-link" href="${request.contextPath}/webApp/admin"> <i
									class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a>
						</li>

						<!-- Divider -->
						<hr class="sidebar-divider">

						<!-- Heading -->
						<div class="sidebar-heading">product</div>

						<!-- Nav Item - Pages Collapse Menu -->
						<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i
									class="fas fa-fw fa-cog"></i> <span>Products</span>
							</a>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
								<div class="bg-white py-2 collapse-inner rounded">
									<h6 class="collapse-header">Product management:</h6>
									<a class="collapse-item" href="${request.contextPath}/webApp/admin/category">Category</a>
									<a class="collapse-item" href="${request.contextPath}/webApp/admin/product">Product</a>
								</div>
							</div>
						</li>

						<!-- Nav Item - Utilities Collapse Menu -->
						<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i
									class="fas fa-fw fa-wrench"></i> <span>Orders</span>
							</a>
							<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
								data-parent="#accordionSidebar">
								<div class="bg-white py-2 collapse-inner rounded">
									<h6 class="collapse-header">Orders:</h6>
									 <a class="collapse-item" href="${request.contextPath}/webApp/admin/orders">Orders</a> <a
										class="collapse-item" href="${request.contextPath}/webApp/admin/other">Other</a>
								</div>
							</div>
						</li>

						<!-- Divider -->
						<hr class="sidebar-divider">

						<!-- Heading -->
						<div class="sidebar-heading">Other</div>

						<!-- Nav Item - Pages Collapse Menu -->
						<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> <i
									class="fas fa-fw fa-ellipsis-h"></i> <span>Others:</span>
							</a>
							<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
								<div class="bg-white py-2 collapse-inner rounded">
									<h6 class="collapse-header">Contact:</h6>
									<a class="collapse-item" href="${request.contextPath}/webApp/admin/feedback">Feedback</a>
									<div class="collapse-divider"></div>
									<h6 class="collapse-header">Admin:</h6>
									<a class="collapse-item" href="${request.contextPath}/webApp/admin/users">Users</a>
								</div>
							</div>
						</li>

						<li class="nav-item"><a class="nav-link" href="${request.contextPath}/webApp/admin/settings"> <i
									class="fas fa-fw fa-cog"></i> <span>Settings</span>
							</a></li>
						<!-- Divider -->
						<hr class="sidebar-divider d-none d-md-block">

						<!-- Sidebar Toggler (Sidebar) -->
						<div class="text-center d-none d-md-inline">
							<button class="rounded-circle border-0" id="sidebarToggle"></button>
						</div>


					</ul>
					<!-- End of Sidebar -->

					<!-- Content Wrapper -->
					<div id="content-wrapper" class="d-flex flex-column">

						<!-- Main Content -->
						<div id="content">

							<!-- Topbar -->
							<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

								<!-- Sidebar Toggle (Topbar) -->
								<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
									<i class="fa fa-bars"></i>
								</button>


								<!-- Topbar Navbar -->
								<ul class="navbar-nav ml-auto">
									<div class="topbar-divider d-none d-sm-block"></div>

									<!-- Nav Item - User Information -->
									<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
												class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.fullname }</span>
											<img class="img-profile rounded-circle"
												src="${request.contextPath}/webApp/admin/img/undraw_profile.svg">
										</a> <!-- Dropdown - User Information -->
										<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
											aria-labelledby="userDropdown">
											<a class="dropdown-item" href="#"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
												Profile
											</a> <a class="dropdown-item" href="#"> <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
												Settings
											</a> <a class="dropdown-item" href="#"> <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
												Activity Log
											</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> <i
													class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
												Logout
											</a>
										</div>
									</li>

								</ul>

							</nav>
							<!-- End of Topbar -->