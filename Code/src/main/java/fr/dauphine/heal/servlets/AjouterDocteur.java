package fr.dauphine.heal.servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.CentreMedical;
import fr.dauphine.heal.entities.Docteur;
import fr.dauphine.heal.entities.Specialite;
import fr.dauphine.heal.entities.Utilisateur;
import fr.dauphine.heal.services.ValidationInscription;

@WebServlet("/AjouterDocteur")
public class AjouterDocteur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

		if (utilisateur != null && utilisateur.getTypeUtilisateur().equals("admin")) {
			List<Specialite> specialites = dao.getToutesLesSpecialites();
			List<CentreMedical> centreMedicaux = dao.getTousLesCentres();
			request.setAttribute("centreMedicaux", centreMedicaux);
			request.setAttribute("specialites", specialites);
			this.getServletContext().getRequestDispatcher("/WEB-INF/AjouterDocteur.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ValidationInscription validationInscription = new ValidationInscription(dao);

		Docteur docteur = validationInscription.inscrireDocteur(request);

		request.setAttribute("validationInscription", validationInscription);
		request.setAttribute("docteur", docteur);
		List<Specialite> specialites = dao.getToutesLesSpecialites();
		List<CentreMedical> centreMedicaux = dao.getTousLesCentres();
		request.setAttribute("centreMedicaux", centreMedicaux);
		request.setAttribute("specialites", specialites);
		this.getServletContext().getRequestDispatcher("/WEB-INF/AjouterDocteur.jsp").forward(request, response);

	}

}
