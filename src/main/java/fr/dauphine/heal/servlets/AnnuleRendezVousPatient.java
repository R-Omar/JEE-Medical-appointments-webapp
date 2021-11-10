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
import fr.dauphine.heal.entities.RendezVousAnnule;

@WebServlet("/AnnuleRendezVousPatient")
public class AnnuleRendezVousPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	public AnnuleRendezVousPatient() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Patient patient = (Patient) request.getSession().getAttribute("utilisateur");

		if (patient != null) {

			int rdvToCancelId = Integer.parseInt(request.getParameter("rdvToCancelId"));

			RendezVous rdvToCancel = dao.getRendezVousByID(rdvToCancelId);

			RendezVousAnnule rdvCanceled = new RendezVousAnnule();
			rdvCanceled.setAgenda(rdvToCancel.getAgenda());
			rdvCanceled.setDate(rdvToCancel.getDate());
			rdvCanceled.setPatient(patient);

			rdvToCancel.setPatient(null);
			rdvToCancel.setStatus("disponible");

			dao.update(rdvToCancel);
			dao.persist(rdvCanceled);
			request.setAttribute("rdvCanceledMsg", "rendez vous du " + rdvCanceled.getDate().toString()
					+ " avec le docteur " + rdvCanceled.getAgenda().getDocteur().getNom() + " a été annulé");
			List<RendezVous> listRdv = dao.getRendezVousByPatientId(patient.getIdUtilisateur());
			request.setAttribute("listRdv", listRdv);
			request.setAttribute("patient", patient);

			this.getServletContext().getRequestDispatcher("/WEB-INF/RendezVousPatient.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
