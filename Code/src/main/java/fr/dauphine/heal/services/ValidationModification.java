package fr.dauphine.heal.services;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import fr.dauphine.heal.dao.DAO;
import fr.dauphine.heal.entities.Docteur;
import fr.dauphine.heal.entities.Patient;
import fr.dauphine.heal.entities.Utilisateur;

public class ValidationModification {

	private String resultat;

	private Map<String, String> erreurs = new HashMap<String, String>();

	private DAO dao;

	public ValidationModification(DAO dao) {
		this.dao = dao;
	}

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getResultat() {
		return resultat;
	}

	public Patient modifierPatient(HttpServletRequest request) {
		String email = request.getParameter("email");
		String motDePasse = request.getParameter("motdepasse");
		String confirmation = request.getParameter("confirmation");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String anneeDeNaissance = request.getParameter("anneedenaissance");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");

		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("utilisateur");

		try {
			if (emailValide(email, patient.getEmail()))
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
				dao.update(patient);
				resultat = "Vos informations ont été modifié avec succés";
			} else {
				resultat = "Meci de vérifier les informations saisis";
			}
		} catch (Exception e) {
			resultat = "Échec de l'inscription : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
			System.out.println(e.getMessage().toString());
		}
		return patient;
	}

	public Docteur modifierDocteur(HttpServletRequest request) {
		String email = request.getParameter("email");
		String motDePasse = request.getParameter("motdepasse");
		String confirmation = request.getParameter("confirmation");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");

		HttpSession session = request.getSession();
		Docteur docteur = (Docteur) session.getAttribute("utilisateur");

		try {
			if (emailValide(email, docteur.getEmail()))
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

				dao.update(docteur);
				resultat = "Vos informations ont été modifié avec succés";

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

	private boolean emailValide(String nouveauEemail, String ancienEmail) {
		Utilisateur utilisateurTrouve = dao.findUserByEmail(nouveauEemail);
		if (!nouveauEemail.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
			erreurs.put("email", "Merci de saisir une adresse mail.");
			return false;
		} else if (utilisateurTrouve != null && !utilisateurTrouve.getEmail().equals(ancienEmail)) {
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
