<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/header.jsp" %>
			<section class="vh-100">
				<div class="container py-5 h-100">
					<div class="row d-flex align-items-center justify-content-center h-100">
						<div class="col-md-8 col-lg-7 col-xl-6">
							<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
								class="img-fluid" alt="Phone image">
						</div>
						<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
							<form action="login" method="post">
								<!-- Email input -->
								<c:if test="${msg != null}">
									<div class="form-outline mb-4">
										<div class="alert alert-danger" role="alert">${msg}</div>
									</div>
								</c:if>
								<div class="form-outline mb-4">
									<input type="email" id="email" name="email" class="form-control form-control-lg" /> <label
										class="form-label" for="email">Email address</label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<input type="password" id="password" name="password" class="form-control form-control-lg" /> <label
										class="form-label" for="password">Password</label>
								</div>

								<div class="d-flex justify-content-around align-items-center mb-4">
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="form1Example3" checked /> <label
											class="form-check-label" for="form1Example3"> Remember me </label>
									</div>
									<a href="register">Sign up?</a>
								</div>

								<!-- Submit button -->
								<button type="submit" class="btn w-100 rounded-pill btn-lg btn-outline-primary btn-block">Sign
									in</button>

								<!-- <div class="divider d-flex align-items-center my-4">
              <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
            </div>

            <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="#!" role="button">
              <i class="fab fa-facebook-f me-2"></i>Continue with Facebook
            </a>
            <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="#!" role="button">
              <i class="fab fa-twitter me-2"></i>Continue with Twitter</a> -->

							</form>
						</div>
					</div>
				</div>
			</section>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %>