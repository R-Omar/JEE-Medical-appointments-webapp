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
import fr.dauphine.heal.entities.Agenda;
import fr.dauphine.heal.entities.Docteur;
import fr.dauphine.heal.entities.RendezVous;

@WebServlet("/GererAgenda")
public class GererAgenda extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Docteur docteur = (Docteur) session.getAttribute("utilisateur");

		if (docteur != null) {
			if (request.getParameter("idAg") != null) {
				Agenda agenda = dao.getAgendabyID(Integer.parseInt(request.getParameter("idAg")));
				request.setAttribute("agenda", agenda);
				List<RendezVous> rendezvous = dao.getRendezVousByDocteurId(docteur.getIdUtilisateur());
				request.setAttribute("rendezvous", rendezvous);
			}
			this.getServletContext().getRequestDispatcher("/WEB-INF/GererAgenda.jsp").forward(request, response);
		}
	}

}
