package fr.dauphine.heal.servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.Docteur;
import fr.dauphine.heal.services.ValidationModification;

@WebServlet("/GererCompteDocteur")
public class GererCompteDocteur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Docteur docteur = (Docteur) session.getAttribute("utilisateur");
		if (docteur != null) {
			request.setAttribute("Centre_Specialite", docteur.getCentre_Specialite());
			this.getServletContext().getRequestDispatcher("/WEB-INF/GererCompteDocteur.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ValidationModification validationModification = new ValidationModification(dao);

		Docteur docteur = validationModification.modifierDocteur(request);

		request.setAttribute("validationModification", validationModification);
		request.setAttribute("utilisateur", docteur);
		request.setAttribute("Centre_Specialite", docteur.getCentre_Specialite());

		this.getServletContext().getRequestDispatcher("/WEB-INF/GererCompteDocteur.jsp").forward(request, response);

	}

}
