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
<div class="page-heading normal-space">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h6>Liberty Market</h6>
				<h2>Create Your Feedback Now.</h2>
				<span>Home > <a href="#">About </a></span>
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
						Apply For <em>Your Feedback</em> Here.
					</h2>
				</div>
			</div>
			<div class="col-lg-12">
				<form id="contact" action="${request.contextPath}/feedback"
					method="POST">
					<div class="row">
						<div class="col-lg-12">
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
						<div class="col-lg-4">
							<fieldset>
								<label for="title">Name</label> <input type="text" name="name"
									id="title" placeholder="Ex. Lyon King" autocomplete="on"
									required>
							</fieldset>
						</div>
						<div class="col-lg-4">
							<fieldset>
								<label for="description">Email</label> <input type="email"
									name="email" id="description"
									placeholder="Ex. market@gmail.com" autocomplete="on" required>
							</fieldset>
						</div>
						<div class="col-lg-4">
							<fieldset>
								<label for="username">Subject</label> <input type="text"
									name="subject" id="username" placeholder="Give us your idea"
									autocomplete="on" required>
							</fieldset>
						</div>
						<div class="col-lg-12">
							<fieldset>
								<label for="price">Message</label> <input type="text"
									name="message" id="price" placeholder="Message"
									autocomplete="on" required>
							</fieldset>
						</div>

						<div class="col-lg-8">
							<fieldset>
								<button type="submit" id="form-submit" class="orange-button">Submit
									Your Applying</button>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>