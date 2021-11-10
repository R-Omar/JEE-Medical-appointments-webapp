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
import fr.dauphine.heal.entities.RendezVous;

@WebServlet("/ReserverRendezVous")
public class ReserverRendezVous extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("utilisateur");

		if (patient != null) {
			RendezVous rendezVous = dao.getRendezVousByID(Integer.parseInt(request.getParameter("idRv")));
			rendezVous.setPatient(patient);
			rendezVous.setStatus("reservé");
			dao.update(rendezVous);
		}

		response.sendRedirect(request.getContextPath() + "/RendezVousPatient");

	}

}
