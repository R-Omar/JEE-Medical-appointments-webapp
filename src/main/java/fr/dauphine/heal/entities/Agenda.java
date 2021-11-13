package fr.dauphine.heal.entities;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "agenda")
public class Agenda {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_agenda")
	private int id;

	private boolean actif;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_centre_medical")
	private CentreMedical centreMedical;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_specialite")
	private Specialite specialite;

	@OneToMany(mappedBy = "agenda", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<RendezVous> rendezVous;

	@ManyToOne // empty
	@JoinColumn(name = "id_docteur")
	private Docteur docteur;

	public List<RendezVous> getRendezVous() {
		return rendezVous;
	}

	public void setRendezVous(List<RendezVous> rendezVous) {
		this.rendezVous = rendezVous;
	}

	public CentreMedical getCentreMedical() {
		return centreMedical;
	}

	public void setCentreMedical(CentreMedical centreMedical) {
		this.centreMedical = centreMedical;
	}

	public Docteur getDocteur() {
		return docteur;
	}

	public void setDocteur(Docteur docteur) {
		this.docteur = docteur;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isActif() {
		return actif;
	}

	public void setActif(boolean actif) {
		this.actif = actif;
	}

	public Specialite getSpecialite() {
		return specialite;
	}

	public void setSpecialite(Specialite specialite) {
		this.specialite = specialite;
	}

}
