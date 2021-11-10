<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="colorlib-nav" role="navigation">
	<div class="menu-wrap">
		<div class="container">
			<div class="row">
				<div class="col-xs-8">
					<div class="menu-1">
					
						<ul>			
							<li><a href="${pageContext.request.contextPath}/">Acceuil</a></li>

							<c:if test="${empty utilisateur}">
								<li><a href="${pageContext.request.contextPath}/Inscription">S'inscrire</a></li>
								<li><a href="${pageContext.request.contextPath}/Connexion">Se connecter</a></li>
							</c:if>

							<c:if test="${utilisateur.typeUtilisateur == 'patient'}">
								<li><a href="${pageContext.request.contextPath}/RendezVousPatient">Mes rendez-vous</a></li>
								<li><a href="${pageContext.request.contextPath}/GererComptePatient">Mon compte</a></li>
							</c:if>

							<c:if test="${utilisateur.typeUtilisateur == 'docteur'}">
								<li><a href="${pageContext.request.contextPath}/GererAgenda">Mes Agendas</a></li>
								<li><a href="${pageContext.request.contextPath}/GererCompteDocteur">Mon compte</a></li>
							</c:if>

							<c:if test="${utilisateur.typeUtilisateur == 'admin'}">
								<li><a href="${pageContext.request.contextPath}/AjouterDocteur">Ajouter un docteur</a></li>
							</c:if>
							
							<c:if test="${!empty utilisateur.typeUtilisateur}">
								<li><a href="${pageContext.request.contextPath}/Deconnexion">Se déconnecter</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				
				
				<c:if test="${empty utilisateur }">
					<div class="col-md-4">
						<p class="btn-cta">
							<a href="${pageContext.request.contextPath}/Connexion"><span>Réserver un rendez-vous <i
									class="icon-calendar3"></i></span></a>
						</p>
					</div>
				</c:if>

				<c:if test="${utilisateur.typeUtilisateur == 'patient' }">
					<div class="col-md-4">
						<p class="btn-cta">
							<a href="${pageContext.request.contextPath}/RechercherRendezVous"><span>Réserver un rendez-vous <i
									class="icon-calendar3"></i></span></a>
						</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</nav>