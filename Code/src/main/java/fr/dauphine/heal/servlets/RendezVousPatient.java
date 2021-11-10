package fr.dauphine.heal.servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.entities.RendezVous;

@WebServlet("/RendezVousPatient")
public class RendezVousPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Patient patient = (Patient) request.getSession().getAttribute("utilisateur");

		if (patient != null) {
			List<RendezVous> listRdv = dao.getRendezVousByPatientId(patient.getIdUtilisateur());
			request.setAttribute("listRdv", listRdv);
			request.setAttribute("patient", patient);
			request.setAttribute("rdvCanceledMsg", "");
			this.getServletContext().getRequestDispatcher("/WEB-INF/RendezVousPatient.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
