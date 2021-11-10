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
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.entities.Utilisateur;

@WebServlet("/Connexion")
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/Connexion.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Utilisateur utilisateur = new Utilisateur();
		utilisateur.setEmail(request.getParameter("email"));
		utilisateur.setMotDePasse(request.getParameter("motdepasse"));
		Utilisateur resultat = dao.verifierUtilisateur(utilisateur);

		if (resultat != null) {
			HttpSession session = request.getSession();
			if (resultat.getTypeUtilisateur().equals("patient")) {
				Patient patient = new Patient();
				patient = dao.getPatientByID(resultat.getIdUtilisateur());
				session.setAttribute("utilisateur", patient);
			} else if (resultat.getTypeUtilisateur().equals("docteur")) {
				Docteur docteur = new Docteur();
				docteur = dao.getDocteurByID(resultat.getIdUtilisateur());
				session.setAttribute("utilisateur", docteur);

			} else if (resultat.getTypeUtilisateur().equals("admin")) {
				session.setAttribute("utilisateur", resultat);
			}
			response.sendRedirect(request.getContextPath() + "/");

		} else {
			request.setAttribute("erreur", "Identifiants incorrects, merci de réessayer à nouveau");
			this.getServletContext().getRequestDispatcher("/WEB-INF/Connexion.jsp").forward(request, response);
		}

	}

}
