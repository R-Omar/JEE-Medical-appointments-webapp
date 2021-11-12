package fr.dauphine.heal.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import fr.dauphine.heal.entities.Agenda;
import fr.dauphine.heal.entities.CentreMedical;
import fr.dauphine.heal.entities.Docteur;
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.entities.RendezVous;
import fr.dauphine.heal.entities.Specialite;
import fr.dauphine.heal.entities.Utilisateur;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class DAO {
	@PersistenceContext
	EntityManager em;

	public void persist(Object object) {
		try {
			em.persist(object);

		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
		}
	}

	public void update(Object object) {
		try {
			em.merge(object);
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
		}
	}

	public void delete(Object object) {
		try {
			em.remove(object);
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
		}

	}

	public Utilisateur verifierUtilisateur(Utilisateur utilisateur) {
		Query jpqlQuery = em
				.createQuery("SELECT u FROM Utilisateur u WHERE u.email=:email AND u.motDePasse=:motDePasse");
		jpqlQuery.setParameter("email", utilisateur.getEmail());
		jpqlQuery.setParameter("motDePasse", utilisateur.getMotDePasse());
		try {
			return (Utilisateur) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.print(e.getMessage().toString());
			return null;
		}
	}

	public Docteur getDocteurByID(int id) {
		Query jpqlQuery = em.createQuery("SELECT d FROM Docteur d WHERE d.idUtilisateur=:id");
		jpqlQuery.setParameter("id", id);
		try {
			return (Docteur) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public Patient getPatientByID(int id) {
		Query jpqlQuery = em.createQuery("SELECT p FROM Patient p WHERE p.idUtilisateur=:id");
		jpqlQuery.setParameter("id", id);
		try {
			return (Patient) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public Specialite getSpecialityByName(String name) {
		Query jpqlQuery = em.createQuery("SELECT s FROM Specialite s WHERE s.libelle=:libelle");
		jpqlQuery.setParameter("libelle", name);
		try {
			return (Specialite) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public List<RendezVous> getRendezVous() {
		Query jpqlQuery = em.createQuery("SELECT r FROM RendezVous r");
		try {
			List<RendezVous> rendezVous = jpqlQuery.getResultList();
			return rendezVous;
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public void deleteDocteurByID(int id) {
		Query jpqlQuery = em.createQuery("SELECT d FROM Docteur d WHERE d.idUtilisateur=:id");
		jpqlQuery.setParameter("id", id);
		try {
			em.remove((Docteur) jpqlQuery.getSingleResult());
		} catch (NoResultException e) {
			System.out.println(e.getMessage().toString());
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
		}
	}

	public Agenda getAgendabyID(int id) {
		Query jpqlQuery = em.createQuery("SELECT a FROM Agenda a WHERE a.id=:id");
		jpqlQuery.setParameter("id", id);
		try {
			return (Agenda) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}

	}

	public List<RendezVous> getRendezVousByDocteurId(int id) {
		Query jpqlQuery = em.createQuery("SELECT r FROM RendezVous r WHERE r.agenda.docteur.id=:id");
		jpqlQuery.setParameter("id", id);
		try {
			List<RendezVous> rendezVous = jpqlQuery.getResultList();
			return rendezVous;
		} catch (NoResultException e) {
			System.out.println(e.getMessage().toString());
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}

	}

	public Utilisateur findUserByEmail(String email) {
		Query jpqlQuery = em.createQuery("SELECT u FROM Utilisateur u WHERE u.email=:email");
		jpqlQuery.setParameter("email", email);
		try {
			return (Utilisateur) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.print(e.getMessage().toString());
			return null;
		}
	}

	public Docteur findDocteurByEmail(String email) {
		Query jpqlQuery = em.createQuery("SELECT u FROM Utilisateur u WHERE u.email=:email");
		jpqlQuery.setParameter("email", email);
		try {
			return (Docteur) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.print(e.getMessage().toString());
			return null;
		}
	}

	public List<Specialite> getToutesLesSpecialites() {
		Query jpqlQuery = em.createQuery("SELECT s FROM Specialite s");
		try {
			List<Specialite> specialite = jpqlQuery.getResultList();
			return specialite;
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public List<CentreMedical> getTousLesCentres() {
		Query jpqlQuery = em.createQuery("SELECT c FROM CentreMedical c");
		try {
			List<CentreMedical> centreMedicaux = jpqlQuery.getResultList();
			return centreMedicaux;
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public List<RendezVous> getRendezVousDispoByCriterias(String nomDocteur, String specialiteId,
			String centreMedicalId, String date) throws ParseException {
		boolean setDate = false;

		String query = "SELECT r FROM RendezVous r WHERE r.status = 'disponible' AND r.agenda.actif = true";

		if (!nomDocteur.equals("")) {
			query = query.concat(" AND r.agenda.docteur.nom Like '" + nomDocteur + "'");
		}
		if (!specialiteId.equals("")) {
			query = query.concat(" AND r.agenda.specialite.idSpecialite = " + specialiteId);
		}
		if (!centreMedicalId.equals("")) {
			query = query.concat(" AND r.agenda.centreMedical.idCentreMedical = " + centreMedicalId);
		}
		if (!date.equals("")) {
			query = query.concat(" AND date(r.date) = :dateToSearch");
			setDate = true;
		}

		query = query.concat(" ORDER BY r.date");

		Query jpqlQuery = em.createQuery(query);
		if (setDate) {
			Date dateToSearch = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			jpqlQuery.setParameter("dateToSearch", dateToSearch, TemporalType.DATE);
		}
		try {
			List<RendezVous> rendezVous = jpqlQuery.getResultList();
			return rendezVous;
		} catch (NoResultException e) {
			System.out.println(e.getMessage().toString());
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public RendezVous getRendezVousByID(int id) {
		Query jpqlQuery = em.createQuery("SELECT r FROM RendezVous r WHERE r.id=:id");
		jpqlQuery.setParameter("id", id);
		try {
			return (RendezVous) jpqlQuery.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}

	public List<RendezVous> getRendezVousByPatientId(int id) {
		Query jpqlQuery = em.createQuery("SELECT r FROM RendezVous r WHERE r.patient.id=:id");
		jpqlQuery.setParameter("id", id);
		try {
			List<RendezVous> rendezVous = jpqlQuery.getResultList();
			return rendezVous;
		} catch (NoResultException e) {
			System.out.println(e.getMessage().toString());
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			return null;
		}
	}
}
