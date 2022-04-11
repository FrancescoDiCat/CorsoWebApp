package model.session;


import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name = "HB_CORSO")
public class Corso {

	@Column(name= "id")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_corso;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "data_inzio")
	private Calendar data_inizio;
	
	@Column(name = "nome")
	private String nome;
	
	@Column(name="durata")
	private int durata;
	

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH,
			CascadeType.PERSIST }, targetEntity = Docente.class)
	private Docente docente;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH,
			CascadeType.PERSIST }, targetEntity = Discente.class)
	@JoinTable(name = "HB_DISCENTI_CORSO", joinColumns = { @JoinColumn(name = "id") }, inverseJoinColumns = {
			@JoinColumn(name = "matricola") }, foreignKey = @javax.persistence.ForeignKey(ConstraintMode.CONSTRAINT), inverseForeignKey = @javax.persistence.ForeignKey(ConstraintMode.CONSTRAINT))
	Set<Discente> discenti = new HashSet<>();
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH,
			CascadeType.PERSIST }, targetEntity = Aula.class)
	private Aula aula;
	
	

	public Aula getAula() {
		return aula;
	}

	public void setAula(Aula aula) {
		this.aula = aula;
	}

	public Set<Discente> getDiscenti() {
		return discenti;
	}

	public void setDiscenti(Set<Discente> discenti) {
		this.discenti = discenti;
	}

	public int getId_corso() {
		return id_corso;
	}

	public void setId_corso(int id_corso) {
		this.id_corso = id_corso;
	}

	public Calendar getData_inizio() {
		return data_inizio;
	}

	public void setData_inizio(Calendar data_inizio) {
		this.data_inizio = data_inizio;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getDurata() {
		return durata;
	}

	public void setDurata(int durata) {
		this.durata = durata;
	}

	public Docente getDocente() {
		return docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}
	
}
