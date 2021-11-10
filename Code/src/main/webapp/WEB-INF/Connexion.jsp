<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connexion</title>
<link rel="stylesheet" href="inc/css/animate.css">
<link rel="stylesheet" href="inc/css/icomoon.css">
<link rel="stylesheet" href="inc/css/bootstrap.css">
<link rel="stylesheet" href="inc/css/magnific-popup.css">
<link rel="stylesheet" href="inc/css/owl.carousel.min.css">
<link rel="stylesheet" href="inc/css/owl.theme.default.min.css">
<link rel="stylesheet" href="inc/css/flexslider.css">
<link rel="stylesheet" href="inc/css/style.css">
<link rel="stylesheet" href="inc/fonts/flaticon/font/flaticon.css">
<script src="inc/js/modernizr-2.6.2.min.js"></script>

</head>
<body>
		<!-- Header  -->
	<c:import url="/WEB-INF/Header.jsp"></c:import>

	<div id="colorlib-contact">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
					<h3>Se connecter</h3>
					<p> Merci de saisir vos idenntifiants pour vous connecter </p>
					<form method="POST" action="Connexion">
						<div class="row form-group">
							<div class="col-md-6">
								<label for="fname">Email</label>
								<input type="text" id="uname" name="email" class="form-control mb" placeholder="Email">
							</div>
							<div class="col-md-6">
								<label for="motdepasse">Mot de passe</label>
								<input type="password" id="pass" name="motdepasse" class="form-control" placeholder="Mot de passe">
							</div>
						</div>
						<c:if test="${!empty erreur}">
							<div class="form-group text-center">
								<c:out value="${erreur}"></c:out>
							</div>
						</c:if>
						<div class="erreur form-group text-center">
							<input type="submit" value="Login" class="btn btn-primary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="inc/js/jquery.min.js"></script>
	<script src="inc/js/jquery.easing.1.3.js"></script>
	<script src="inc/js/bootstrap.min.js"></script>
	<script src="inc/js/jquery.waypoints.min.js"></script>
	<script src="inc/js/jquery.stellar.min.js"></script>
	<script src="inc/js/owl.carousel.min.js"></script>
	<script src="inc/js/jquery.flexslider-min.js"></script>
	<script src="inc/js/jquery.countTo.js"></script>
	<script src="inc/js/jquery.magnific-popup.min.js"></script>
	<script src="inc/js/magnific-popup-options.js"></script>
	<script src="inc/js/sticky-kit.min.js"></script>
	<script src="inc/js/main.js"></script>

</body>
</html>