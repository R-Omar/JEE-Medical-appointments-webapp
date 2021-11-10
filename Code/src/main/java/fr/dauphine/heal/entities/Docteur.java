package fr.dauphine.heal.entities;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapKeyJoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "id_docteur")
public class Docteur extends Utilisateur {

	private String nom;
	private String prenom;
	private String telephone;
	private String adresse;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "Centre_Docteur_Specialite", joinColumns = @JoinColumn(name = "id_docteur"), inverseJoinColumns = @JoinColumn(name = "id_specialite"))
	@MapKeyJoinColumn(name = "id_centre_medicale")
	private Map<CentreMedical, Specialite> Centre_Specialite = new HashMap<CentreMedical, Specialite>();

	@OneToMany(mappedBy = "docteur", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Agenda> agendas;

	public List<Agenda> getAgendas() {
		return agendas;
	}

	public void setAgendas(List<Agenda> agendas) {
		this.agendas = agendas;
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

	public Map<CentreMedical, Specialite> getCentre_Specialite() {
		return Centre_Specialite;
	}

	public void setCentre_Specialite(Map<CentreMedical, Specialite> centre_Specialite) {
		Centre_Specialite = centre_Specialite;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

}
