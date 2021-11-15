<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" type="image/x-icon" href="inc/images/icon.ico">
	<title>Heal</title>

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

<body class="acceuil">

	<!-- Header  -->
	<c:import url="/WEB-INF/Header.jsp"></c:import>

	<!-- Content -->
	<aside id="colorlib-hero">
		<div class="flexslider">
			<ul class="slides">
				<li style="background-image: url(inc/images/7336.jpg);">
					<div class="overlay"></div>
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-md-offset-2 col-md-pull-2 slider-text">
								<div class="slider-text-inner">
									<h1>
										<strong>Heal</strong>
									</h1>
									<c:if test="${empty utilisateur}">
										<h2 class="doc-holder">Trouver et réserver un rendez-vous médical</h2>
										<p>
											<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/Connexion">Réserver un
												rendez-vous</a>
										</p>
									</c:if>

									<c:if test="${utilisateur.typeUtilisateur =='patient'}">
										<h2 class="doc-holder">Trouver et réserver un rendez-vous médical</h2>
										<h2 class="doc-holder">Bonjour ${utilisateur.prenom}</h2>
										<p>
											<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/RechercherRendezVous">Réserver
												un rendez-vous</a>
										</p>
									</c:if>

									<c:if test="${utilisateur.typeUtilisateur =='docteur'}">
										<h2 class="doc-holder">Bonjour docteur ${utilisateur.prenom}</h2>
										<p>
											<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/GererAgenda">Consulter vos
												agendas</a>
										</p>
									</c:if>

									<c:if test="${utilisateur.typeUtilisateur =='admin'}">
										<h2 class="doc-holder">Bonjour Admin</h2>
										<p>
											<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AjouterDocteur">Ajouter un
												docteur</a>
										</p>
									</c:if>

								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</aside>


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