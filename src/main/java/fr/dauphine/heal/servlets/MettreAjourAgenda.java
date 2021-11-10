package fr.dauphine.heal.servlets;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.Agenda;
import fr.dauphine.heal.entities.RendezVous;
import fr.dauphine.heal.util.EnregCalen;

@WebServlet("/MettreAjourAgenda")
public class MettreAjourAgenda extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	DAO dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("action").equals("valider")) {
			Gson gson = new Gson();
			Type userListType = new TypeToken<ArrayList<EnregCalen>>() {
			}.getType();

			ArrayList<EnregCalen> ECs = gson.fromJson(request.getParameter("jsonData"), userListType);

			for (EnregCalen EC : ECs) {
				if (!isNumeric(EC.getId())) {
					RendezVous rv = new RendezVous();
					Agenda agenda = new Agenda();
					agenda.setId(Integer.parseInt(request.getParameter("idAg")));
					rv.setAgenda(agenda);
					if (EC.getBackgroundColor().equals("green"))
						rv.setStatus("disponible");
					else if (EC.getBackgroundColor().equals("red"))
						rv.setStatus("indisponible");
					rv.setDate(EC.getStart());
					dao.persist(rv);
				}
			}
		}

		else if (request.getParameter("action").equals("actif")) {
			Agenda agenda = dao.getAgendabyID(Integer.parseInt(request.getParameter("idAg")));
			if (agenda.isActif() == true) {
				agenda.setActif(false);
			} else if (agenda.isActif() == false) {
				agenda.setActif(true);
			}
			dao.update(agenda);

		}

	}

	public boolean isNumeric(String strNum) {
		if (strNum == null) {
			return false;
		}
		try {
			@SuppressWarnings("unused")
			double d = Double.parseDouble(strNum);
		} catch (NumberFormatException nfe) {
			return false;
		}
		return true;
	}

}
