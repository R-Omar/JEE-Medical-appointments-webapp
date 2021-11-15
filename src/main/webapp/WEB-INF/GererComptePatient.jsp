<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Gérer mon compte</title>
	<link rel="icon" type="image/x-icon" href="inc/images/icon.ico">
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
					<h3>Modifier vos informations</h3>
					<p>Merci de remplir le formulaire suivant avec vos nouvelles informations</p>
					<p class="${empty validationModification.erreurs ? 'succes' : 'erreur'}">${validationModification.resultat}</p>

					<form method="post" action="GererComptePatient" id="main-form">

						<div class="row form-group">
							<div class="col-md-6">
								<label for="email">Email</label>
								<input type="text" name="email" id="uname" class="form-control" value="<c:out value="${utilisateur.email}"/>"
									placeholder="Votre adresse email" required>
								<p class='erreur'>${validationModification.erreurs['email']}</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-6">
								<label for="motdepasse">Mot de passe</label>
								<input type="password" name="motdepasse" id="pass" class="form-control" placeholder="Mot de passe" required>
							</div>
							<div class="col-md-6">
								<label for="confirmation">Confirmation du mot de passe</label>
								<input type="password" name="confirmation" id="pass" class="form-control"
									placeholder="Confirmation du mot de passe" required>
							</div>
							<p class='erreur'>${validationModification.erreurs['motdepasse']}</p>
						</div>

						<div class="row form-group">
							<div class="col-md-6">
								<label for="prenom">Prénom</label>
								<input type="text" name="prenom" id="name" class="form-control" value="<c:out value="${utilisateur.prenom}"/>"
									placeholder="Votre prénom" required>
								<p class='erreur'>${validationModification.erreurs['prenom']}</p>
							</div>
							<div class="col-md-6">
								<label for="nom">Nom</label>
								<input type="text" name="nom" id="name" class="form-control" value="<c:out value="${utilisateur.nom}"/>"
									placeholder="Votre nom" required>
								<p class='erreur'>${validationModification.erreurs['nom']}</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-6">
								<label for="date">Année de naissance</label>
								<input type="number" name="anneedenaissance" id="age" class="form-control"
									value="<c:out value="${utilisateur.anneeDeNaissance}"/>" required>
								<p class='erreur'>${validationModification.erreurs['anneedenaissance']}</p>
							</div>
							<div class="col-md-6">
								<label for="telephone">Téléphone</label>
								<input type="text" id="phone1" name="telephone" class="form-control"
									value="<c:out value="${utilisateur.telephone}"/>" placeholder="Votre numéro de téléphone" required>
								<p class='erreur'>${validationModification.erreurs['telephone']}</p>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-6">
								<label for="adresse">Adresse</label>
								<input type="text" name="adresse" id="address" class="form-control"
									value="<c:out value="${utilisateur.adresse}"/>" placeholder="Votre adresse" required>
							</div>
						</div>
					</form>
					
					<div class="row form-group">
						<div class="form-group text-center">
							<div class="col-md-6">
								<button type="button" class="update btn btn-primary">Désactiver mon compte</button>
							</div>
							<div class="col-md-6">
								<button type="submit" form="main-form" class="btn btn-primary">Modifier mes informations</button>
							</div>
						</div>
					</div>


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