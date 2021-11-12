<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Réserver un rendez-vous</title>
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

	<form method="POST" action="RechercherRendezVous" class="appointment-wrap">
		<div class="row form-group">
			<div class="col-md-3">
				<label for="fname">Nom du docteur</label>
				<input type="text" id="fname" name="nomdocteur" class="form-control" placeholder="Nom du docteur">
			</div>
			<div class="col-md-3">
				<label for="subject">Centre médical</label> <select class="selectpicker form-control" name="centremedical">
					<option selected></option>
					<c:forEach items="${centreMedicaux}" var="centreMedical">
						<option value="${centreMedical.idCentreMedical}">${centreMedical.nom}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-2">
				<label for="subject">Specialité</label> <select class="selectpicker form-control" name="specialite">
					<option selected></option>
					<c:forEach items="${specialites}" var="specialite">
						<option value="${specialite.idSpecialite}">${specialite.libelle}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-2">
				<label for="fname">Date</label>
				<input type="date" id="date" name="date" class="form-control" placeholder="Date">
			</div>
			<div class="col-md-1">
				<label> </label>
				<input type="submit" value="Rechercher" class="btn btn-primary">
			</div>

		</div>
	</form>
	<div id="colorlib-contact">
		<div class="container">
			<div class="row">
				<div class="col-md-11 col-md-offset-1 animate-box">
					<form method="POST" action="ReservezRendezVous">
						<div class="row form-group" class="animate-box">
							<table style="width: 100%">
								<tr>
									<th>Docteur</th>
									<th>Centre Médical</th>
									<th>Adresse</th>
									<th>Téléphone</th>
									<th>Specialité</th>
									<th>Date et Heure</th>
									<th></th>
								</tr>

								<c:forEach items="${rendezVous}" var="rv">
									<tr>
										<td>${rv.agenda.docteur.prenom} ${rv.agenda.docteur.nom}</td>
										<td>${rv.agenda.centreMedical.nom}</td>
										<td>${rv.agenda.centreMedical.adresse}</td>
										<td>${rv.agenda.centreMedical.telephone}</td>
										<td>${rv.agenda.specialite.libelle}</td>
										<td>${rv.date}</td>
										<td>
											<a href="${pageContext.request.contextPath}/ReserverRendezVous?idRv=${rv.id}" class= "succes">Réserver</a>
										</td>
									</tr>

								</c:forEach>
							</table>
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