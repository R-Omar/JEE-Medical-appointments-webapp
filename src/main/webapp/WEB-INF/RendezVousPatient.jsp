<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Mes rendez-vous</title>
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
				<div class="col-md-11 col-md-offset-1 animate-box">

					<h3>Mes rendez-vous</h3>
					<p>
						<c:out value="${rdvCanceledMsg}"></c:out>
					</p>

					<form method="POST" action="ReservezRendezVous">
						<div class="row form-group" class="animate-box">
							<table style="width: 100%">
								<tr>
									<th>Date et heure</th>
									<th>Docteur</th>
									<th>Spécialité</th>
									<th>Centre medical</th>
									<th>Adresse du centre</th>
									<th>Téléphone du centre</th>
								</tr>

								<c:forEach items="${listRdv}" var="rdv">
									<tr>
										<td>
											<c:out value="${rdv.date}" />
										</td>
										<td>
											<c:out value="${rdv.agenda.docteur.nom}" />
											<c:out value="${rdv.agenda.docteur.prenom}" />
										</td>
										<td>
											<c:out value="${rdv.agenda.specialite.libelle}" />
										</td>
										<td>
											<c:out value="${rdv.agenda.centreMedical.nom}" />
										</td>
										<td>${rdv.agenda.centreMedical.adresse}</td>
										<td>${rdv.agenda.centreMedical.telephone}</td>
										<td>
											<a href="AnnuleRendezVousPatient?rdvToCancelId=${rdv.id}" class="erreur">Annuler</a>
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