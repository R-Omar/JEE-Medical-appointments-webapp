package fr.dauphine.heal.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "centre_medical")
public class CentreMedical {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_centre_medicale")
	private int idCentreMedical;

	private String nom;

	private String adresse;
	private String telephone;

	@ManyToMany(mappedBy = "Centre_Specialite")
	private List<Docteur> docteurs;

	public int getIdCentreMedical() {
		return idCentreMedical;
	}

	public void setIdCentreMedical(int idCentreMedical) {
		this.idCentreMedical = idCentreMedical;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public List<Docteur> getDocteurs() {
		return docteurs;
	}

	public void setDocteurs(List<Docteur> docteurs) {
		this.docteurs = docteurs;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}
