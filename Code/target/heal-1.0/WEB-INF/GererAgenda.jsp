<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="fr.dauphine.heal.entities.RendezVous"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link href='inc/css/mainFullCalendar.css' rel='stylesheet' />
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<script src='inc/js/mainFullCalendar.js'></script>
<script src='inc/js/locales-all.js'></script>
<script src='inc/js/theme-chooser.js'></script>
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

<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');
						var ajout_dispo = false;
						var ajout_indispo = false;
						var eventId = 1;
						var isAgendaActif = ${agenda.actif};

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									headerToolbar : {
										left : 'actif addDispoButton addIndispoButton mettreAjour',
										center : 'title',
										right : 'prev,next today,dayGridMonth,timeGridWeek,timeGridDay,listMonth'
									},
									locale : 'fr',
									initialView : 'timeGridWeek',
									navLinks : true,
									//editable : true,
									//selectable: true,
									slotDuration : '00:30',
									slotMinTime : '08:00',
									slotMaxTime : '20:00',
									firstDay : 1,
									navLinks : true,
									allDaySlot : false,
									//themeSystem : 'bootstrap',
									defaultTimedEventDuration : '00:30',
									nowIndicator : true,
									eventOverlap : false,
									selectOverlap : false,
									height : 'auto',
									events : [],

									dateClick : function(info) {
										if (ajout_dispo) {
											calendar.addEvent({
												id : 'dispo_' + eventId,
												title : 'disponible',
												start : info.dateStr,
												color : 'green'
											});
											eventId = eventId + 1;
										}
										if (ajout_indispo) {
											calendar.addEvent({
												id : 'indispo_' + eventId,
												title : 'indisponible',
												start : info.dateStr,
												color : 'red'
											});
											eventId = eventId + 1;
										}
									},

									customButtons : {
										addDispoButton : {
											text : 'Disponibile',
											click : function(mouseEvent,
													htmlElement) {
												if (ajout_dispo == false) {
													ajout_dispo = true;
													ajout_indispo = false;
													htmlElement.style.opacity = '0.5';
												} else {
													ajout_dispo = false;
													htmlElement.style.opacity = '1';
												}
												//console.log(mouseEvent);
												//console.log(htmlElement);

											}
										},

										actif : {
											text : isAgendaActif ? 'Agenda active'
													: 'Agenda inactive',
											click : function() {
												$
														.ajax({
															type : "GET",
															url : "${pageContext.request.contextPath }/MettreAjourAgenda?idAg=${param.idAg}&action=actif",
															sucess : alert("Votre agenda pour le centre "
																	+ "${rendezvous[0].agenda.centreMedical.nom}"
																	+ " à été mis à jour")
														});
												setTimeout(function() {
													location.reload();
												}, 500);
											}

										},

										addIndispoButton : {
											text : 'Indisponible',
											click : function() {
												if (ajout_indispo == false) {
													ajout_indispo = true;
													ajout_dispo = false;
												} else {
													ajout_indispo = false;
												}
											}
										},

										mettreAjour : {
											text : 'Valider',
											click : function() {
												$
														.ajax({
															type : "GET",
															url : "${pageContext.request.contextPath }/MettreAjourAgenda?idAg=${param.idAg}&action=valider",
															data : {
																jsonData : JSON
																		.stringify(calendar
																				.getEvents())
															},
															dataType : "json",
															sucess : alert("Votre agenda pour le centre "
																	+ "${rendezvous[0].agenda.centreMedical.nom}"
																	+ " à été mis à jour")
														});

												setTimeout(function() {
													location.reload();
												}, 500);

											}
										}
									},

									eventClick : function(info) {
										if (ajout_dispo == true) {
											if (info.event.backgroundColor === 'green') {
												calendar.getEventById(
														info.event.id).remove();
											} else if (info.event.backgroundColor === 'red') {
												calendar.getEventById(
														info.event.id).setProp(
														'color', 'green');
											}

										}

										if (ajout_indispo == true) {
											if (info.event.backgroundColor === 'red') {
												calendar.getEventById(
														info.event.id).remove();
											} else if (info.event.backgroundColor === 'green') {
												calendar.getEventById(
														info.event.id).setProp(
														'color', 'red');
											}
										}
									}
								});

						var rendezvous = "${rendezvous}";

						<c:forEach items="${rendezvous}" var="rv">
						var color;
						if ("${rv.status}" === 'disponible'
								&& "${rv.agenda.id}" === "${agenda.id}") {
							color = 'green';
						} else if ("${rv.status}" === 'reservé'
								&& "${rv.agenda.id}" === "${agenda.id}") {
							color = 'blue';
						}

						else if ("${rv.status}" === 'indisponible'
								&& "${rv.agenda.id}" === "${agenda.id}") {
							color = 'red';
						} else if ("${rv.agenda.id}" !== "${agenda.id}") {
							color = 'gray';
						}
						calendar.addEvent({
							id : "${rv.id}",
							title : "${rv.agenda.centreMedical.nom}",
							start : "${rv.date}",
							color : color
						});
						</c:forEach>
						calendar.render();

						var actifButton = document
								.getElementsByClassName("fc-actif-button")[0];
						if (isAgendaActif === false && actifButton) {
							actifButton.style.opacity = '0.65';
						}
					});
</script>

<script>
	
</script>

<style>
html, body {
	overflow: hidden; /* don't do scrollbars */
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar-container {
	position: absolute;
	top: 70px;
	left: 250px;
	right: 40px;
	bottom: 0px;
}

#list-container {
	position: fixed;
	top: 70px;
	left: 0px;
	bottom: 20px;
	width: 230px;
	padding-left: 20px;
}

.agenda {
	padding-left: 20px;
}
</style>

</head>
<body>
	<!-- Header  -->
	<c:import url="/WEB-INF/Header.jsp"></c:import>

	<div id='list-container'>
		<h4>Mes agendas</h4>
		<c:forEach items="${utilisateur.agendas}" var="agenda">
			<a class="agenda" href="${pageContext.request.contextPath}/GererAgenda?idAg=${agenda.id}"> <c:out
					value="${agenda.centreMedical.nom}"></c:out>
			</a>
			<br />
		</c:forEach>
	</div>


	<div id='calendar-container'>
		<div>
			<h4>Agenda du centre : ${agenda.centreMedical.nom}</h4>
		</div>
		<c:if test="${empty agenda}">
			<div>
				<h5>Veuillez choisir un centre médical</h5>
			</div>
		</c:if>
		<div id='calendar'></div>
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