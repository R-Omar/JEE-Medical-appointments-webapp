package fr.dauphine.heal.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
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
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.entities.RendezVous;
import fr.dauphine.heal.entities.Specialite;

@WebServlet("/RechercherRendezVous")
public class RechercherRendezVous extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("utilisateur");
		if (patient != null) {
			List<Specialite> specialites = dao.getToutesLesSpecialites();
			List<CentreMedical> centreMedicaux = dao.getTousLesCentres();
			request.setAttribute("centreMedicaux", centreMedicaux);
			request.setAttribute("specialites", specialites);
			this.getServletContext().getRequestDispatcher("/WEB-INF/RechercherRendezVous.jsp").forward(request,
					response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Specialite> specialites = dao.getToutesLesSpecialites();
		List<CentreMedical> centreMedicaux = dao.getTousLesCentres();
		request.setAttribute("centreMedicaux", centreMedicaux);
		request.setAttribute("specialites", specialites);

		List<RendezVous> rendezVous = new ArrayList<RendezVous>();

		String nomDocteur = request.getParameter("nomdocteur");
		String specialiteId = request.getParameter("specialite");
		String centreMedicalId = request.getParameter("centremedical");
		String date = request.getParameter("date");

		try {
			rendezVous = dao.getRendezVousDispoByCriterias(nomDocteur, specialiteId, centreMedicalId, date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		request.setAttribute("rendezVous", rendezVous);

		this.getServletContext().getRequestDispatcher("/WEB-INF/RechercherRendezVous.jsp").forward(request, response);

	}

}
