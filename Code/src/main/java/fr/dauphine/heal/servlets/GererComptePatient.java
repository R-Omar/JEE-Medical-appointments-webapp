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
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.services.ValidationModification;

@WebServlet("/GererComptePatient")
public class GererComptePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("utilisateur");
		if (patient != null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/GererComptePatient.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ValidationModification validationModification = new ValidationModification(dao);

		Patient patient = validationModification.modifierPatient(request);

		request.setAttribute("validationModification", validationModification);
		request.setAttribute("utilisateur", patient);

		this.getServletContext().getRequestDispatcher("/WEB-INF/GererComptePatient.jsp").forward(request, response);

	}

}
