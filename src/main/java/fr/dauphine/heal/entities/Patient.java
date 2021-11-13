package fr.dauphine.heal.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "patient")
@PrimaryKeyJoinColumn(name = "id_patient")
public class Patient extends Utilisateur {
	private String nom;
	private String prenom;
	private String telephone;
	private String adresse;
	private int anneeDeNaissance;

	@Column(name = "compte_actif")
	private boolean compteActif;

	public boolean isCompteActif() {
		return compteActif;
	}

	public void setCompteActif(boolean compteActif) {
		this.compteActif = compteActif;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public int getAnneeDeNaissance() {
		return anneeDeNaissance;
	}

	public void setAnneeDeNaissance(int anneeDeNaissance) {
		this.anneeDeNaissance = anneeDeNaissance;
	}

}
