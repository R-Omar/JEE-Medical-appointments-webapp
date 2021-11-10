package fr.dauphine.heal.services;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.Agenda;
import fr.dauphine.heal.entities.CentreMedical;
import fr.dauphine.heal.entities.Docteur;
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.entities.Specialite;

public final class ValidationInscription {

	private String resultat;

	private Map<String, String> erreurs = new HashMap<String, String>();

	private DAO dao;

	public ValidationInscription(DAO dao) {
		this.dao = dao;
	}

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getResultat() {
		return resultat;
	}

	public Patient inscrirePatient(HttpServletRequest request) {
		String email = request.getParameter("email");
		String motDePasse = request.getParameter("motdepasse");
		String confirmation = request.getParameter("confirmation");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String anneeDeNaissance = request.getParameter("anneedenaissance");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");

		Patient patient = new Patient();

		try {
			if (emailValide(email))
				patient.setEmail(email);
			if (motsDePasseValide(motDePasse, confirmation))
				patient.setMotDePasse(motDePasse);
			if (nomValide(nom))
				patient.setNom(nom);
			if (prenomValide(prenom))
				patient.setPrenom(prenom);
			if (telephoneValide(telephone))
				patient.setTelephone(telephone);
			if (anneeDeNaissanceValide(anneeDeNaissance))
				patient.setAnneeDeNaissance(Integer.parseInt(anneeDeNaissance));

			patient.setAdresse(adresse);
			if (erreurs.isEmpty()) {
				patient.setTypeUtilisateur("patient");
				patient.setCompteActif(true);
				dao.persist(patient);
				resultat = "Succès de l'inscription, veuillez vous connecter";
			} else {
				resultat = "Meci de vérifier les informations saisis";
			}
		} catch (Exception e) {
			resultat = "Échec de l'inscription : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
			System.out.println(e.getMessage().toString());
		}
		return patient;
	}

	public Docteur inscrireDocteur(HttpServletRequest request) {
		String email = request.getParameter("email");
		String motDePasse = request.getParameter("motdepasse");
		String confirmation = request.getParameter("confirmation");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		String[] centreMedicaux = request.getParameterValues("centremedical");
		String[] specialites = request.getParameterValues("specialite");

		Docteur docteur = new Docteur();
		try {
			if (emailValide(email))
				docteur.setEmail(email);
			if (motsDePasseValide(motDePasse, confirmation))
				docteur.setMotDePasse(motDePasse);
			if (nomValide(nom))
				docteur.setNom(nom);
			if (prenomValide(prenom))
				docteur.setPrenom(prenom);
			if (telephoneValide(telephone))
				docteur.setTelephone(telephone);
			docteur.setAdresse(adresse);
			if (erreurs.isEmpty()) {
				docteur.setTypeUtilisateur("docteur");

				// ajout des centres medicaux et les specialites au docteur
				Map<CentreMedical, Specialite> Centre_Specialite = new HashMap<CentreMedical, Specialite>();
				for (int i = 0; i < centreMedicaux.length; i++) {
					if (!centreMedicaux[i].equals("") && !specialites[i].equals("")) {
						CentreMedical cm = new CentreMedical();
						Specialite sp = new Specialite();
						cm.setIdCentreMedical(Integer.parseInt(centreMedicaux[i]));
						sp.setIdSpecialite(Integer.parseInt(specialites[i]));
						Centre_Specialite.put(cm, sp);
					}

				}
				docteur.setCentre_Specialite(Centre_Specialite);

				dao.persist(docteur);

				// creation d'un agenda pour chaque centre
				for (Map.Entry<CentreMedical, Specialite> entry : Centre_Specialite.entrySet()) {
					Agenda agenda = new Agenda();
					agenda.setActif(false);
					agenda.setDocteur(docteur);
					agenda.setCentreMedical(entry.getKey());
					agenda.setSpecialite(entry.getValue());
					dao.persist(agenda);
				}

				resultat = "Compte docteur crée avec succés";
			} else {
				resultat = "Meci de vérifier les informations saisis";
			}
		} catch (

		Exception e) {
			resultat = "Échec de l'inscription : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
			System.out.println(e.getMessage().toString());
		}

		return docteur;

	}

	private boolean emailValide(String email) {
		if (!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
			erreurs.put("email", "Merci de saisir une adresse mail.");
			return false;
		} else if (dao.findUserByEmail(email) != null) {
			erreurs.put("email", "Cette adresse email existe déjà, merci de saisir une autre");
			return false;
		} else {
			return true;
		}
	}

	private boolean motsDePasseValide(String motDePasse, String confirmation) {
		if (!motDePasse.equals(confirmation)) {
			erreurs.put("motdepasse", "Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
			erreurs.put("confirmation", null);
			return false;
		} else if (motDePasse.length() < 3) {
			erreurs.put("motdepasse", "Les mots de passe doivent contenir au moins 3 caractères.");
			return false;
		} else {
			return true;
		}
	}

	private boolean nomValide(String nom) {
		if (!nom.matches("[a-zA-Z]+")) {
			erreurs.put("nom", "Le nom ne doit contenir que des caractères ");
			return false;
		} else {
			return true;
		}
	}

	private boolean prenomValide(String prenom) {
		if (!prenom.matches("[a-zA-Z]+")) {
			erreurs.put("prenom", "Le prénom ne doit contenir que des caractères ");
			return false;
		} else {
			return true;
		}
	}

	private boolean telephoneValide(String telephone) {
		if (!telephone.matches("(0|\\\\+33|0033)[1-9][0-9]{8}")) {
			erreurs.put("telephone", "Merci de saisir un numéro de téléphone français correcte");
			return false;
		} else {
			return true;
		}
	}

	private boolean anneeDeNaissanceValide(String anneeDeNaissance) {
		try {
			int annee = Integer.parseInt(anneeDeNaissance);
			int anneeEnCours = Calendar.getInstance().get(Calendar.YEAR);
			if (annee >= anneeEnCours || (anneeEnCours - annee) >= 120) {
				erreurs.put("anneedenaissance", "Merci de saisir une année de naissance correcte");
				return false;
			} else {
				return true;
			}

		} catch (NumberFormatException numberFormatException) {
			erreurs.put("anneedenaissance", "Merci de saisir une année de naissance correcte");
			return false;
		}
	}
}