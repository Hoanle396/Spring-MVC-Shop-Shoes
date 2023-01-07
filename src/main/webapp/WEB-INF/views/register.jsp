<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/WEB-INF/views/layout/header.jsp" %>
			<!-- ***** Header Area End ***** -->
			<section class="vh-100">
				<div class="container h-100">
					<div class="row d-flex align-items-center justify-content-center h-100">
						<div class="col-md-8 col-lg-7 col-xl-6">
							<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
								class="img-fluid" alt="Phone image">
						</div>
						<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
							<form action="register" method="post">
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
								<div class="form-outline mb-4">
									<label class="form-label" for="fullname">Full Name</label> <input type="text" id="fullname"
										name="fullname" class="form-control form-control-lg" required />
								</div>
								<!-- Email input -->
								<div class="form-outline mb-4">
									<label class="form-label" for="form1Example13">Email
										address</label> <input type="email" name="email" id="form1Example13"
										class="form-control form-control-lg" required />
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<label class="form-label" for="form1Example23">Password</label> <input type="password"
										id="form1Example23" name="password" class="form-control form-control-lg" required />
								</div>

								<div class="form-outline mb-4">
									<label class="form-label" for="form1Example23">Confrim
										Password</label> <input type="password" id="form1Example23" name="confrimpassword"
										class="form-control form-control-lg" required />
								</div>

								<!-- Submit button -->
								<button type="submit" class="btn w-100 rounded-pill btn-lg btn-outline-primary btn-block">Sign
									up</button>

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