<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter Docteur</title>
	<link rel="icon" type="image/x-icon" href="inc/images/icon.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
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
<body class="ajouter">
	<!-- Header  -->
	<c:import url="/WEB-INF/Header.jsp"></c:import>

	<div id="colorlib-contact">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
					<h3>Ajouter un docteur</h3>
					<p>Merci de remplir le formulaire suivant avec les informations du docteur</p>
					<p class="${empty validationInscription.erreurs ? 'succes' : 'erreur'}">${validationInscription.resultat}</p>

					<form method="post" action="AjouterDocteur" id="main-form">
						<div class="row form-group">
							<div class="col-md-6">
								<label for="email">Email</label>
								<input type="text" name="email" id="uname" class="form-control" value="<c:out value="${docteur.email}"/>"
									placeholder="Adresse email du docteur" required>
								<p class='erreur'>${validationInscription.erreurs['email']}</p>
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
							<p class='erreur'>${validationInscription.erreurs['motdepasse']}</p>
						</div>


						<div class="row form-group">
							<div class="col-md-6">
								<label for="prenom">Prénom</label>
								<input type="text" name="prenom" id="name" class="form-control" value="<c:out value="${docteur.prenom}"/>"
									placeholder="Prénom du docteur" required>
								<p class='erreur'>${validationInscription.erreurs['prenom']}</p>
							</div>

							<div class="col-md-6">
								<label for="nom">Nom</label>
								<input type="text" name="nom" id="name" class="form-control" value="<c:out value="${docteur.nom}"/>"
									placeholder="Nom du docteur" required>
								<p class='erreur'>${validationInscription.erreurs['nom']}</p>
							</div>


						</div>

						<div class="row form-group">
							<div class="col-md-6">
								<label for="telephone">Téléphone</label>
								<input type="text" id="phone1" name="telephone" class="form-control"
									value="<c:out value="${docteur.telephone}"/>" placeholder="Numéro de téléphone du docteur" required>
							</div>
							<div class="col-md-6">
								<label for="adresse">Adresse</label>
								<input type="text" name="adresse" id="address" class="form-control" value="<c:out value="${docteur.adresse}"/>"
									placeholder="Adresse du docteur" required>
							</div>
							<p class='erreur'>${validationInscription.erreurs['telephone']}</p>
						</div>

						<div class="row form-group">
							<div class="col-md-6">
								<label for="fname">Centre médical</label><br /> <select class="form-select" name="centremedical" required>
									<option selected></option>
									<c:forEach items="${centreMedicaux}" var="centreMedical">
										<option value="${centreMedical.idCentreMedical}">${centreMedical.nom}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<label for="motdepasse">Specialité</label><br /> <select class="form-select" name="specialite" required>
									<option selected></option>
									<c:forEach items="${specialites}" var="specialite">
										<option value="${specialite.idSpecialite}">${specialite.libelle}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>

					<div class="row form-group">
						<div class="form-group text-center">
							<div class="col-md-6">
								<button type="button" class="repeat btn btn-primary">Ajouter le docteur un autre centre</button>
							</div>
							<div class="col-md-6">
								<button type="submit" form="main-form" class="btn btn-primary">Ajouter le docteur</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="base-group" style="display: none;">
		<div class="row form-group">
			<div class="col-md-6">
				<select class="form-select" name="centremedical">
					<option selected></option>
					<c:forEach items="${centreMedicaux}" var="centreMedical">
						<option value="${centreMedical.idCentreMedical}">${centreMedical.nom}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-6">
				<select class="form-select" name="specialite">
					<option selected></option>
					<c:forEach items="${specialites}" var="specialite">
						<option value="${specialite.idSpecialite}">${specialite.libelle}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(function() {
			$(".repeat").on(
					'click',
					function(e) {
						var c = $('.base-group').clone();
						c.removeClass('base-group').css('display', 'block')
								.addClass("row form-group");
						$("#main-form").append(c);
					});
		});
	</script>

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