package fr.dauphine.heal.entities;

import javax.persistence.*;

@Entity
@Table(name = "specialite")
public class Specialite {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_specialite")
	private int idSpecialite;
	private String libelle;

	public int getIdSpecialite() {
		return idSpecialite;
	}

	public void setIdSpecialite(int idSpecialite) {
		this.idSpecialite = idSpecialite;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

}
