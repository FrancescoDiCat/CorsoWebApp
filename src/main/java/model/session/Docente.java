package model.session;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HB_DOCENTE")
public class Docente {
	
//	public static final String PROPERTY_matricola = "titolo_di_studio";

	

	@Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "cognome")
	private String cognome;

	@Column(name = "nome")
	private String nome;
	
	@OneToMany(mappedBy = "docente", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Corso> corsi = new ArrayList<Corso>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Corso> getCorsi() {
		return corsi;
	}

	public void setCorsi(List<Corso> corsi) {
		this.corsi = corsi;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String toString() {
		return this.nome+"  "+this.cognome;
	}

//	public String getTitoloDiStudio() {
//		return titoloDiStudio;
//	}
//
//	public void setTitoloDiStudio(String titoloDiStudio) {
//		this.titoloDiStudio = titoloDiStudio;
//	}



}
