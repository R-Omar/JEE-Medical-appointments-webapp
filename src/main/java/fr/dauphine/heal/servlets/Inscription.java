package fr.dauphine.heal.servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.services.ValidationInscription;

@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/Inscription.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * Préparation de l'objet de valaidation de l'inscription qui enregistre le
		 * patient dans la BD avec l'objet dao passer en paramètre
		 */
		ValidationInscription validationInscription = new ValidationInscription(dao);

		/*
		 * Traitement de la requête et récupération du bean en résultant, si tous les
		 * informations sont correctes le patient est enregistrer dans la base
		 */
		Patient patient = validationInscription.inscrirePatient(request);

		request.setAttribute("validationInscription", validationInscription);
		request.setAttribute("patient", patient);
		this.getServletContext().getRequestDispatcher("/WEB-INF/Inscription.jsp").forward(request, response);

	}
}
