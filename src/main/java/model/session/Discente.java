package model.session;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HB_DISCENTE")
public class Discente {
	
	
	@Column(name = "matricola")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int matricola;
	
	@Column(name = "nome")
	private String name;
	
	@Column(name = "cognome")
	private String cognome;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = 
        { 
                CascadeType.DETACH, 
                CascadeType.MERGE, 
                CascadeType.REFRESH, 
                CascadeType.PERSIST 
        },targetEntity = Corso.class) 
	 @JoinTable( 
	  name = "HB_DISCENTI_CORSO", 
	  joinColumns = {@JoinColumn(name = "matricola")}, 
	  inverseJoinColumns = {@JoinColumn(name = "id")}, 
	  foreignKey = @javax.persistence.ForeignKey(ConstraintMode.CONSTRAINT), 
	  inverseForeignKey = @javax.persistence.ForeignKey(ConstraintMode.CONSTRAINT))
	private Set<Corso> corsi = new HashSet<>();
	
	public int getMatricola() {
		return matricola;
	}

	public void setId(int matricola) {
		this.matricola = matricola;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	
	public String getNome() {
		return name;
	}

	public void setNome(String nome) {
		this.name = nome;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Corso> getCorsi() {
		return corsi;
	}

	public void setCorsi(Set<Corso> corsi) {
		this.corsi = corsi;
	}

	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}

}
